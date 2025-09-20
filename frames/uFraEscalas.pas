unit uFraEscalas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinOffice2010Blue, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxLabel,
  cxTextEdit, cxCheckBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, cxMaskEdit, dxGDIPlusClasses, cxImage, cxRadioGroup, cxSpinEdit,
  cxTimeEdit, Vcl.ExtCtrls, dxSkinWXI;

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
    cbLocalidade: TcxComboBox;
    cxGroupBox5: TcxGroupBox;
    dtData: TcxDateEdit;
    chbRepetir: TcxCheckBox;
    cbDiasSemana: TcxComboBox;
    hrHorario: TcxTimeEdit;
    cxLabel1: TcxLabel;
    dsGridEscalados: TDataSource;
    memGridEscalados: TFDMemTable;
    FDMemTable1data: TDateField;
    FDMemTable1repete: TIntegerField;
    FDMemTable1codigo_localidade: TIntegerField;
    grdFramePrincialDBTableView1situacao: TcxGridDBColumn;
    grdFramePrincialDBTableView1data: TcxGridDBColumn;
    grdFramePrincialDBTableView1dia: TcxGridDBColumn;
    grdFramePrincialDBTableView1turno: TcxGridDBColumn;
    grdFramePrincialDBTableView1horario: TcxGridDBColumn;
    grdFramePrincialDBTableView1repete: TcxGridDBColumn;
    grdFramePrincialDBTableView1codigo_localidade: TcxGridDBColumn;
    FDMemTable1situacao: TWideMemoField;
    FDMemTable1dia: TWideMemoField;
    FDMemTable1turno: TWideMemoField;
    grdFramePrincialDBTableView1nome_localidade: TcxGridDBColumn;
    grdFramePrincialDBTableView1data_dia: TcxGridDBColumn;
    FDMemTable1horario: TTimeField;
    memGridEscaladosnome: TWideMemoField;
    cxGrid1DBTableView1nome: TcxGridDBColumn;
    cxGrid1DBTableView1Exclusao: TcxGridDBColumn;
    lbTurno: TcxLabel;
    grdFramePrincialDBTableView1desc_repete: TcxGridDBColumn;
    FDMemTable1nome_localidade: TStringField;
    FDMemTable1data_dia: TStringField;
    FDMemTable1desc_repete: TStringField;
    procedure tsManutencaoShow(Sender: TObject);
    procedure hrHorarioPropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure chbRepetirClick(Sender: TObject);
    procedure cbDiasSemanaEditing(Sender: TObject; var CanEdit: Boolean);
    procedure dtDataEditing(Sender: TObject; var CanEdit: Boolean);
    procedure hrHorarioEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cbLocalidadeEditing(Sender: TObject; var CanEdit: Boolean);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
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
    function PesquisarCodigoObreiro(ANomeObreiro: string): Integer;
    function PesquisarLocalidade(ACodigoLocalidade: integer): string;
  end;

var
  FraEscalas: TFraEscalas;

implementation

uses
  System.DateUtils, uDmPrincipal, uEscala, uEscalado, uModeloBase, uEXEscales,
  uLocalidade, uFrmInclusaoObreiroEscala, System.Types, uLibary, System.StrUtils,
  Math;

{$R *.dfm}

{ TFraEscalas }

function TFraEscalas.PesquisarCodigoObreiro(ANomeObreiro: string): Integer;
begin
  Result := 0;
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('  select codigo ');
  dmPrincipal.FDQuery1.SQL.Add('    from obreiros');
  dmPrincipal.FDQuery1.SQL.Add('   where lower(nome) = lower(:nome)');
  dmPrincipal.FDQuery1.ParamByName('nome').AsString := Trim(Copy(ANomeObreiro, Pos('. ', ANomeObreiro) + 2, Length(ANomeObreiro)));
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  Result := dmPrincipal.FDQuery1.Fields[0].AsInteger;
end;

function TFraEscalas.PesquisarLocalidade(ACodigoLocalidade: integer): string;
begin
  Result := EmptyStr;
  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('  select nome ');
  dmPrincipal.FDQuery1.SQL.Add('    from localidades');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo = :codigo');
  dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := ACodigoLocalidade;
  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  Result := dmPrincipal.FDQuery1.Fields[0].AsString;

end;

