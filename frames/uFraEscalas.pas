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
    cxComboBox1: TcxComboBox;
    cxGroupBox5: TcxGroupBox;
    dtData: TcxDateEdit;
    chbRepetir: TcxCheckBox;
    cbDiasSemana: TcxComboBox;
    lbTurno: TcxLabel;
    hrHorario: TcxTimeEdit;
    procedure tsManutencaoShow(Sender: TObject);
    procedure chbRepetirClick(Sender: TObject);
    procedure hrHorarioPropertiesChange(Sender: TObject);
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
  FraEscalas: TFraEscalas;

implementation

uses System.DateUtils;

{$R *.dfm}

{ TFraEscalas }

procedure TFraEscalas.chbRepetirClick(Sender: TObject);
begin
  inherited;
  if chbRepetir.Checked then
  begin
    cbDiasSemana.Visible := True;
    cbDiasSemana.Align := alClient;
    dtData.Visible := False;
    dtData.Align := alNone;
    lbData.Caption := 'Dia da semana';
  end else
  begin
    cbDiasSemana.Visible := False;
    cbDiasSemana.Align := alNone;
    dtData.Visible := True;
    dtData.Align := alClient;
    lbData.Caption := 'Data';
  end;
end;

procedure TFraEscalas.EdicaoRegistro;
begin
  inherited;

end;

procedure TFraEscalas.ExclusaoRegistro;
begin
  inherited;

end;

procedure TFraEscalas.hrHorarioPropertiesChange(Sender: TObject);
begin
  inherited;
  if not VarIsNull(hrHorario.EditValue) then
  begin

    if (HourOf(hrHorario.Time) >= 6) {06:00}and (HourOf(hrHorario.Time) < 12) then
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
begin
  inherited;

end;

procedure TFraEscalas.SalvarRegistro;
begin
  inherited;

end;

procedure TFraEscalas.tsManutencaoShow(Sender: TObject);
begin
  inherited;

  gbFrameSecundario.Height := gbFramePrincipal.Height - (Round(gbFramePrincipal.Height * 0.15) + (btnFrameCancelar.Height));

end;

procedure TFraEscalas.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraEscalas.ValidarAntesSalvar;
begin
  inherited;

end;

end.

