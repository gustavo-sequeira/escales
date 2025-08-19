unit uModeloBase;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.TypInfo,
  System.Generics.Collections, Variants, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB;

type
  TFKInfo = record
    tabela: string;
    chaveEstrangeira: string;
  end;

  TPrimaryKeyAttribute = class(TCustomAttribute)
  private
    FAutoIncrement: Boolean;
    FFieldName: string;
  public
    constructor Create(AAutoIncrement: Boolean; const AFieldName: string = 'CODIGO');
    property AutoIncrement: Boolean read FAutoIncrement;
    property FieldName: string read FFieldName;
  end;

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
  protected
    class function GetTableName: string; virtual;
    function GetFieldList: TArray<string>;
    procedure FillParamsFromProperties(AQuery: TFDQuery);
    function PropertyValueAsVariant(const Prop: TRttiProperty): Variant;
    procedure LoadForeignKeyObjectsFromQuery(AQuery: TFDQuery; AContext: TRttiContext; AType: TRttiType);
    procedure EnsureObjectPropertyInstance(const Prop: TRttiProperty);
    function FindLocalFieldNameForProp(const Prop: TRttiProperty; const Attr: TForeignKeyAttribute): string;
    function GetPrimaryKeyValue: Integer;
    procedure SetPrimaryKeyValue(const Value: Integer);
    function GetPrimaryKeyFieldName: string;
  public
    procedure LoadFromID(AID: Integer); virtual;
    procedure Save; virtual;
    procedure Delete; virtual;

    function TotalReg(AArrStrings: TArray<TFKInfo>): Integer; virtual;
    function ToQuery: TFDQuery;
    class function ListToQuery(const AWhere: string = ''): TFDQuery; virtual;
    procedure ListForeignKeys(AClass: TClass);
  end;

implementation

uses
  uDmPrincipal;

{ TPrimaryKeyAttribute }

constructor TPrimaryKeyAttribute.Create(AAutoIncrement: Boolean; const AFieldName: string);
begin
  inherited Create;
  FAutoIncrement := AAutoIncrement;
  FFieldName := AFieldName;
end;

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

function TModeloBase.GetPrimaryKeyFieldName: string;
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  Attr: TCustomAttribute;
begin
  Result := 'CODIGO'; // default
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    for Prop in RType.GetProperties do
    begin
      for Attr in Prop.GetAttributes do
      begin
        if Attr is TPrimaryKeyAttribute then
        begin
          Result := TPrimaryKeyAttribute(Attr).FieldName;
          Exit;
        end;
      end;
    end;
  finally
    Ctx.Free;
  end;
end;

function TModeloBase.GetPrimaryKeyValue: Integer;
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  Attr: TCustomAttribute;
begin
  Result := 0;
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    for Prop in RType.GetProperties do
    begin
      for Attr in Prop.GetAttributes do
      begin
        if Attr is TPrimaryKeyAttribute then
        begin
          Result := Prop.GetValue(Self).AsInteger;
          Exit;
        end;
      end;
    end;
  finally
    Ctx.Free;
  end;
end;

procedure TModeloBase.SetPrimaryKeyValue(const Value: Integer);
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  Attr: TCustomAttribute;
begin
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    for Prop in RType.GetProperties do
    begin
      for Attr in Prop.GetAttributes do
      begin
        if Attr is TPrimaryKeyAttribute then
        begin
          Prop.SetValue(Self, Value);
          Exit;
        end;
      end;
    end;
  finally
    Ctx.Free;
  end;
end;

function TModeloBase.GetFieldList: TArray<string>;
var
  Ctx: TRttiContext;
  RType: TRttiType;
  Prop: TRttiProperty;
  L: TList<string>;
  Attr: TCustomAttribute;
  IsFKObject, IsPrimaryKey: Boolean;
  PrimaryKeyValue: Integer;
