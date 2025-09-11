unit uFraEscalas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinOffice2010Blue, dxSkinWXI, dxBarBuiltInMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, cxClasses,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxGroupBox,
  cxLabel, cxTextEdit, cxCheckBox, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, cxMaskEdit, dxGDIPlusClasses, cxImage,
  cxRadioGroup, cxSpinEdit, cxTimeEdit;

type
  TFraEscalas = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    lbData: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxLabel5: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FDMemTable1codigo: TIntegerField;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    cxLabel6: TcxLabel;
    edtCodigo: TcxTextEdit;
    cbSituacao: TcxComboBox;
    cxGroupBox7: TcxGroupBox;
    cbLocalidade: TcxComboBox;
    cxGroupBox5: TcxGroupBox;
    dtData: TcxDateEdit;
    chbRepetir: TcxCheckBox;
    cbDiasSemana: TcxComboBox;
    lbTurno: TcxLabel;
    hrHorario: TcxTimeEdit;
    cxLabel1: TcxLabel;
    dsGridEscalados: TDataSource;
    memGridEscalados: TFDMemTable;
    procedure tsManutencaoShow(Sender: TObject);
    procedure hrHorarioPropertiesChange(Sender: TObject);
    procedure chbRepetirPropertiesChange(Sender: TObject);
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

    procedure CarregarComboLocalidades;
    procedure PosicionarItemIndexLocalidade(ACodigoLocalidade: integer);
    procedure PosicionarItemIndexStatus;
    procedure AcaoCheckboxRepetir(checado: boolean);
    procedure PosicionarItemIndexDiaDaSemana;
    procedure PreencherGridEscalados;
    procedure SalvarEscalados(CodigoEscala: Integer);
  end;

var
  FraEscalas: TFraEscalas;

implementation

uses
  Math, System.DateUtils, uDmPrincipal, uEscala, uEscalado, uModeloBase, uEXEscales;

{$R *.dfm}

{ TFraEscalas }

procedure TFraEscalas.AcaoCheckboxRepetir(checado: boolean);
begin
  if checado then
  begin
    cbDiasSemana.Visible := True;
    cbDiasSemana.Align := alClient;
    dtData.Visible := False;
    dtData.Align := alNone;
    lbData.Caption := 'Dia da semana';
  end
  else
  begin
    cbDiasSemana.Visible := False;
    cbDiasSemana.Align := alNone;
    dtData.Visible := True;
    dtData.Align := alClient;
    lbData.Caption := 'Data';
  end;
end;

procedure TFraEscalas.CarregarComboLocalidades;
begin
  cbLocalidade.Properties.Items.Clear;

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;

  dmPrincipal.FDQuery1.SQL.Add('	select nome ');
  dmPrincipal.FDQuery1.SQL.Add('	  from localidades ');
  dmPrincipal.FDQuery1.SQL.Add('  order by nome ');
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  dmPrincipal.FDQuery1.First;
  while not dmPrincipal.FDQuery1.Eof do
  begin
    cbLocalidade.Properties.Items.Add(dmPrincipal.FDQuery1.FieldByName('nome').AsString);
    dmPrincipal.FDQuery1.Next;
  end;
end;

procedure TFraEscalas.chbRepetirPropertiesChange(Sender: TObject);
begin
  inherited;
  AcaoCheckboxRepetir(chbRepetir.Checked);
end;

procedure TFraEscalas.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  chbRepetir.Checked := FDMemTable1.FieldByName('repete').AsInteger = 1;
  if chbRepetir.Checked then
    PosicionarItemIndexDiaDaSemana
  else
    dtData.Date := FDMemTable1.FieldByName('data').AsDateTime;
  hrHorario.Time := FDMemTable1.FieldByName('horario').AsVariant;
end;

procedure TFraEscalas.ExclusaoRegistro;
var
  Escala: TEscalas;
begin
  inherited;
  Escala := TEscalas.Create;
  try
    Escala.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Escala.Delete;
  finally
    Escala.Free;
  end;
end;

procedure TFraEscalas.hrHorarioPropertiesChange(Sender: TObject);
begin
  inherited;
  if not VarIsNull(hrHorario.EditValue) then
  begin

    if (HourOf(hrHorario.Time) >= 6) {06:00} and (HourOf(hrHorario.Time) < 12) then
      lbTurno.Caption := 'MANHÃ'
    else if (HourOf(hrHorario.Time) >= 12) and (HourOf(hrHorario.Time) < 18) then
      lbTurno.Caption := 'TARDE'
    else
      lbTurno.Caption := 'NOITE';
  end
  else
    lbTurno.Caption := ''; // caso não tenha valor
