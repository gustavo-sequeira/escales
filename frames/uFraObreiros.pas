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
    FDMemTable2: TFDMemTable;
    FDMemTable2ddd: TIntegerField;
    FDMemTable2numero: TIntegerField;
    FDMemTable2principal: TIntegerField;
    FDMemTable2telefone: TStringField;
    FDMemTable2codigo: TIntegerField;
    procedure tsManutencaoShow(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
    procedure cxImage2Click(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
    procedure cxImage3Click(Sender: TObject);
    procedure cxLabel8Click(Sender: TObject);
    procedure cxLabel17Click(Sender: TObject);
    procedure cxLabel7Click(Sender: TObject);
    procedure cxLabel6Click(Sender: TObject);
    procedure cxLabel15Click(Sender: TObject);
    procedure cxLabel16Click(Sender: TObject);
    procedure cxLabel20Click(Sender: TObject);
    procedure cxLabel19Click(Sender: TObject);
    procedure cxLabel18Click(Sender: TObject);
    procedure cxLabel21Click(Sender: TObject);
    procedure cxLabel14Click(Sender: TObject);
    procedure cxLabel14MouseEnter(Sender: TObject);
    procedure cxLabel14MouseLeave(Sender: TObject);
    procedure cxLabel17MouseEnter(Sender: TObject);
    procedure cxLabel17MouseLeave(Sender: TObject);
    procedure cxLabel15MouseLeave(Sender: TObject);
    procedure cxLabel15MouseEnter(Sender: TObject);
    procedure cxLabel16MouseEnter(Sender: TObject);
    procedure cxLabel16MouseLeave(Sender: TObject);
    procedure cxLabel20MouseLeave(Sender: TObject);
    procedure cxLabel20MouseEnter(Sender: TObject);
    procedure cxLabel19MouseEnter(Sender: TObject);
    procedure cxLabel19MouseLeave(Sender: TObject);
    procedure cxLabel18MouseLeave(Sender: TObject);
    procedure cxLabel18MouseEnter(Sender: TObject);
    procedure cxLabel21MouseEnter(Sender: TObject);
    procedure cxLabel21MouseLeave(Sender: TObject);
    procedure cxLabel8MouseLeave(Sender: TObject);
    procedure cxLabel8MouseEnter(Sender: TObject);
    procedure cxLabel7MouseEnter(Sender: TObject);
    procedure cxLabel7MouseLeave(Sender: TObject);
    procedure cxLabel6MouseLeave(Sender: TObject);
    procedure cxLabel6MouseEnter(Sender: TObject);
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
    procedure CarregarComboTelefones(pCodigoObreiro: Integer);
    procedure CarregarDisponibilidades(pCodigoObreiro: Integer);
    function PesquisarNomeCargo(ACodigoCargo: integer): string;
    procedure PosicionarItemIndexCargo(ACodigoCargo: integer);
    procedure SalvarTelefone(pCodigoObreiro: Integer);
    procedure SalvarDisponibilidade(pCodigoObreiro: Integer);
  end;

var
  FraObreiros: TFraObreiros;

implementation

uses
  uDmPrincipal, uFrmTelefone, uObreiro, uCargo, uEXEscales, uModeloBase, Math,
  uLibary;

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

procedure TFraObreiros.CarregarComboTelefones(pCodigoObreiro: Integer);
begin
  cbTelefone.Properties.Items.Clear;

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('  select codigo, ');
  dmPrincipal.FDQuery1.SQL.Add('         ddd, ');
  dmPrincipal.FDQuery1.SQL.Add('         numero, ');
  dmPrincipal.FDQuery1.SQL.Add('         principal, ');
  dmPrincipal.FDQuery1.SQL.Add('         ''(''||ddd||'') ''||numero as telefone ');
  dmPrincipal.FDQuery1.SQL.Add('    from telefones');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo_obreiro = :codigo_obreiro');
  dmPrincipal.FDQuery1.SQL.Add('order by principal desc	');

  dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;

  dmPrincipal.FDQuery1.Open;

  FDMemTable2.Open;
  FDMemTable2.EmptyDataSet;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  FDMemTable2.Close;
  FDMemTable2.CopyDataSet(dmPrincipal.FDQuery1, [coRestart, coAppend]);

  dmPrincipal.FDQuery1.First;
  while not dmPrincipal.FDQuery1.Eof do
  begin
    cbTelefone.Properties.Items.Add(dmPrincipal.FDQuery1.FieldByName('telefone').AsString);
    dmPrincipal.FDQuery1.Next;
  end;

  cbTelefone.ItemIndex := 0;
end;

procedure TFraObreiros.CarregarDisponibilidades(pCodigoObreiro: Integer);
begin
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('	select * ');
  dmPrincipal.FDQuery1.SQL.Add('	  from disponibilidades ');
  dmPrincipal.FDQuery1.SQL.Add('  where codigo_obreiro = :codigo_obreiro ');
  dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;
  dmPrincipal.FDQuery1.Open;

  chbDomManha.Checked := dmPrincipal.FDQuery1.FieldByName('mDom').AsInteger = 1;
  chbSegManha.Checked := dmPrincipal.FDQuery1.FieldByName('mSeg').AsInteger = 1;
  chbterManha.Checked := dmPrincipal.FDQuery1.FieldByName('mTer').AsInteger = 1;
  chbQuaManha.Checked := dmPrincipal.FDQuery1.FieldByName('mQua').AsInteger = 1;
  chbQuiManha.Checked := dmPrincipal.FDQuery1.FieldByName('mQui').AsInteger = 1;
  chbSexManha.Checked := dmPrincipal.FDQuery1.FieldByName('mSex').AsInteger = 1;
  chbSabManha.Checked := dmPrincipal.FDQuery1.FieldByName('mSab').AsInteger = 1;

  chbDomTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tDom').AsInteger = 1;
  chbSegTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tSeg').AsInteger = 1;
  chbterTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tTer').AsInteger = 1;
  chbQuaTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tQua').AsInteger = 1;
  chbQuiTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tQui').AsInteger = 1;
  chbSexTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tSex').AsInteger = 1;
  chbSabTarde.Checked := dmPrincipal.FDQuery1.FieldByName('tSab').AsInteger = 1;

  chbDomNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nDom').AsInteger = 1;
  chbSegNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nSeg').AsInteger = 1;
  chbterNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nTer').AsInteger = 1;
  chbQuaNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nQua').AsInteger = 1;
  chbQuiNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nQui').AsInteger = 1;
  chbSexNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nSex').AsInteger = 1;
  chbSabNoite.Checked := dmPrincipal.FDQuery1.FieldByName('nSab').AsInteger = 1;

end;

function TFraObreiros.PesquisarNomeCargo(ACodigoCargo: integer): string;
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
  vApenasNumeros: string;
begin
  inherited;

  frmTelefone := TfrmTelefone.Create(Self);
  try
    frmTelefone.ShowModal;
    if frmTelefone.ModalResult = mrOk then
    begin
      FDMemTable2.Active := True;
      FDMemTable2.Insert;
      vApenasNumeros := StringReplace(frmTelefone.cxMaskEdit1.Text, '(', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, ')', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, '-', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, ' ', '', [rfReplaceAll]);

      FDMemTable2.FieldByName('codigo').AsInteger := 0;
      FDMemTable2.FieldByName('ddd').AsInteger := StrToIntDef(Copy(vApenasNumeros, 1, 2), 0);
      FDMemTable2.FieldByName('numero').AsInteger := StrToIntDef(Copy(vApenasNumeros, 3, Length(vApenasNumeros)), 0);
      if frmTelefone.cxCheckBox1.Checked then
        FDMemTable2.FieldByName('principal').AsInteger := 1
      else
        FDMemTable2.FieldByName('principal').AsInteger := 0;
      FDMemTable2.FieldByName('telefone').AsString := frmTelefone.cxMaskEdit1.Text;
      FDMemTable2.Post;

      cbTelefone.Properties.Items.Clear;
      FDMemTable2.First;
      while not FDMemTable2.Eof do
      begin
        cbTelefone.Properties.Items.Add(FDMemTable2.FieldByName('telefone').AsString);
        FDMemTable2.Next;
      end;
      cbTelefone.ItemIndex := 0;
    end;
  finally
    frmTelefone.Free;
  end;
end;

procedure TFraObreiros.cxImage2Click(Sender: TObject);
var
  frmTelefone: TfrmTelefone;
  vApenasNumeros: string;
begin
  inherited;

  if trim(cbTelefone.Text) = EmptyStr then
    Exit;

  frmTelefone := TfrmTelefone.Create(Self);

  frmTelefone.cxMaskEdit1.Text := trim(cbTelefone.Text);

  if FDMemTable2.Locate('telefone', trim(cbTelefone.Text), []) then
    frmTelefone.cxCheckBox1.Checked := FDMemTable2.FieldByName('principal').AsInteger = 1;

  try
    frmTelefone.ShowModal;
    if frmTelefone.ModalResult = mrOk then
    begin
      FDMemTable2.Active := True;
      FDMemTable2.Edit;
      vApenasNumeros := StringReplace(frmTelefone.cxMaskEdit1.Text, '(', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, ')', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, '-', '', [rfReplaceAll]);
      vApenasNumeros := StringReplace(vApenasNumeros, ' ', '', [rfReplaceAll]);

      FDMemTable2.FieldByName('ddd').AsInteger := StrToIntDef(Copy(vApenasNumeros, 1, 2), 0);
      FDMemTable2.FieldByName('numero').AsInteger := StrToIntDef(Copy(vApenasNumeros, 3, Length(vApenasNumeros)), 0);
      if frmTelefone.cxCheckBox1.Checked then
        FDMemTable2.FieldByName('principal').AsInteger := 1
      else
        FDMemTable2.FieldByName('principal').AsInteger := 0;
      FDMemTable2.FieldByName('telefone').AsString := frmTelefone.cxMaskEdit1.Text;
      FDMemTable2.Post;

      cbTelefone.Properties.Items.Clear;
      FDMemTable2.First;
      while not FDMemTable2.Eof do
      begin
        cbTelefone.Properties.Items.Add(FDMemTable2.FieldByName('telefone').AsString);
        FDMemTable2.Next;
      end;
      cbTelefone.ItemIndex := 0;
    end;
  finally
    frmTelefone.Free;
  end;
end;

procedure TFraObreiros.cxImage3Click(Sender: TObject);
var
  vIndextelefone: Integer;
begin
  inherited;

  if trim(cbTelefone.Text) = EmptyStr then
    Exit;

  vIndextelefone := cbTelefone.ItemIndex;

  if FDMemTable2.Locate('telefone', trim(cbTelefone.Text), []) then
  begin
    dmPrincipal.FDQuery1.Close;
    dmPrincipal.FDQuery1.SQL.Clear;
    dmPrincipal.FDQuery1.SQL.Add('  delete ');
    dmPrincipal.FDQuery1.SQL.Add('    from telefones');
    dmPrincipal.FDQuery1.SQL.Add('   where codigo = :codigo');
    dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := FDMemTable2.FieldByName('codigo').AsInteger;
    dmPrincipal.FDQuery1.ExecSQL;

    FDMemTable2.Delete;
  end;


  cbTelefone.Properties.Items.Delete(vIndextelefone);

  if vIndextelefone < cbTelefone.Properties.Items.Count then
    cbTelefone.ItemIndex := vIndextelefone
  else
    cbTelefone.ItemIndex := cbTelefone.Properties.Items.Count - 1;

end;

procedure TFraObreiros.cxLabel14Click(Sender: TObject);
begin
  inherited;
  chbDomManha.Checked := not chbDomManha.Checked;
  chbSegManha.Checked := not chbSegManha.Checked;
  chbTerManha.Checked := not chbTerManha.Checked;
  chbQuaManha.Checked := not chbQuaManha.Checked;
  chbQuiManha.Checked := not chbQuiManha.Checked;
  chbSexManha.Checked := not chbSexManha.Checked;
  chbSabManha.Checked := not chbSabManha.Checked;

  chbDomTarde.Checked := not chbDomTarde.Checked;
  chbSegTarde.Checked := not chbSegTarde.Checked;
  chbTerTarde.Checked := not chbTerTarde.Checked;
  chbQuaTarde.Checked := not chbQuaTarde.Checked;
  chbQuiTarde.Checked := not chbQuiTarde.Checked;
  chbSexTarde.Checked := not chbSexTarde.Checked;
  chbSabTarde.Checked := not chbSabTarde.Checked;

  chbDomNoite.Checked := not chbDomNoite.Checked;
  chbSegNoite.Checked := not chbSegNoite.Checked;
  chbTerNoite.Checked := not chbTerNoite.Checked;
  chbQuaNoite.Checked := not chbQuaNoite.Checked;
  chbQuiNoite.Checked := not chbQuiNoite.Checked;
  chbSexNoite.Checked := not chbSexNoite.Checked;
  chbSabNoite.Checked := not chbSabNoite.Checked;
end;

procedure TFraObreiros.cxLabel14MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel14);
end;

procedure TFraObreiros.cxLabel14MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel14);
end;