begin
  L := TList<string>.Create;
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    PrimaryKeyValue := GetPrimaryKeyValue;

    for Prop in RType.GetProperties do
    begin
      if (Prop.Visibility <> mvPublished) then
        Continue;

      IsPrimaryKey := False;
      for Attr in Prop.GetAttributes do
        if Attr is TPrimaryKeyAttribute then
        begin
          IsPrimaryKey := True;
          if TPrimaryKeyAttribute(Attr).AutoIncrement and (PrimaryKeyValue = 0) then
            IsPrimaryKey := True
          else
            IsPrimaryKey := False;
          Break;
        end;

      if IsPrimaryKey then
        Continue;

      IsFKObject := False;
      for Attr in Prop.GetAttributes do
        if Attr is TForeignKeyAttribute then
        begin
          IsFKObject := True;
          Break;
        end;

      if IsFKObject then
        Continue;

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
  IsPrimaryKey: Boolean;
  PrimaryKeyValue: Integer;
begin
  Ctx := TRttiContext.Create;
  try
    RType := Ctx.GetType(Self.ClassType);
    PrimaryKeyValue := GetPrimaryKeyValue;

    for Prop in RType.GetProperties do
    begin
      if (Prop.Visibility <> mvPublished) then
        Continue;

      IsPrimaryKey := False;
      for Attr in Prop.GetAttributes do
        if Attr is TPrimaryKeyAttribute then
        begin
          if TPrimaryKeyAttribute(Attr).AutoIncrement and (PrimaryKeyValue = 0) then
            IsPrimaryKey := True;
          Break;
        end;

      if IsPrimaryKey then
        Continue;

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

    // Adiciona parâmetro para a chave primária
    PName := GetPrimaryKeyFieldName;
    if AQuery.Params.FindParam(PName) = nil then
      AQuery.Params.CreateParam(ftInteger, PName, ptInput);
    AQuery.ParamByName(PName).AsInteger := PrimaryKeyValue;
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
          Continue;

        if AQuery.FieldByName(LocalField).IsNull then
          Continue;

        localID := AQuery.FieldByName(LocalField).AsInteger;

        if Prop.PropertyType.Handle <> nil then
        begin
          ObjClass := Prop.PropertyType.ClassType;
          if ObjClass.InheritsFrom(TModeloBase) then
          begin
            ObjInstance := ObjClass.Create;
            try
              TModeloBase(ObjInstance).LoadFromID(localID);
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
  if (Attr <> nil) and (Attr.LocalField <> '') then
    Exit(Attr.LocalField);

  Candidate := Prop.Name + GetPrimaryKeyFieldName;
  Result := Candidate;
end;

procedure TModeloBase.EnsureObjectPropertyInstance(const Prop: TRttiProperty);
var
  Obj: TObject;
begin
  if Prop.PropertyType.TypeKind <> tkClass then
    Exit;

  if Prop.GetValue(Self).IsEmpty then
  begin
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
  PrimaryKeyField: string;
begin
  vQuery := TFDQuery.Create(nil);
  ctx := TRttiContext.Create;
  try
    vQuery.Connection := dmPrincipal.FDConnection;
    PrimaryKeyField := GetPrimaryKeyFieldName;
    vQuery.SQL.Text := Format('SELECT * FROM %s WHERE %s = :%s', [GetTableName, PrimaryKeyField, PrimaryKeyField]);
    vQuery.ParamByName(PrimaryKeyField).AsInteger := AID;
    vQuery.Open;

    if vQuery.Eof then
      raise Exception.CreateFmt('Registro %s=%d não encontrado em %s', [PrimaryKeyField, AID, GetTableName]);

    rType := ctx.GetType(Self.ClassType);
    for prop in rType.GetProperties do
    begin
      if (prop.Visibility <> mvPublished) then
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

    LoadForeignKeyObjectsFromQuery(vQuery, ctx, rType);
    SetPrimaryKeyValue(AID);
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
  PrimaryKeyField: string;
  PrimaryKeyValue: Integer;