procedure TFraEscalas.AcaoCheckboxRepetir(checado: boolean);
begin
  if checado then
  begin
    cbDiasSemana.ItemIndex := -1;
    cbDiasSemana.Visible := True;
    cbDiasSemana.Align := alClient;
    dtData.Visible := False;
    dtData.Align := alNone;
    lbData.Caption := 'Dia da semana';
  end
  else
  begin
    dtData.Date := Now;
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

procedure TFraEscalas.cbDiasSemanaEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  if not (memGridEscalados.IsEmpty) and (not (Trim(edtCodigo.Text) = EmptyStr) or not (Trim(edtCodigo.Text) = '0')) then
  begin
    if Application.MessageBox('Ao optar por essa mudança, os escalados desse dia serão removidos. Deseja continuar?', 'Escales', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      memGridEscalados.EmptyDataSet;
    end
    else
    begin
      CanEdit := False;
    end;
  end;
end;

procedure TFraEscalas.cbLocalidadeEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  begin
    if not (memGridEscalados.IsEmpty) and (not (Trim(edtCodigo.Text) = EmptyStr) or not (Trim(edtCodigo.Text) = '0')) and (Self.Tag = 0) then
    begin
      if Application.MessageBox('Ao optar por essa mudança, os escalados desse dia serão removidos. Deseja continuar?', 'Escales', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        memGridEscalados.EmptyDataSet;
      end
      else
      begin
        CanEdit := False;
      end;
    end;
  end;
end;

procedure TFraEscalas.chbRepetirClick(Sender: TObject);
begin
 // inherited;
  if not (memGridEscalados.IsEmpty) and (not (Trim(edtCodigo.Text) = EmptyStr) or not (Trim(edtCodigo.Text) = '0')) then
  begin
    if Application.MessageBox('Ao optar por essa mudança, os escalados desse dia serão removidos. Deseja continuar?', 'Escales', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      memGridEscalados.EmptyDataSet;
      AcaoCheckboxRepetir(chbRepetir.Checked);
    end
    else
    begin
      TcxCheckBox(Sender).EditValue := not VarAsType(TcxCheckBox(Sender).EditValue, varBoolean);
      Abort
    end;
  end
  else
    AcaoCheckboxRepetir(chbRepetir.Checked);
end;

procedure TFraEscalas.cxButton1Click(Sender: TObject);
var
  vQtdEscalados: Integer;
  vCampo: string;
begin
  inherited;

  if (chbRepetir.Checked) and (cbDiasSemana.Text = EmptyStr) then
  begin
    Application.MessageBox('Informe o dia da semana', 'Escales', MB_OK + MB_ICONWARNING);
    cbDiasSemana.SetFocus;
    Abort;
  end;

  vQtdEscalados := 0;

  if (lbTurno.Caption = 'Manhã') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_MANHA'), varInteger)
  else if (lbTurno.Caption = 'Tarde') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_TARDE'), varInteger)
  else if (lbTurno.Caption = 'Noite') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_NOITE'), varInteger);

  if chbRepetir.Checked then
    vCampo := cbDiasSemana.Text
  else
  begin
    vCampo := LowerCase(FormatDateTime('dddd', dtData.Date));
    vCampo := UpperCase(Copy(vCampo, 1, 1)) + LowerCase(Copy(vCampo, 2, Length(vCampo)));
  end;

  vCampo := StringReplace(Copy(LowerCase(lbTurno.Caption), 1, 1) + Copy(vCampo, 1, 3), 'á', 'a', []);

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('     select c.abreviacao||''. ''||o.nome  as nome, "' + vCampo + '" campo ');
  dmPrincipal.FDQuery1.SQL.Add(' 	     from public.obreiros o ');
  dmPrincipal.FDQuery1.SQL.Add(' inner join public.disponibilidades d ');
  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo = d.codigo_obreiro) ');
  dmPrincipal.FDQuery1.SQL.Add(' inner join public.cargos c ');
  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo_cargo = c.codigo) ');
  dmPrincipal.FDQuery1.SQL.Add('  left join public.ranking_escalas r ');
  dmPrincipal.FDQuery1.SQL.Add('	       on r.codigo_obreiro = o.codigo ');
  dmPrincipal.FDQuery1.SQL.Add('      where "' + vCampo + '" = 1 ');
  dmPrincipal.FDQuery1.SQL.Add('   order by r.ranking, o.nome ');
  dmPrincipal.FDQuery1.SQL.Add('      limit ' + IntToStr(vQtdEscalados));
  dmPrincipal.FDQuery1.Open;

  if not (dmPrincipal.FDQuery1.IsEmpty) then
  begin
    dmPrincipal.FDQuery1.First;
    memGridEscalados.Active := True;

    while not dmPrincipal.FDQuery1.Eof do
    begin
      if memGridEscalados.RecordCount < vQtdEscalados then
      begin
        if not (memGridEscalados.Locate('nome', dmPrincipal.FDQuery1.FieldByName('nome').AsString, [])) then
        begin
          memGridEscalados.Insert;
          memGridEscalados.FieldByName('nome').AsString := dmPrincipal.FDQuery1.FieldByName('nome').AsString;
          memGridEscalados.Post;
        end;
        dmPrincipal.FDQuery1.Next;
      end
      else
        Break;
    end;
  end;
end;

procedure TFraEscalas.cxButton2Click(Sender: TObject);
var
  frmInclusaoObreiroEscala: TFrmInclusaoObreiroEscala;
  vQtdEscalados: Integer;
begin
  inherited;

  vQtdEscalados := 0;

  if (lbTurno.Caption = 'Manhã') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_MANHA'), varInteger)
  else if (lbTurno.Caption = 'Tarde') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_TARDE'), varInteger)
  else if (lbTurno.Caption = 'Noite') then
    vQtdEscalados := VarAsType(dmPrincipal.GetParamValue('QTD_ESCALADOS_NOITE'), varInteger);

  if memGridEscalados.RecordCount >= vQtdEscalados then
  begin
    Application.MessageBox('O limite de obreiros para esta escala já foi atingido.', 'Escales', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
    Abort;
  end;

  if (chbRepetir.Checked) and (cbDiasSemana.Text = EmptyStr) then
  begin
    Application.MessageBox('Informe o dia da semana', 'Escales', MB_OK + MB_ICONWARNING);
    cbDiasSemana.SetFocus;
    Abort;
  end;

  frmInclusaoObreiroEscala := TFrmInclusaoObreiroEscala.Create(Self);
  try
    if chbRepetir.Checked then
      frmInclusaoObreiroEscala.FDia := cbDiasSemana.Text
    else
    begin
      frmInclusaoObreiroEscala.FDia := LowerCase(FormatDateTime('dddd', dtData.Date));
      frmInclusaoObreiroEscala.FDia := UpperCase(Copy(frmInclusaoObreiroEscala.FDia, 1, 1)) + LowerCase(Copy(frmInclusaoObreiroEscala.FDia, 2, Length(frmInclusaoObreiroEscala.FDia)));
    end;
    frmInclusaoObreiroEscala.FTurno := lbTurno.Caption;
    frmInclusaoObreiroEscala.FCodigoObreiro := StrToIntDef(edtCodigo.Text, 0);

    frmInclusaoObreiroEscala.ShowModal;

    if frmInclusaoObreiroEscala.ModalResult = mrOk then
    begin
      memGridEscalados.Active := True;
      memGridEscalados.Insert;
      memGridEscalados.FieldByName('nome').AsString := frmInclusaoObreiroEscala.cbNome.Text;
      memGridEscalados.Post;
    end;
  finally
    frmInclusaoObreiroEscala.Free;
  end;
end;

procedure TFraEscalas.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if ACellViewInfo.Item = cxGrid1DBTableView1Exclusao then
  begin
    if Application.MessageBox('Deseja excluir este registro?', 'Escales', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      memGridEscalados.Delete;
    end;

    AHandled := True;
  end;
end;

procedure TFraEscalas.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ImgIndex: Integer;
  X, Y: Integer;
begin
  // Desenha só para as colunas de ação
  if AViewInfo.Item = cxGrid1DBTableView1Exclusao then
    ImgIndex := 3 // lixeira
  else
    Exit;

  // Fundo da célula
  ACanvas.FillRect(AViewInfo.Bounds);

  // Centralizar o ícone
  X := AViewInfo.Bounds.Left + (AViewInfo.Bounds.Width - cxImageList.Width) div 2;
  Y := AViewInfo.Bounds.Top + (AViewInfo.Bounds.Height - cxImageList.Height) div 2;

  // Desenhar ícone
  cxImageList.Draw(ACanvas.Canvas, X, Y, ImgIndex, True);

  ADone := True; // evita que o grid redesenhe por cima
end;

procedure TFraEscalas.dtDataEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  if not (memGridEscalados.IsEmpty) and (not (Trim(edtCodigo.Text) = EmptyStr) or not (Trim(edtCodigo.Text) = '0')) then
  begin
    if Application.MessageBox('Ao optar por essa mudança, os escalados desse dia serão removidos. Deseja continuar?', 'Escales', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      memGridEscalados.EmptyDataSet;
    end
    else
    begin
      CanEdit := False;
    end;
  end;
end;

procedure TFraEscalas.EdicaoRegistro;
begin
  Self.Tag := 1;
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  chbRepetir.Checked := FDMemTable1.FieldByName('repete').AsInteger = 1;
  if chbRepetir.Checked then
    PosicionarItemIndexDiaDaSemana
  else
    dtData.Date := FDMemTable1.FieldByName('data').AsDateTime;
  hrHorario.Time := FDMemTable1.FieldByName('horario').AsVariant;

  PreencherGridEscalados;
end;

procedure TFraEscalas.ExclusaoRegistro;
var
  Escala: TEscalas;
begin
  inherited;

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('	delete ');
  dmPrincipal.FDQuery1.SQL.Add('	  from escalados ');
  dmPrincipal.FDQuery1.SQL.Add('   where codigo_escala = :codigo ');
  dmPrincipal.FDQuery1.ParamByName('codigo').AsInteger := FDMemTable1.FieldByName('codigo').AsInteger;
  dmPrincipal.FDQuery1.ExecSQL;


  Escala := TEscalas.Create;
  try
    Escala.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Escala.Delete;
    PreencherGrid;
  finally
    Escala.Free;
  end;
end;

procedure TFraEscalas.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  Self.Tag := 1;

  edtCodigo.Enabled := False;
  edtCodigo.Text := EmptyStr;
  cbSituacao.ItemIndex := 0;
  inherited;

  cbLocalidade.SetFocus;

  hrHorario.Time := Now;
  dtData.Date := now;

  if memGridEscalados.Active then
    memGridEscalados.EmptyDataSet;

end;

procedure TFraEscalas.FDMemTable1CalcFields(DataSet: TDataSet);
begin
  inherited;

  FDMemTable1nome_localidade.AsString := PesquisarLocalidade(FDMemTable1codigo_localidade.AsInteger);

  FDMemTable1desc_repete.AsString := IfThen(FDMemTable1repete.AsInteger = 1, 'Sim', 'Não');

  if (FDMemTable1repete.AsInteger = 1) then
    FDMemTable1data_dia.AsString := FDMemTable1dia.AsString
  else
    FDMemTable1data_dia.AsString := DateToStr(FDMemTable1.FieldByName('data').AsDateTime);
end;

procedure TFraEscalas.hrHorarioEditing(Sender: TObject; var CanEdit: Boolean);
begin
  inherited;
  if not (memGridEscalados.IsEmpty) and (not (Trim(edtCodigo.Text) = EmptyStr) or not (Trim(edtCodigo.Text) = '0')) then
  begin
    if Application.MessageBox('Ao optar por essa mudança, os escalados desse dia serão removidos. Deseja continuar?', 'Escales', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      memGridEscalados.EmptyDataSet;
    end
    else
    begin
      CanEdit := False;
    end;
  end;
end;

procedure TFraEscalas.hrHorarioPropertiesChange(Sender: TObject);
begin
  inherited;
  if not VarIsNull(hrHorario.EditValue) then
  begin

    if (HourOf(hrHorario.Time) >= 6) {06:00} and (HourOf(hrHorario.Time) < 12) then
      lbTurno.Caption := 'Manhã'
    else if (HourOf(hrHorario.Time) >= 12) and (HourOf(hrHorario.Time) < 18) then
      lbTurno.Caption := 'Tarde'
    else
      lbTurno.Caption := 'Noite';
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
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(Self);
  Query.Connection := dmPrincipal.FDConnection;

  memGridEscalados.Active := True;
  memGridEscalados.EmptyDataSet;

  try

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('     select c.abreviacao||''. ''||o.nome  as nome ');
    Query.SQL.Add(' 	     from obreiros o ');
    Query.SQL.Add(' inner join escalados e ');
    Query.SQL.Add('         on (o.codigo = e.codigo_obreiro) ');
    Query.SQL.Add(' inner join cargos c ');
    Query.SQL.Add('         on (o.codigo_cargo = c.codigo) ');
    Query.SQL.Add('      where e.codigo_escala = :escala ');
    Query.SQL.Add('   order by o.nome ');
    Query.ParamByName('escala').AsInteger := StrToInt(edtCodigo.Text);

    Query.Open;
    Query.FetchAll;
    if not (Query.IsEmpty) then
    begin
      Query.First;
      while not (Query.Eof) do
      begin
        memGridEscalados.Insert;
        memGridEscalados.FieldByName('nome').AsString := Query.FieldByName('nome').AsString;
        memGridEscalados.Post;
        Query.Next;
      end;
    end;
  finally
    Query.Free;
  end;
end;

procedure TFraEscalas.SalvarEscalados(CodigoEscala: Integer);
var
  Query: TFDQuery;
begin
  inherited;

  Query := TFDQuery.Create(Self);
  Query.Connection := dmPrincipal.FDConnection;

  memGridEscalados.DisableControls;
  memGridEscalados.First;

  try

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(' delete from escalados where codigo_escala = :escala');
    Query.ParamByName('escala').AsInteger := CodigoEscala;
    Query.ExecSQL;

    while not (memGridEscalados.Eof) do
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(' insert into escalados (codigo_escala, codigo_obreiro) values (:escala, :obreiro) ');
      Query.ParamByName('obreiro').AsInteger := PesquisarCodigoObreiro(memGridEscalados.FieldByName('nome').AsString);
      Query.ParamByName('escala').AsInteger := CodigoEscala;
      Query.ExecSQL;
      memGridEscalados.Next;
    end;
  finally
    memGridEscalados.DisableControls;
    Query.Free;
  end;
end;

procedure TFraEscalas.SalvarRegistro;
var
  Escala: TEscalas;
  Localidade: TLocalidades;
begin
  inherited;

  Escala := TEscalas.Create;
  Localidade := TLocalidades.Create;
  try
    Escala.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Escala.Situacao := cbSituacao.Text;
    Localidade.LoadFromField('NOME', cbLocalidade.Text);
    Escala.Localidade := Localidade;
    Escala.Data := dtData.Date;
    Escala.Dia := cbDiasSemana.Text;
    Escala.Repete := ifthen(chbRepetir.Checked, 1, 0);
    Escala.Turno := lbTurno.Caption;
    Escala.Horario := hrHorario.Time;
    Escala.Save;
    SalvarEscalados(Escala.Codigo);
  finally
    Localidade.Free;
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
    Self.Tag := 0;
  end;
end;

procedure TFraEscalas.PosicionarItemIndexDiaDaSemana;
begin
  cbDiasSemana.ItemIndex := cbDiasSemana.Properties.Items.IndexOf(FDMemTable1.FieldByName('data_dia').AsString);
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
  cbSituacao.ItemIndex := cbSituacao.Properties.Items.IndexOf(FDMemTable1.FieldByName('situacao').AsString);
end;

procedure TFraEscalas.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraEscalas.ValidarAntesSalvar;
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

  if Trim(cbSituacao.Text) = EmptyStr then
  begin
    raise ExEscalasException.Create('Para realizar a ' + vEstado + ' é necessário o campo: SITUAÇÃO. ', vCodException);
    Abort;
  end;

  if Trim(cbLocalidade.Text) = EmptyStr then
  begin
    raise ExEscalasException.Create('Para realizar a ' + vEstado + ' é necessário o campo: LOCALIDADE. ', vCodException);
    Abort;
  end;

  if chbRepetir.Checked then
  begin
    if Trim(cbDiasSemana.Text) = EmptyStr then
    begin
      raise ExEscalasException.Create('Para realizar a ' + vEstado + ' é necessário o campo: DIA DA SEMANA. ', vCodException);
      Abort;
    end;
  end
  else
  begin
    if dtData.Text = '30/12/1899' then
    begin
      raise ExEscalasException.Create('Para realizar a ' + vEstado + ' é necessário o campo: DATA. ', vCodException);
      Abort;
    end;
  end;

  if memGridEscalados.IsEmpty then
  begin
    raise ExEscalasException.Create('Para realizar a ' + vEstado + ' é necessário que exista escalados. ', vCodException);
    Abort;
  end;

end;

end.