procedure TFraObreiros.cxLabel15Click(Sender: TObject);
begin
  inherited;
  chbSegManha.Checked := not chbSegManha.Checked;
  chbSegTarde.Checked := not chbSegTarde.Checked;
  chbSegNoite.Checked := not chbSegNoite.Checked;
end;

procedure TFraObreiros.cxLabel15MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel15);
end;

procedure TFraObreiros.cxLabel15MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel15);
end;

procedure TFraObreiros.cxLabel16Click(Sender: TObject);
begin
  inherited;
  chbTerManha.Checked := not chbTerManha.Checked;
  chbTerTarde.Checked := not chbTerTarde.Checked;
  chbTerNoite.Checked := not chbTerNoite.Checked;
end;

procedure TFraObreiros.cxLabel16MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel16);
end;

procedure TFraObreiros.cxLabel16MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel16);
end;

procedure TFraObreiros.cxLabel17Click(Sender: TObject);
begin
  inherited;
  chbDomManha.Checked := not chbDomManha.Checked;
  chbDomTarde.Checked := not chbDomTarde.Checked;
  chbDomNoite.Checked := not chbDomNoite.Checked;
end;

procedure TFraObreiros.cxLabel17MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel17);
end;

procedure TFraObreiros.cxLabel17MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel17);
end;

