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
  TConfiguracaoBanco = record
    Servidor: string;
    Porta: Integer;
    Banco: string;
    Usuario: string;
    Senha: string;
    Schema: string;
    Charset: string;
    Timeout: Integer;
  end;

  TdmPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    cxLocalizer1: TcxLocalizer;
    FDQuery1: TFDQuery;
    FDConnectionNeon: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function LerConfiguracoesBanco(const ArquivoINI: string): TConfiguracaoBanco;
    procedure ConfigurarFDConnection(FDConnection: TFDConnection; const Config: TConfiguracaoBanco);
  public
    { Public declarations }
    function GetParamValue(pNome: string): Variant;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  System.Variants, System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.ConfigurarFDConnection(FDConnection: TFDConnection; const Config: TConfiguracaoBanco);
begin
  if FDConnection.Connected then
    FDConnection.Connected := False;

  FDConnection.Params.Clear;
  FDConnection.Params.DriverID := 'PG';
  FDConnection.Params.Database := Config.Banco;
  FDConnection.Params.UserName := Config.Usuario;
  FDConnection.Params.Password := Config.Senha;
  FDConnection.Params.Add('Server=' + Config.Servidor);
  FDConnection.Params.Add('Port=' + Config.Porta.ToString);
  FDConnection.Params.Add('CharacterSet=' + Config.Charset);
  FDConnection.Params.Add('Schema=' + Config.Schema);
  FDConnection.Params.Add('LoginTimeout=' + Config.Timeout.ToString);
  FDConnection.LoginPrompt := False;
  FDConnection.Connected := True;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  Config: TConfiguracaoBanco;
begin
  FDPhysPgDriverLink1.VendorLib := ExtractFilePath(ParamStr(0)) + 'libpq.dll';

  cxLocalizer1.FileName := ExtractFilePath(ParamStr(0)) + 'traducao.ini';
  cxLocalizer1.Active := True;
  cxLocalizer1.Locale := 1046;

  try
    Config := LerConfiguracoesBanco(ExtractFilePath(ParamStr(0)) + 'config.ini');
    ConfigurarFDConnection(FDConnection,Config);

  except
    on E: Exception do
      Writeln('Erro ao ler configurações: ', E.Message);
  end;



end;

function TdmPrincipal.GetParamValue(pNome: string): Variant;
begin
  Result := Null;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('  select valor ');
  FDQuery1.SQL.Add('    from parametros ');
  FDQuery1.SQL.Add('   where nome = :nome ');
  FDQuery1.ParamByName('nome').AsString := pNome;
  FDQuery1.Open;

  if not (FDQuery1.IsEmpty) then
  begin
    Result := FDQuery1.FieldByName('valor').AsVariant;
  end;
end;

function TdmPrincipal.LerConfiguracoesBanco(const ArquivoINI: string): TConfiguracaoBanco;
var
  Ini: TIniFile;
begin
  if not FileExists(ArquivoINI) then
    raise Exception.CreateFmt('Arquivo de configuração não encontrado: %s', [ArquivoINI]);

  Ini := TIniFile.Create(ArquivoINI);
  try
    Result.Servidor := Ini.ReadString('DATABASE', 'Servidor', 'localhost');
    Result.Porta := Ini.ReadInteger('DATABASE', 'Porta', 5432);
    Result.Banco := Ini.ReadString('DATABASE', 'Banco', 'escales');
    Result.Usuario := Ini.ReadString('DATABASE', 'Usuario', 'postgres');
    Result.Senha := Ini.ReadString('DATABASE', 'Senha', 'postgres');
    Result.Schema := Ini.ReadString('DATABASE', 'Schema', 'public');
    Result.Charset := Ini.ReadString('DATABASE', 'Charset', 'UTF8');
    Result.Timeout := Ini.ReadInteger('DATABASE', 'Timeout', 30);
  finally
    Ini.Free;
  end;
end;

end.

