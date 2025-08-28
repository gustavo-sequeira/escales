unit uFraObreiros;

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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxGroupBox, Vcl.Menus,
  System.ImageList, Vcl.ImgList, cxImageList, cxButtons, Vcl.StdCtrls,
  cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.VCLUI.Wait,
  FireDAC.DApt, Vcl.ExtCtrls, cxCheckBox, cxImage, dxGDIPlusClasses;

type
  TFraObreiros = class(TFraModelo)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    cbCargo: TcxComboBox;
    dtDataNascimento: TcxDateEdit;
    cxLabel5: TcxLabel;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDConnection1: TFDConnection;
    p: TFDQuery;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1codigo_cargo: TIntegerField;
    FDMemTable1nome: TWideMemoField;
    FDMemTable1dt_nascimento: TDateField;
    cxGroupBox3: TcxGroupBox;
    cxLabel6: TcxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    cxGroupBox4: TcxGroupBox;
    Bevel3: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    chbDomNoite: TcxCheckBox;
    chbSegNoite: TcxCheckBox;
    chbTerNoite: TcxCheckBox;
    chbQuaNoite: TcxCheckBox;
    chbQuiNoite: TcxCheckBox;
    chbSexNoite: TcxCheckBox;
    chbSabNoite: TcxCheckBox;
    cxGroupBox5: TcxGroupBox;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    cxLabel7: TcxLabel;
    chbDomTarde: TcxCheckBox;
    chbSegTarde: TcxCheckBox;
    chbTerTarde: TcxCheckBox;
    chbQuaTarde: TcxCheckBox;
    chbQuiTarde: TcxCheckBox;
    chbSexTarde: TcxCheckBox;
    chbSabTarde: TcxCheckBox;
    cxGroupBox6: TcxGroupBox;
    Bevel22: TBevel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Bevel27: TBevel;
    Bevel28: TBevel;
    cxLabel8: TcxLabel;
    chbDomManha: TcxCheckBox;
    chbSegManha: TcxCheckBox;
    chbTerManha: TcxCheckBox;
    chbQuaManha: TcxCheckBox;
    chbQuiManha: TcxCheckBox;
    chbSexManha: TcxCheckBox;
    chbSabManha: TcxCheckBox;
    cxLabel9: TcxLabel;
    cxGroupBox7: TcxGroupBox;
    cbTelefone: TcxComboBox;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1codigo_cargo: TcxGridDBColumn;
    grdFramePrincialDBTableView1nome: TcxGridDBColumn;
    grdFramePrincialDBTableView1dt_nascimento: TcxGridDBColumn;
    FDMemTable1nome_cargo: TStringField;
    grdFramePrincialDBTableView1nome_cargo: TcxGridDBColumn;
    procedure tsManutencaoShow(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
    procedure cxImage2Click(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
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

    procedure CarregarComboCargos;
    procedure CarregarComboTelefones;
    function CarregarNomeCargo(ACodigoCargo: integer): string;
    procedure PosicionarItemIndexCargo(ACodigoCargo: integer);

  end;

var
  FraObreiros: TFraObreiros;

implementation

uses
  uDmPrincipal, uFrmTelefone, uObreiro, uCargo, uEXEscales, uModeloBase;

{$R *.dfm}

{ TFraObreiros }

procedure TFraObreiros.CarregarComboCargos;
begin
  cbCargo.Properties.Items.Clear;

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('	select abreviacao||''-''||nome as nome_cargo ');
  dmPrincipal.FDQuery1.SQL.Add('	  from cargos ');
  dmPrincipal.FDQuery1.SQL.Add('  order by abreviacao ');
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  dmPrincipal.FDQuery1.First;
  while not dmPrincipal.FDQuery1.Eof do
  begin
    cbCargo.Properties.Items.Add(dmPrincipal.FDQuery1.FieldByName('nome_cargo').AsString);
    dmPrincipal.FDQuery1.Next;
  end;
end;

procedure TFraObreiros.CarregarComboTelefones;
begin
  cbTelefone.Properties.Items.Clear;

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('  select ''(''||ddd||'') ''||numero as telefone ');
  dmPrincipal.FDQuery1.SQL.Add('    from telefones');
  dmPrincipal.FDQuery1.SQL.Add('order by principal desc	');
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  dmPrincipal.FDQuery1.First;
  while dmPrincipal.FDQuery1.Eof do
  begin
    cbTelefone.Properties.Items.Add(dmPrincipal.FDQuery1.FieldByName('telefone').AsString);
    dmPrincipal.FDQuery1.Next;
  end;
end;

function TFraObreiros.CarregarNomeCargo(ACodigoCargo: integer): string;
begin
  Result := EmptyStr;
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('  select nome ');
  dmPrincipal.FDQuery1.SQL.Add('    from cargos');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo = :codigo');
  dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := ACodigoCargo;
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  Result := dmPrincipal.FDQuery1.Fields[0].AsString;
end;

procedure TFraObreiros.cxImage1Click(Sender: TObject);
var
  frmTelefone: TfrmTelefone;
begin
  inherited;

  frmTelefone := TfrmTelefone.Create(Self);
  try
    frmTelefone.ShowModal;
  finally
    frmTelefone.Free;
  end;
end;

procedure TFraObreiros.cxImage2Click(Sender: TObject);
var
  frmTelefone: TfrmTelefone;
begin
  inherited;

  frmTelefone := TfrmTelefone.Create(Self);
  try
    frmTelefone.ShowModal;
  finally
    frmTelefone.Free;
  end;
end;

procedure TFraObreiros.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  edtNome.Text := FDMemTable1.FieldByName('nome').AsString;
  dtDataNascimento.Date := FDMemTable1.FieldByName('dt_nascimento').AsDateTime;
end;

procedure TFraObreiros.ExclusaoRegistro;
var
  Obreiro: TObreiros;
begin
  inherited;

  Obreiro := TObreiros.Create;
  try
    Obreiro.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Obreiro.Delete;
  finally
    Obreiro.Free;
  end;
end;

procedure TFraObreiros.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
  inherited;
end;

procedure TFraObreiros.FDMemTable1CalcFields(DataSet: TDataSet);
begin
  inherited;
  if not FDMemTable1codigo_cargo.IsNull then
  begin
    FDMemTable1nome_cargo.AsString := CarregarNomeCargo(FDMemTable1codigo_cargo.AsInteger);
  end;
end;

procedure TFraObreiros.PosicionarItemIndexCargo(ACodigoCargo: integer);
begin
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('   	  WITH params AS (SELECT :codigo ::int AS codigo) ');
  dmPrincipal.FDQuery1.SQL.Add('	select abreviacao||''-''||nome as nome_cargo ');
  dmPrincipal.FDQuery1.SQL.Add('	  from cargos c ');
  dmPrincipal.FDQuery1.SQL.Add('inner join params p on c.codigo = p.codigo ');
  dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := ACodigoCargo;
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  cbCargo.ItemIndex := cbCargo.Properties.Items.IndexOf(dmPrincipal.FDQuery1.FieldByName('nome_cargo').AsString);
end;

procedure TFraObreiros.PreencherGrid;
var
  Obreiro: TObreiros;
  Query: TFDQuery;
begin
  inherited;
  Obreiro := TObreiros.Create;
  Query := Obreiro.ListToQuery;

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
    Obreiro.Free;
    Query.Free;
  end;
end;

procedure TFraObreiros.SalvarRegistro;
var
  Obreiro: TObreiros;
  Cargo: TCargos;
begin
  inherited;

  Obreiro := TObreiros.Create;
  Cargo := TCargos.Create;
  try
    Obreiro.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Cargo.LoadFromField('NOME', Copy(cbCargo.Text, Pos('-', cbCargo.Text) + 1, Length(cbCargo.Text)));
    Obreiro.Cargo := Cargo;
    Obreiro.Nome := Trim(edtNome.Text);
    Obreiro.Dt_Nascimento := dtDataNascimento.Date;
    Obreiro.Save;
  finally
    Cargo.Free;
    Obreiro.Free;
  end;
end;

procedure TFraObreiros.tsManutencaoShow(Sender: TObject);
begin
  inherited;
  CarregarComboCargos;

  if (not (Trim(edtCodigo.Text) = EmptyStr) and not (Trim(edtCodigo.Text) = '0')) then
  begin
    PosicionarItemIndexCargo(FDMemTable1.FieldByName('codigo_cargo').AsInteger);
  end;
end;

procedure TFraObreiros.ValidarAntesExcluir;
begin
  inherited;
end;

procedure TFraObreiros.ValidarAntesSalvar;
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

  if Trim(edtNome.Text) = EmptyStr then
  begin
    raise ExObreirosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: NOME', vCodException);
    Abort;
  end;
end;

end.