end;

procedure TFraEscalas.PreencherGrid;
var
  Escala: TEscalas;
  Query: TFDQuery;
begin
  inherited;
  Escala := TEscalas.Create;
  Query := Escala.ListToQuery;

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
    Escala.Free;
    Query.Free;
  end;
end;

procedure TFraEscalas.PreencherGridEscalados;
begin

end;

procedure TFraEscalas.SalvarEscalados(CodigoEscala: Integer);
var
  Escalados: TEscalados;
  Query: TFDQuery;
begin
  inherited;

  Escalados := TEscalados.Create;
  Query := Escalados.ListToQuery('codigo_escala = ' + IntToStr(CodigoEscala));

  memGridEscalados.DisableControls;
  memGridEscalados.First;

  try

    Query.Open;
    Query.FetchAll;
    if not (Query.IsEmpty) then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(' delete from escalados where codigo_escala = :escala');
      Query.ParamByName('escala').AsInteger := CodigoEscala;
      Query.ExecSQL;
    end;

    while not (memGridEscalados.Eof) do
    begin
      Escalados.Escala.Codigo := CodigoEscala;
      Escalados.Obreiro.Codigo := memGridEscalados.FieldByName('codigo_obreiro').AsInteger;
      Escalados.Save;
      memGridEscalados.Next;
    end;
  finally
    memGridEscalados.DisableControls;
    Query.Free;
    Escalados.Free;
  end;
end;

procedure TFraEscalas.SalvarRegistro;
var
  Escala: TEscalas;
begin
  inherited;

  Escala := TEscalas.Create;
  try
    Escala.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Escala.Situacao := cbSituacao.Text;
    Escala.Localidade.LoadFromField('NOME', cbLocalidade.Text);
    Escala.Data := dtData.Date;
    Escala.Dia := cbDiasSemana.Text;
    Escala.Repete := ifthen(chbRepetir.Checked, 1, 0);
    Escala.Turno := lbTurno.Caption;
    Escala.Horario := hrHorario.Time;
    Escala.Save;
    SalvarEscalados(Escala.Codigo);
  finally
    Escala.Free;
  end;
end;

procedure TFraEscalas.tsManutencaoShow(Sender: TObject);
begin
  inherited;
  // aumentar o tamano do segundo frame (componentes em tela)
  gbFrameSecundario.Height := gbFramePrincipal.Height - (Round(gbFramePrincipal.Height * 0.15) + (btnFrameCancelar.Height));

  CarregarComboLocalidades;

  if (not (Trim(edtCodigo.Text) = EmptyStr) and not (Trim(edtCodigo.Text) = '0')) then
  begin
    PosicionarItemIndexStatus;
    PosicionarItemIndexLocalidade(FDMemTable1.FieldByName('codigo_localidade').AsInteger);
  end;
end;

procedure TFraEscalas.PosicionarItemIndexDiaDaSemana;
begin
  cbDiasSemana.ItemIndex := cbDiasSemana.Properties.Items.IndexOf(dmPrincipal.FDQuery1.FieldByName('dia').AsString);
end;

procedure TFraEscalas.PosicionarItemIndexLocalidade(ACodigoLocalidade: integer);
begin
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('	select nome ');
  dmPrincipal.FDQuery1.SQL.Add('	  from localidades ');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo = :codigo ');
  dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := ACodigoLocalidade;
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  cbLocalidade.ItemIndex := cbLocalidade.Properties.Items.IndexOf(dmPrincipal.FDQuery1.FieldByName('nome').AsString);
end;

procedure TFraEscalas.PosicionarItemIndexStatus;
begin
  cbSituacao.ItemIndex := cbSituacao.Properties.Items.IndexOf(dmPrincipal.FDQuery1.FieldByName('situacao').AsString);
end;

procedure TFraEscalas.ValidarAntesExcluir;
var
  vArrStrings: TArray<TFKInfo>;
  vEstado: string;
  vCodException: Integer;
  Escala: TEscalas;
begin
  inherited;

  vEstado := 'exclusão';
  vCodException := 3001;

  SetLength(vArrStrings, 1);

  vArrStrings[0].tabela := 'escalados';
  vArrStrings[0].chaveEstrangeira := 'codigo_escala';

  Escala := TEscalas.Create();
  try
    if Escala.TotalReg(vArrStrings) > 0 then
    begin
      raise EXEscales.Create('Não foi possível realizar a exclusão. Registro é usado em outras tabelas. ', vCodException);
      Abort;
    end;
  finally
    Escala.Free;
  end;
end;

procedure TFraEscalas.ValidarAntesSalvar;
begin
  inherited;

end;

end.

