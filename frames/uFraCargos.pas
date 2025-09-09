unit uFraCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, Vcl.Menus, System.ImageList, Vcl.ImgList, cxImageList, cxButtons,
  Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxGroupBox, cxLabel, cxMemo,
  cxTextEdit, uCargo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageBin, cxButtonEdit, uModeloBase, dxSkinWXI;

type
  TFraCargos = class(TFraModelo)
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    edtAbreviacao: TcxTextEdit;
    edtCodigo: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    mmDescricao: TcxMemo;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1abreviacao: TcxGridDBColumn;
    grdFramePrincialDBTableView1nome: TcxGridDBColumn;
    grdFramePrincialDBTableView1descricao: TcxGridDBColumn;
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EdicaoRegistro; override;
    procedure SalvarRegistro; override;
    procedure ExclusaoRegistro; override;
    procedure PreencherGrid; override;
    procedure ValidarAntesSalvar; override;
    procedure ValidarAntesExcluir; override;
  end;

var
  FraCargos: TFraCargos;

implementation

uses
  System.UITypes, uEXEscales;

{$R *.dfm}

{ TFraCargos }

procedure TFraCargos.btnFrameConfirmarClick(Sender: TObject);
var
  Cargo: TCargos;
begin
  Cargo := TCargos.Create;
  try
    try
      if trim(edtCodigo.Text) = EmptyStr then
        Cargo.Codigo := 0
      else
        Cargo.Codigo := StrToInt(edtCodigo.Text);
      Cargo.Abreviacao := Trim(edtAbreviacao.Text);
      Cargo.Nome := Trim(edtNome.Text);
      Cargo.Descricao := Trim(mmDescricao.Text);
      inherited;

    except
      on e: Exception do
      begin
        if Cargo.Codigo = 0 then
          MessageDlg('Erro ao tentar incluir. ' + e.Message, mtError, [mbOK], 0)
        else
          MessageDlg('Erro ao tentar atualizar. ' + e.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    Cargo.Free;
  end;
end;

procedure TFraCargos.ExclusaoRegistro;
var
  Cargo: TCargos;
begin
  inherited;
  Cargo := TCargos.Create;
  try
    Cargo.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Cargo.Delete;
  finally
    Cargo.Free;
  end;
end;

procedure TFraCargos.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
  inherited;
end;

procedure TFraCargos.SalvarRegistro;
var
  Cargo: TCargos;
begin
  inherited;
  Cargo := TCargos.Create;
  try
    Cargo.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Cargo.Abreviacao := Trim(edtAbreviacao.Text);
    Cargo.Nome := Trim(edtNome.Text);
    Cargo.Descricao := Trim(mmDescricao.Text);
    Cargo.Save;
  finally
    Cargo.Free;
  end;
end;

procedure TFraCargos.ValidarAntesExcluir;
var
  vArrStrings: TArray<TFKInfo>;
  vEstado: string;
  vCodException: Integer;
  Cargo: TCargos;
begin
  inherited;

  vEstado := 'exclusão';
  vCodException := 3001;

  SetLength(vArrStrings, 1);

  vArrStrings[0].tabela := 'obreiros';
  vArrStrings[0].chaveEstrangeira := 'codigo_cargo';

  Cargo := TCargos.Create();
  try
    if Cargo.TotalReg(vArrStrings) > 0 then
    begin
      raise EXEscales.Create('Não foi possível realizar a exclusão. Registro é usado em outras tabelas. ', vCodException);
      Abort;
    end;
  finally
    Cargo.Free;
  end;
end;

procedure TFraCargos.ValidarAntesSalvar;
var
  vEstado: string;
  vCodException: Integer;
begin
  inherited;
  if ((Trim(edtCodigo.Text) = EmptyStr) or (Trim(edtCodigo.Text) = '0')) then
  begin
    vEstado := 'inclusão';
    vCodException := 1001;
  end
  else
  begin
    vEstado := 'alteração';
    vCodException := 2001;
  end;

  if Trim(edtAbreviacao.Text) = EmptyStr then
  begin
    raise ExCargosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: ABREVIAÇÃO', vCodException);
    Abort;
  end;

  if Trim(edtNome.Text) = EmptyStr then
  begin
    raise ExCargosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: NOME. ', vCodException);
    Abort;
  end;
end;

procedure TFraCargos.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  edtAbreviacao.Text := FDMemTable1.FieldByName('abreviacao').AsString;
  edtNome.Text := FDMemTable1.FieldByName('nome').AsString;
  mmDescricao.Lines.Text := FDMemTable1.FieldByName('descricao').AsString;
end;

procedure TFraCargos.PreencherGrid;
var
  Cargos: TCargos;
  Query: TFDQuery;
begin
  inherited;
  Cargos := TCargos.Create;
  Query := Cargos.ListToQuery;

  Query.Open;
  Query.FetchAll;
  try
    FDMemTable1.Close;
    try
      FDMemTable1.CloneCursor(Query);
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  finally
    Cargos.Free;
    Query.Free;
  end;
end;

end.