procedure TFraObreiros.cxLabel18Click(Sender: TObject);
begin
  inherited;
  chbSexManha.Checked := not chbSexManha.Checked;
  chbSexTarde.Checked := not chbSexTarde.Checked;
  chbSexNoite.Checked := not chbSexNoite.Checked;
end;

procedure TFraObreiros.cxLabel18MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel18);
end;

procedure TFraObreiros.cxLabel18MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel18);
end;

procedure TFraObreiros.cxLabel19Click(Sender: TObject);
begin
  inherited;
  chbQuiManha.Checked := not chbQuiManha.Checked;
  chbQuiTarde.Checked := not chbQuiTarde.Checked;
  chbQuiNoite.Checked := not chbQuiNoite.Checked;
end;

procedure TFraObreiros.cxLabel19MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel19);
end;

procedure TFraObreiros.cxLabel19MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel19);
end;

procedure TFraObreiros.cxLabel20Click(Sender: TObject);
begin
  inherited;
  chbQuaManha.Checked := not chbQuaManha.Checked;
  chbQuaTarde.Checked := not chbQuaTarde.Checked;
  chbQuaNoite.Checked := not chbQuaNoite.Checked;
end;

procedure TFraObreiros.cxLabel20MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel20);
end;

procedure TFraObreiros.cxLabel20MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel20);
end;

