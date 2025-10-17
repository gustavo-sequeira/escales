unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  cxClasses, cxLocalization;

type
  TdmPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    cxLocalizer1: TcxLocalizer;
    FDQuery1: TFDQuery;
    FDConnectionNeon: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetParamValue(pNome: String): Variant;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses System.Variants;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  FDPhysPgDriverLink1.VendorLib := ExtractFilePath(ParamStr(0))+'libpq.dll';
  FDConnection.Connected := True;
  cxLocalizer1.FileName := ExtractFilePath(ParamStr(0))+'traducao.ini';
  cxLocalizer1.Active := True;
  cxLocalizer1.Locale := 1046;

end;

function TdmPrincipal.GetParamValue(pNome: String): Variant;
begin
  Result := Null;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('  select valor ');
  FDQuery1.SQL.Add('    from parametros ' );
  FDQuery1.SQL.Add('   where nome = :nome ');
  FDQuery1.ParamByName('nome').AsString := pNome;
  FDQuery1.Open;

  if not(FDQuery1.IsEmpty) then
  begin
    Result := FDQuery1.FieldByName('valor').AsVariant;
  end;
end;
end.

