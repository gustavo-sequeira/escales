unit uModeloBase;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.TypInfo,
  System.Generics.Collections, Variants, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB;

type
  // Atributo que marca uma propriedade de objeto como chave estrangeira
  // ALocalField é o nome do campo local que guarda o ID (ex: 'ClienteID').
  TForeignKeyAttribute = class(TCustomAttribute)
  private
    FReferencedTable: string;
    FReferencedColumn: string;
    FLocalField: string;
  public
    constructor Create(const ATable, AColumn: string; const ALocalField: string = '');
    property ReferencedTable: string read FReferencedTable;
    property ReferencedColumn: string read FReferencedColumn;
    property LocalField: string read FLocalField;
  end;

  TModeloBase = class
  private
    FID: Integer;
  protected
    // helpers
    class function GetTableName: string; virtual;
    function GetFieldList: TArray<string>;
    procedure FillParamsFromProperties(AQuery: TFDQuery);
    function PropertyValueAsVariant(const Prop: TRttiProperty): Variant;
    procedure LoadForeignKeyObjectsFromQuery(AQuery: TFDQuery; AContext: TRttiContext; AType: TRttiType);
    procedure EnsureObjectPropertyInstance(const Prop: TRttiProperty);
    function FindLocalFieldNameForProp(const Prop: TRttiProperty; const Attr: TForeignKeyAttribute): string;
  public
    property ID: Integer read FID write FID;

    procedure LoadFromID(AID: Integer); virtual;
    procedure Save; virtual;
    procedure Delete; virtual;

    function ToQuery: TFDQuery;
    class function ListToQuery(const AWhere: string = ''): TFDQuery; virtual;
    procedure ListForeignKeys(AClass: TClass);
  end;

implementation

uses
  uDmPrincipal;

{ TForeignKeyAttribute }

constructor TForeignKeyAttribute.Create(const ATable, AColumn: string; const ALocalField: string);
begin
  inherited Create;
  FReferencedTable := ATable;
  FReferencedColumn := AColumn;
  FLocalField := ALocalField;
end;

{ TModeloBase }

class function TModeloBase.GetTableName: string;
begin
  Result := UpperCase(Copy(Self.ClassName, 2, MaxInt));
end;

function TModeloBase.GetFieldList: TArray<string>;
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  L: TList<string>;
  Attr: TCustomAttribute;
  IsFKObject: Boolean;
begin
  L := TList<string>.Create;
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    for Prop in RType.GetProperties do
    begin
      if (Prop.Visibility <> mvPublished) then
        Continue;
      if SameText(Prop.Name, 'ID') then
        Continue;

      // Ignora propriedades do tipo objeto (tkClass) que representam FKs —
      // mas inclui o campo local que guarda o FK (ex: ClienteID)
      IsFKObject := False;
      for Attr in Prop.GetAttributes do
        if Attr is TForeignKeyAttribute then
        begin
          IsFKObject := True;
          Break;
        end;

      if IsFKObject then
        Continue; // local field (ex: ClienteID) deverá estar presente como propriedade separada

      // Aceita propriedades simples (integer, float, string, datetime)
      case Prop.PropertyType.TypeKind of
        tkInteger, tkInt64, tkFloat, tkUString, tkLString, tkWString, tkString:
          L.Add(Prop.Name);
      end;
    end;

    Result := L.ToArray;
  finally
    Ctx.Free;
    L.Free;
  end;
end;

function TModeloBase.PropertyValueAsVariant(const Prop: TRttiProperty): Variant;
var
  V: TValue;
begin
  V := Prop.GetValue(Self);
  if V.IsEmpty then
    Exit(Null);

  case V.Kind of
    tkInteger, tkInt64:
      Result := V.AsInteger;
    tkFloat:
      if Prop.PropertyType.Handle = TypeInfo(TDateTime) then
        Result := V.AsExtended
      else
        Result := V.AsExtended;
    tkUString, tkLString, tkWString, tkString:
      Result := V.ToString;
    else
      Result := V.ToString;
  end;