procedure TFraObreiros.cxLabel21Click(Sender: TObject);
begin
  inherited;
  chbSabManha.Checked := not chbSabManha.Checked;
  chbSabTarde.Checked := not chbSabTarde.Checked;
  chbSabNoite.Checked := not chbSabNoite.Checked;
end;

procedure TFraObreiros.cxLabel21MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel21);
end;

procedure TFraObreiros.cxLabel21MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel21);
end;

procedure TFraObreiros.cxLabel6Click(Sender: TObject);
begin
  inherited;
  chbDomNoite.Checked := not chbDomNoite.Checked;
  chbSegNoite.Checked := not chbSegNoite.Checked;
  chbTerNoite.Checked := not chbTerNoite.Checked;
  chbQuaNoite.Checked := not chbQuaNoite.Checked;
  chbQuiNoite.Checked := not chbQuiNoite.Checked;
  chbSexNoite.Checked := not chbSexNoite.Checked;
  chbSabNoite.Checked := not chbSabNoite.Checked;
end;

procedure TFraObreiros.cxLabel6MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel6);
end;

procedure TFraObreiros.cxLabel6MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel6);
end;

procedure TFraObreiros.cxLabel7Click(Sender: TObject);
begin
  inherited;
  chbDomTarde.Checked := not chbDomTarde.Checked;
  chbSegTarde.Checked := not chbSegTarde.Checked;
  chbTerTarde.Checked := not chbTerTarde.Checked;
  chbQuaTarde.Checked := not chbQuaTarde.Checked;
  chbQuiTarde.Checked := not chbQuiTarde.Checked;
  chbSexTarde.Checked := not chbSexTarde.Checked;
  chbSabTarde.Checked := not chbSabTarde.Checked;
