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
  cxDateUtils, cxCalendar, dxSkinWXI, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.VCLUI.Wait,
  FireDAC.DApt, Vcl.ExtCtrls, cxCheckBox;

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
    cbTelefone: TcxComboBox;
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
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    cxCheckBox6: TcxCheckBox;
    cxCheckBox7: TcxCheckBox;
    cxGroupBox5: TcxGroupBox;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    cxLabel7: TcxLabel;
    cxCheckBox8: TcxCheckBox;
    cxCheckBox9: TcxCheckBox;
    cxCheckBox10: TcxCheckBox;
    cxCheckBox11: TcxCheckBox;
    cxCheckBox12: TcxCheckBox;
    cxCheckBox13: TcxCheckBox;
    cxCheckBox14: TcxCheckBox;
    cxGroupBox6: TcxGroupBox;
    Bevel22: TBevel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Bevel27: TBevel;
    Bevel28: TBevel;
    cxLabel8: TcxLabel;
    cxCheckBox15: TcxCheckBox;
    cxCheckBox16: TcxCheckBox;
    cxCheckBox17: TcxCheckBox;
    cxCheckBox18: TcxCheckBox;
    cxCheckBox19: TcxCheckBox;
    cxCheckBox20: TcxCheckBox;
    cxCheckBox21: TcxCheckBox;
    cxLabel9: TcxLabel;
    procedure tsManutencaoShow(Sender: TObject);
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
    procedure PosicionarItemIndexCargo(ACodigoCargo: integer);
  end;

var
  FraObreiros: TFraObreiros;

implementation

uses
  uDmPrincipal;

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
  while dmPrincipal.FDQuery1.Eof do
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

procedure TFraObreiros.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtNome.Text := FDMemTable1.FieldByName('nome').AsString;
  dtDataNascimento.Date := FDMemTable1.FieldByName('dt_nascimento').AsDateTime;
end;

procedure TFraObreiros.ExclusaoRegistro;
begin
  inherited;

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

  cbCargo.ItemIndex :=  cbCargo.Properties.Items.IndexOf(dmPrincipal.FDQuery1.FieldByName('nome_cargo').AsString);
end;

procedure TFraObreiros.PreencherGrid;
begin
  inherited;

end;

procedure TFraObreiros.SalvarRegistro;
begin
  inherited;

end;

procedure TFraObreiros.tsManutencaoShow(Sender: TObject);
begin
  inherited;
  CarregarComboCargos;

  if (not(Trim(edtCodigo.Text) = EmptyStr) and not(Trim(edtCodigo.Text) = '0')) then
  begin
    PosicionarItemIndexCargo(dmPrincipal.FDQuery1.FieldByName('codigo').AsInteger);
  end;
end;

procedure TFraObreiros.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraObreiros.ValidarAntesSalvar;
begin
  inherited;

end;

end.