end;

procedure TModeloBase.FillParamsFromProperties(AQuery: TFDQuery);
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  Attr: TCustomAttribute;
  PName: string;
  Val: Variant;
  FKLocalField: string;
  FKProp: TRttiProperty;
  i: Integer;
begin
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);

    // Primeiro: se alguma propriedade de objeto tiver instância, salve-a antes
    for Prop in RType.GetProperties do
    begin
      for Attr in Prop.GetAttributes do
        if Attr is TForeignKeyAttribute then
        begin
          // local field name (ex ClienteID). Se a propriedade objeto existir e for TModeloBase, salve e atualize o local field
          FKLocalField := FindLocalFieldNameForProp(Prop, TForeignKeyAttribute(Attr));
          // procurar propriedade que contém o ID local
          FKProp := nil;
          for i := 0 to Pred(Length(RType.GetProperties)) do
            if SameText(RType.GetProperties[i].Name, FKLocalField) then
            begin
              FKProp := RType.GetProperties[i];
              Break;
            end;

          // se houver instância do objeto, salva-a e seta o ID local
          if Prop.PropertyType.TypeKind = tkClass then
          begin
            if Prop.GetValue(Self).IsEmpty = False then
            begin
              // obtém o objeto e verifica se é TModeloBase
              if Prop.GetValue(Self).AsObject is TModeloBase then
              begin
                TModeloBase(Prop.GetValue(Self).AsObject).Save;
                if Assigned(FKProp) then
                  FKProp.SetValue(Self, TValue.From<Integer>(TModeloBase(Prop.GetValue(Self).AsObject).ID));
              end;
            end;
          end;
        end;
    end;

    // Depois: popula os parâmetros básicos (inclui campos locais de FK)
    for Prop in RType.GetProperties do
    begin
      if (Prop.Visibility <> mvPublished) then
        Continue;
      if SameText(Prop.Name, 'ID') then
        Continue;

      // aceita strings, inteiros, floats, e também propriedades que armazenam FK (ex ClienteID)
      case Prop.PropertyType.TypeKind of
        tkInteger, tkInt64, tkFloat, tkUString, tkLString, tkWString, tkString:
        begin
          PName := Prop.Name;
          Val := PropertyValueAsVariant(Prop);
          if AQuery.Params.FindParam(PName) = nil then
            AQuery.Params.CreateParam(ftUnknown, PName, ptInput);
          AQuery.ParamByName(PName).Value := Val;
        end;
      end;
    end;

    // ID param (for update/delete)
    if AQuery.Params.FindParam('ID') = nil then
      AQuery.Params.CreateParam(ftInteger, 'ID', ptInput);
    AQuery.ParamByName('ID').AsInteger := ID;
  finally
    Ctx.Free;
  end;
end;

procedure TModeloBase.LoadForeignKeyObjectsFromQuery(AQuery: TFDQuery; AContext: TRttiContext; AType: TRttiType);
var
  Prop: TRttiProperty;
  Attr: TCustomAttribute;
  LocalField, RefTable, RefColumn: string;
  localID: Integer;
  ObjClass: TClass;
  ObjInstance: TObject;