end;

procedure TFraObreiros.cxLabel7MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel7);
end;

procedure TFraObreiros.cxLabel7MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel7);
end;

procedure TFraObreiros.cxLabel8Click(Sender: TObject);
begin
  inherited;
  chbDomManha.Checked := not chbDomManha.Checked;
  chbSegManha.Checked := not chbSegManha.Checked;
  chbTerManha.Checked := not chbTerManha.Checked;
  chbQuaManha.Checked := not chbQuaManha.Checked;
  chbQuiManha.Checked := not chbQuiManha.Checked;
  chbSexManha.Checked := not chbSexManha.Checked;
  chbSabManha.Checked := not chbSabManha.Checked;
end;

procedure TFraObreiros.cxLabel8MouseEnter(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelEnter(cxLabel8);
end;

procedure TFraObreiros.cxLabel8MouseLeave(Sender: TObject);
begin
  inherited;
  TLibary.MudarCorLabelLeave(cxLabel8);
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
    FDMemTable1nome_cargo.AsString := PesquisarNomeCargo(FDMemTable1codigo_cargo.AsInteger);
  end;
end;

procedure TFraObreiros.PosicionarItemIndexCargo(ACodigoCargo: integer);
begin
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('	select abreviacao||''-''||nome as nome_cargo ');
  dmPrincipal.FDQuery1.SQL.Add('	  from cargos ');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo = :codigo ');
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

procedure TFraObreiros.SalvarDisponibilidade(pCodigoObreiro: Integer);
begin
  try
    dmPrincipal.FDQuery1.Close;
    dmPrincipal.FDQuery1.SQL.Clear;
    dmPrincipal.FDQuery1.SQL.Add('  select * ');
    dmPrincipal.FDQuery1.SQL.Add('    from disponibilidades ');
    dmPrincipal.FDQuery1.SQL.Add('   where codigo_obreiro = :codigo_obreiro');
    dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;

    dmPrincipal.FDQuery1.Open;

    if dmPrincipal.FDQuery1.IsEmpty then
    begin
      dmPrincipal.FDQuery1.Close;
      dmPrincipal.FDQuery1.SQL.Clear;
      dmPrincipal.FDQuery1.SQL.Add('INSERT INTO disponibilidades( ');
      dmPrincipal.FDQuery1.SQL.Add('	codigo_obreiro, "mDom","mSeg","mTer","mQua","mQui","mSex","mSab", ');
      dmPrincipal.FDQuery1.SQL.Add('                  "tDom","tSeg","tTer","tQua","tQui","tSex","tSab", ');
      dmPrincipal.FDQuery1.SQL.Add('                  "nDom","nSeg","nTer","nQua","nQui","nSex","nSab") ');
      dmPrincipal.FDQuery1.SQL.Add(' VALUES ( ');
      dmPrincipal.FDQuery1.SQL.Add(' :codigo_obreiro, :mDom, :mSeg, :mTer, :mQua, :mQui, :mSex, :mSab, ');
      dmPrincipal.FDQuery1.SQL.Add('                  :tDom, :tSeg, :tTer, :tQua, :tQui, :tSex, :tSab, ');
      dmPrincipal.FDQuery1.SQL.Add('                  :nDom, :nSeg, :nTer, :nQua, :nQui, :nSex, :nSab) ');
    end
    else
    begin
      dmPrincipal.FDQuery1.Close;
      dmPrincipal.FDQuery1.SQL.Clear;
      dmPrincipal.FDQuery1.SQL.Add('UPDATE disponibilidades ');
      dmPrincipal.FDQuery1.SQL.Add('	SET "mDom"=:mDom, "mSeg"=:mSeg, "mTer"=:mTer, "mQua"=:mQua, "mQui"=:mQui, "mSex"=:mSex, "mSab"=:mSab, ');
      dmPrincipal.FDQuery1.SQL.Add('	    "tDom"=:tDom, "tSeg"=:tSeg, "tTer"=:tTer, "tQua"=:tQua, "tQui"=:tQui, "tSex"=:tSex, "tSab"=:tSab, ');
      dmPrincipal.FDQuery1.SQL.Add('	  	"nDom"=:nDom, "nSeg"=:nSeg, "nTer"=:nTer, "nQua"=:nQua, "nQui"=:nQui, "nSex"=:nSex, "nSab"=:nSab ');
      dmPrincipal.FDQuery1.SQL.Add('	WHERE codigo_obreiro = :codigo_obreiro ');
    end;

    dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;

  //manhã
    dmPrincipal.FDQuery1.ParamByName('mDom').AsInteger := ifthen(chbDomManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mSeg').AsInteger := ifthen(chbSegManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mTer').AsInteger := ifthen(chbTerManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mQua').AsInteger := ifthen(chbQuaManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mQui').AsInteger := ifthen(chbQuiManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mSex').AsInteger := ifthen(chbSexManha.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('mSab').AsInteger := ifthen(chbSabManha.Checked, 1, 0);
  //tarde
    dmPrincipal.FDQuery1.ParamByName('tDom').AsInteger := ifthen(chbDomTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tSeg').AsInteger := ifthen(chbSegTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tTer').AsInteger := ifthen(chbTerTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tQua').AsInteger := ifthen(chbQuaTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tQui').AsInteger := ifthen(chbQuiTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tSex').AsInteger := ifthen(chbSexTarde.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('tSab').AsInteger := ifthen(chbSabTarde.Checked, 1, 0);
  //noite
    dmPrincipal.FDQuery1.ParamByName('nDom').AsInteger := ifthen(chbDomNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nSeg').AsInteger := ifthen(chbSegNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nTer').AsInteger := ifthen(chbTerNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nQua').AsInteger := ifthen(chbQuaNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nQui').AsInteger := ifthen(chbQuiNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nSex').AsInteger := ifthen(chbSexNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ParamByName('nSab').AsInteger := ifthen(chbSabNoite.Checked, 1, 0);
    dmPrincipal.FDQuery1.ExecSQL;
  except
    on e: Exception do
      raise ExDisponibilidadesException.Create('Erro ao salvar as disponibilidades. ' + e.Message);
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
    SalvarTelefone(Obreiro.Codigo);
    SalvarDisponibilidade(Obreiro.Codigo);
  finally
    Cargo.Free;
    Obreiro.Free;
  end;
end;

procedure TFraObreiros.SalvarTelefone(pCodigoObreiro: Integer);
begin
  FDMemTable2.First;
  while not (FDMemTable2.Eof) do
  begin
    dmPrincipal.FDQuery1.Close;
    dmPrincipal.FDQuery1.SQL.Clear;
    dmPrincipal.FDQuery1.SQL.Add('  select * ');
    dmPrincipal.FDQuery1.SQL.Add('    from telefones ');
    dmPrincipal.FDQuery1.SQL.Add('   where codigo_obreiro = :codigo_obreiro ');
    dmPrincipal.FDQuery1.SQL.Add('     and codigo = :codigo ');
    dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;
    dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := FDMemTable2.FieldByName('codigo').AsInteger;
    dmPrincipal.FDQuery1.Open;

    if dmPrincipal.FDQuery1.IsEmpty then
    begin
      dmPrincipal.FDQuery1.Close;
      dmPrincipal.FDQuery1.SQL.Clear;
      dmPrincipal.FDQuery1.SQL.Add('  INSERT INTO telefones( ');
      dmPrincipal.FDQuery1.SQL.Add('  	codigo_obreiro, ddd, numero, principal) ');
      dmPrincipal.FDQuery1.SQL.Add('  	VALUES (:codigo_obreiro, :ddd, :numero, :principal) ');
    end
    else
    begin
      dmPrincipal.FDQuery1.Close;
      dmPrincipal.FDQuery1.SQL.Clear;
      dmPrincipal.FDQuery1.SQL.Add('   UPDATE telefones ');
      dmPrincipal.FDQuery1.SQL.Add('    	SET ddd = :ddd, numero = :numero, principal = :principal ');
      dmPrincipal.FDQuery1.SQL.Add('  	WHERE codigo = :codigo ');
      dmPrincipal.FDQuery1.SQL.Add('  	  AND codigo_obreiro = :codigo_obreiro ');
      dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := FDMemTable2.FieldByName('codigo').AsInteger;
    end;

    dmPrincipal.FDQuery1.ParamByName('codigo_obreiro').AsInteger := pCodigoObreiro;
    dmPrincipal.FDQuery1.ParamByName('ddd').AsInteger := FDMemTable2.FieldByName('ddd').AsInteger;
    dmPrincipal.FDQuery1.ParamByName('numero').AsInteger := FDMemTable2.FieldByName('numero').AsInteger;
    dmPrincipal.FDQuery1.ParamByName('principal').AsInteger := FDMemTable2.FieldByName('principal').AsInteger;

    dmPrincipal.FDQuery1.ExecSQL;
    FDMemTable2.Next;
  end;

end;

procedure TFraObreiros.tsManutencaoShow(Sender: TObject);
begin
  inherited;
  CarregarComboCargos;

  if (not (Trim(edtCodigo.Text) = EmptyStr) and not (Trim(edtCodigo.Text) = '0')) then
  begin
    PosicionarItemIndexCargo(FDMemTable1.FieldByName('codigo_cargo').AsInteger);
    CarregarComboTelefones(FDMemTable1.FieldByName('codigo').AsInteger);
    CarregarDisponibilidades(FDMemTable1.FieldByName('codigo').AsInteger);
  end;
end;

procedure TFraObreiros.ValidarAntesExcluir;
var
  vArrStrings: TArray<TFKInfo>;
  vEstado: string;
  vCodException: Integer;
  Obreiro: TObreiros;
begin
  inherited;

  vEstado := 'exclusão';
  vCodException := 3001;

  SetLength(vArrStrings, 1);

  vArrStrings[0].tabela := 'disponibilidades';
  vArrStrings[0].chaveEstrangeira := 'codigo_obreiro';

  vArrStrings[1].tabela := 'escalados';
  vArrStrings[1].chaveEstrangeira := 'codigo_obreiro';

  vArrStrings[2].tabela := 'telefones';
  vArrStrings[2].chaveEstrangeira := 'codigo_obreiro';

  Obreiro := TObreiros.Create();
  try
    if Obreiro.TotalReg(vArrStrings) > 0 then
    begin
      raise EXEscales.Create('Não foi possível realizar a exclusão. Registro é usado em outras tabelas. ', vCodException);
      Abort;
    end;
  finally
    Obreiro.Free;
  end;
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
    raise ExObreirosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: NOME. ', vCodException);
    Abort;
  end;
end;

end.