begin
  vFields := GetFieldList;
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dmPrincipal.FDConnection;
    PrimaryKeyField := GetPrimaryKeyFieldName;
    PrimaryKeyValue := GetPrimaryKeyValue;

    if PrimaryKeyValue > 0 then
    begin
      vSQLText := 'UPDATE ' + GetTableName + ' SET ';
      for i := 0 to High(vFields) do
      begin
        vSQLText := vSQLText + vFields[i] + ' = :' + vFields[i];
        if i < High(vFields) then
          vSQLText := vSQLText + ', ';
      end;
      vSQLText := vSQLText + ' WHERE ' + PrimaryKeyField + ' = :' + PrimaryKeyField;
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

      vQuery.SQL.Text := Format('SELECT MAX(%s) AS %s FROM %s', [PrimaryKeyField, PrimaryKeyField, GetTableName]);
      vQuery.Open;
      if not vQuery.Eof then
        SetPrimaryKeyValue(vQuery.FieldByName(PrimaryKeyField).AsInteger);
    end;
  finally
    vQuery.Free;
  end;
end;

procedure TModeloBase.Delete;
var
  vQuery: TFDQuery;
  PrimaryKeyField: string;
  PrimaryKeyValue: Integer;
begin
  PrimaryKeyValue := GetPrimaryKeyValue;
  if PrimaryKeyValue <= 0 then
    Exit;

  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dmPrincipal.FDConnection;
    PrimaryKeyField := GetPrimaryKeyFieldName;
    vQuery.SQL.Text := Format('DELETE FROM %s WHERE %s = :%s', [GetTableName, PrimaryKeyField, PrimaryKeyField]);
    vQuery.ParamByName(PrimaryKeyField).AsInteger := PrimaryKeyValue;
    vQuery.ExecSQL;
  finally
    vQuery.Free;
  end;
end;

function TModeloBase.ToQuery: TFDQuery;
var
  PrimaryKeyField: string;
  PrimaryKeyValue: Integer;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmPrincipal.FDConnection;
  PrimaryKeyField := GetPrimaryKeyFieldName;
  PrimaryKeyValue := GetPrimaryKeyValue;
  Result.SQL.Text := Format('SELECT * FROM %s WHERE %s = :%s', [GetTableName, PrimaryKeyField, PrimaryKeyField]);
  Result.ParamByName(PrimaryKeyField).AsInteger := PrimaryKeyValue;
end;

function TModeloBase.TotalReg(AArrStrings: TArray<TFKInfo>): Integer;
var
  vQuery: TFDQuery;
  vWhere: string;
  PrimaryKeyValue: Integer;
  vQuantidadeTabelas: Integer;
  TotalRegistros: Integer;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := dmPrincipal.FDConnection;
  PrimaryKeyValue := GetPrimaryKeyValue;
  TotalRegistros := 0;

  vWhere := ' WHERE 1 = 1 ';

  for vQuantidadeTabelas := 0 to Length(AArrStrings) do
  begin
    vWhere := ' AND (' + AArrStrings[vQuantidadeTabelas].chaveEstrangeira+ ' = '+IntToStr(PrimaryKeyValue) +')';
    vQuery.Open( Format('SELECT Count(*) QTD FROM %s %s ', [AArrStrings[vQuantidadeTabelas].tabela, vWhere]) );
    TotalRegistros := TotalRegistros + vQuery.FieldByName('QTD').AsInteger;
  end;
  Result := TotalRegistros;
end;

class function TModeloBase.ListToQuery(const AWhere: string = ''): TFDQuery;
var
  vQuery: TFDQuery;
  vWhere: string;
  PrimaryKeyField: string;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := dmPrincipal.FDConnection;
  vWhere := AWhere;
  PrimaryKeyField := EmptyStr;

  with Self.Create do
  try
    PrimaryKeyField := GetPrimaryKeyFieldName;
  finally
    Free;
  end;

  if vWhere <> '' then
    vWhere := ' WHERE ' + vWhere;
  vQuery.SQL.Text := Format('SELECT * FROM %s %s ORDER BY %s ', [GetTableName, vWhere, PrimaryKeyField]);
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
          Writeln(Format('Propriedade %s -> FK para %s(%s) [local: %s]', [prop.Name, TForeignKeyAttribute(attr).ReferencedTable, TForeignKeyAttribute(attr).ReferencedColumn, TForeignKeyAttribute(attr).LocalField]));
        end;
  finally
    ctx.Free;
  end;
end;

end.