begin
  for Prop in AType.GetProperties do
  begin
    for Attr in Prop.GetAttributes do
      if Attr is TForeignKeyAttribute then
      begin
        LocalField := FindLocalFieldNameForProp(Prop, TForeignKeyAttribute(Attr));
        RefTable := TForeignKeyAttribute(Attr).ReferencedTable;
        RefColumn := TForeignKeyAttribute(Attr).ReferencedColumn;

        if (AQuery.FindField(LocalField) = nil) then
          Continue; // não encontrou campo local no select

        if AQuery.FieldByName(LocalField).IsNull then
          Continue;

        localID := AQuery.FieldByName(LocalField).AsInteger;

        // instanciar objeto da propriedade (assume que a classe é compatível com TModeloBase)
        if Prop.PropertyType.Handle <> nil then
        begin
          ObjClass := Prop.PropertyType.ClassType;
          if ObjClass.InheritsFrom(TModeloBase) then
          begin
            ObjInstance := ObjClass.Create;
            try
              // carrega pelo ID
              TModeloBase(ObjInstance).LoadFromID(localID);
              // seta no objeto atual
              Prop.SetValue(Self, TValue.From<TObject>(ObjInstance));
            except
              ObjInstance.Free;
              raise;
            end;
          end;
        end;
      end;
  end;
end;

function TModeloBase.FindLocalFieldNameForProp(const Prop: TRttiProperty; const Attr: TForeignKeyAttribute): string;
var
  Candidate: string;
begin
  // Ordem de resolução:
  // 1) se o atributo informou explicitamente o LocalField, usa ele
  // 2) senão tenta "<PropName>ID" (ex: Cliente -> ClienteID)
  // 3) senão tenta "<PropName>_id" e genericamente 'PropNameId'
  if (Attr <> nil) and (Attr.LocalField <> '') then
    Exit(Attr.LocalField);

  Candidate := Prop.Name + 'ID';
  Result := Candidate;
  // não há validação aqui; quem chama verifica se o campo existe no dataset
end;

procedure TModeloBase.EnsureObjectPropertyInstance(const Prop: TRttiProperty);
var
  Obj: TObject;
begin
  if Prop.PropertyType.TypeKind <> tkClass then
    Exit;

  if Prop.GetValue(Self).IsEmpty then
  begin
    // tenta criar instância caso seja descendente de TModeloBase
    if Prop.PropertyType.Handle <> nil then
    begin
      if Prop.PropertyType.ClassType.InheritsFrom(TModeloBase) then
      begin
        Obj := Prop.PropertyType.ClassType.Create;
        Prop.SetValue(Self, TValue.From<TObject>(Obj));
      end;
    end;
  end;
end;

procedure TModeloBase.LoadFromID(AID: Integer);
var
  vQuery: TFDQuery;
  ctx: TRttiContext;
  rType: TRttiType;
  prop: TRttiProperty;
begin
  vQuery := TFDQuery.Create(nil);
  ctx := TRttiContext.Create;
  try
    vQuery.Connection := dmPrincipal.FDConnection;
    vQuery.SQL.Text := Format('SELECT * FROM %s WHERE ID = :ID', [GetTableName]);
    vQuery.ParamByName('ID').AsInteger := AID;
    vQuery.Open;
    if vQuery.Eof then
      raise Exception.CreateFmt('Registro ID=%d não encontrado em %s', [AID, GetTableName]);

    // popula propriedades simples
    rType := ctx.GetType(Self.ClassType);
    for prop in rType.GetProperties do
    begin
      if (prop.Visibility <> mvPublished) or (SameText(prop.Name, 'ID')) then
        Continue;

      if vQuery.FindField(prop.Name) = nil then
        Continue;

      if vQuery.FieldByName(prop.Name).IsNull then
        Continue;

      case prop.PropertyType.TypeKind of
        tkInteger:
          prop.SetValue(Self, vQuery.FieldByName(prop.Name).AsInteger);
        tkFloat:
          if prop.PropertyType.Handle = TypeInfo(TDateTime) then
            prop.SetValue(Self, TValue.From<TDateTime>(vQuery.FieldByName(prop.Name).AsDateTime))
          else
            prop.SetValue(Self, vQuery.FieldByName(prop.Name).AsExtended);
        tkUString, tkWString, tkLString, tkString:
          prop.SetValue(Self, vQuery.FieldByName(prop.Name).AsString);
      end;
    end;

    // agora carrega objetos FK marcados com o atributo
    LoadForeignKeyObjectsFromQuery(vQuery, ctx, rType);

    ID := AID;
  finally
    ctx.Free;
    vQuery.Free;
  end;
end;

procedure TModeloBase.Save;
var
  vFields: TArray<string>;
  vQuery: TFDQuery;
  i: Integer;
  vSQLText: string;
begin
  vFields := GetFieldList;
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dmPrincipal.FDConnection;

    if ID > 0 then
    begin
      vSQLText := 'UPDATE ' + GetTableName + ' SET ';
      for i := 0 to High(vFields) do
      begin
        vSQLText := vSQLText + vFields[i] + ' = :' + vFields[i];
        if i < High(vFields) then
          vSQLText := vSQLText + ', ';
      end;
      vSQLText := vSQLText + ' WHERE ID = :ID';
      vQuery.SQL.Text := vSQLText;
      FillParamsFromProperties(vQuery);
      vQuery.ExecSQL;
    end
    else
    begin
      vSQLText := Format('INSERT INTO %s (', [GetTableName]);
      for i := 0 to High(vFields) do
      begin
        vSQLText := vSQLText + vFields[i];
        if i < High(vFields) then
          vSQLText := vSQLText + ', ';
      end;
      vSQLText := vSQLText + ') VALUES (';
      for i := 0 to High(vFields) do
      begin
        vSQLText := vSQLText + ':' + vFields[i];
        if i < High(vFields) then
          vSQLText := vSQLText + ', ';
      end;
      vSQLText := vSQLText + ')';

      vQuery.SQL.Text := vSQLText;
      FillParamsFromProperties(vQuery);
      vQuery.ExecSQL;

      // obtém o ID - adapte para seu SGBD (generator/RETURNING são melhores)
      vQuery.SQL.Text := Format('SELECT MAX(ID) AS ID FROM %s', [GetTableName]);
      vQuery.Open;
      if not vQuery.Eof then
        ID := vQuery.FieldByName('ID').AsInteger;
    end;
  finally
    vQuery.Free;
  end;
end;

procedure TModeloBase.Delete;
var
  vQuery: TFDQuery;
begin
  if ID <= 0 then
    Exit;
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dmPrincipal.FDConnection;
    vQuery.SQL.Text := Format('DELETE FROM %s WHERE ID = :ID', [GetTableName]);
    vQuery.ParamByName('ID').AsInteger := ID;
    vQuery.ExecSQL;
  finally
    vQuery.Free;
  end;
end;

function TModeloBase.ToQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmPrincipal.FDConnection;
  Result.SQL.Text := Format('SELECT * FROM %s WHERE ID = :ID', [GetTableName]);
  Result.ParamByName('ID').AsInteger := ID;
end;

class function TModeloBase.ListToQuery(const AWhere: string = ''): TFDQuery;
var
  vQuery: TFDQuery;
  vWhere: string;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := dmPrincipal.FDConnection;
  vWhere := AWhere;
  if vWhere <> '' then
    vWhere := ' WHERE ' + vWhere;
  vQuery.SQL.Text := Format('SELECT * FROM %s %s', [GetTableName, vWhere]);
  Result := vQuery;
end;

procedure TModeloBase.ListForeignKeys(AClass: TClass);
var
  ctx: TRttiContext;
  rType: TRttiType;
  prop: TRttiProperty;
  attr: TCustomAttribute;
begin
  ctx := TRttiContext.Create;
  try
    rType := ctx.GetType(AClass);

    for prop in rType.GetProperties do
      for attr in prop.GetAttributes do
        if attr is TForeignKeyAttribute then
        begin
          Writeln(Format('Propriedade %s -> FK para %s(%s) [local: %s]'
            , [prop.Name,
               TForeignKeyAttribute(attr).ReferencedTable,
               TForeignKeyAttribute(attr).ReferencedColumn,
               TForeignKeyAttribute(attr).LocalField]));
        end;
  finally
    ctx.Free;
  end;
end;

end.


