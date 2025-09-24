unit uFraModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinOffice2010Blue, cxGroupBox, cxImage, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.Menus, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxLabel, dxSkinsCore, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxRadioGroup, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,
  Vcl.ExtCtrls, PNGImage, dxGDIPlusClasses;

type
  TFraModelo = class(TFrame)
    gbPrincipal: TcxGroupBox;
    pcFramePrincipal: TcxPageControl;
    tsConsulta: TcxTabSheet;
    tsManutencao: TcxTabSheet;
    grdFramePrincialDBTableView1: TcxGridDBTableView;
    grdFramePrincialLevel1: TcxGridLevel;
    grdFramePrincial: TcxGrid;
    gbFramePrincipal: TcxGroupBox;
    cxImageList: TcxImageList;
    gbFrameSecundario: TcxGroupBox;
    btnFrameConfirmar: TcxButton;
    btnFrameCancelar: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    grdFramePrincialDBTableView1ColEdicao: TcxGridDBColumn;
    grdFramePrincialDBTableView1ColExclusao: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    zebradoEven: TcxStyle;
    zebradoOdd: TcxStyle;
    pbConsulta: TPaintBox;
    pbManutencao: TPaintBox;
    Image1: TImage;
    procedure tsManutencaoShow(Sender: TObject);
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure btnFrameCancelarClick(Sender: TObject);
    procedure pcFramePrincipalResize(Sender: TObject);
    procedure tsConsultaResize(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure grdFramePrincialDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdFramePrincialDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure pbConsultaPaint(Sender: TObject);
    procedure pbManutencaoPaint(Sender: TObject);
  private

    { Private declarations }
    FImg: TPngImage;

  public
    { Public declarations }
    emTransacao: Boolean;
    constructor Create(AOwner: TComponent); override;
    procedure EdicaoRegistro; virtual;
    procedure ExclusaoRegistro; virtual; //abstract;
    procedure SalvarRegistro; virtual;
    procedure ValidarAntesSalvar; virtual; abstract;
    procedure ValidarAntesExcluir; virtual; abstract;
    procedure PreencherGrid; virtual; abstract;
    procedure LimparControlesFrame;
    procedure LimparControlesContainer(AContainer: TWinControl);
  end;

implementation

uses
  uDmPrincipal, uLibary, System.Types, System.IOUtils;

{$R *.dfm}

procedure TFraModelo.btnFrameCancelarClick(Sender: TObject);
begin
  emTransacao := False;
  PreencherGrid;
  pcFramePrincipal.ActivePage := tsConsulta;
end;

procedure TFraModelo.btnFrameConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  emTransacao := False;
  PreencherGrid;
  pcFramePrincipal.ActivePage := tsConsulta;

  Self.Invalidate;
  Self.Repaint;
end;

constructor TFraModelo.Create(AOwner: TComponent);
var
  vImgBackgroudFrame: Boolean;
begin
  inherited;
// Carrega a imagem
  FImg := TPngImage.Create;
  FImg.LoadFromFile(TPath.GetDirectoryName(ParamStr(0)) + PathDelim + 'logo1.png');

  vImgBackgroudFrame := VarAsType(dmPrincipal.GetParamValue('IMG_FUNDO_FRAMES'), varInteger) = 1;
  pbConsulta.Visible := vImgBackgroudFrame;
  pbManutencao.Visible := vImgBackgroudFrame;
//Image1.Visible := vImgBackgroudFrame;

  PreencherGrid;
end;

procedure TFraModelo.EdicaoRegistro;
begin
  LimparControlesFrame;
end;

procedure TFraModelo.ExclusaoRegistro;
begin
  ValidarAntesExcluir;
end;

procedure TFraModelo.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  pcFramePrincipal.ActivePage := tsManutencao;
  emTransacao := True;
  LimparControlesFrame;
end;

procedure TFraModelo.grdFramePrincialDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo.Item = grdFramePrincialDBTableView1ColEdicao then
  begin
    // Ação de edição
    EdicaoRegistro;
    pcFramePrincipal.ActivePage := tsManutencao;
    AHandled := True;
  end
  else if ACellViewInfo.Item = grdFramePrincialDBTableView1ColExclusao then
  begin
    if Application.MessageBox('Deseja excluir este registro?', 'Escales', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      ExclusaoRegistro;
    end;

    AHandled := True;
  end;
end;

procedure TFraModelo.grdFramePrincialDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ImgIndex: Integer;
  X, Y: Integer;
begin
  // Desenha só para as colunas de ação
  if AViewInfo.Item = grdFramePrincialDBTableView1ColEdicao then
    ImgIndex := 2 // lápis
  else if AViewInfo.Item = grdFramePrincialDBTableView1ColExclusao then
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

procedure TFraModelo.SalvarRegistro;
begin
  ValidarAntesSalvar;
end;

procedure TFraModelo.LimparControlesContainer(AContainer: TWinControl);
var
  I: Integer;
  Ctrl: TControl;
begin
  for I := 0 to AContainer.ControlCount - 1 do
  begin
    Ctrl := AContainer.Controls[I];

    if Ctrl is TcxTextEdit then
      TcxTextEdit(Ctrl).Text := EmptyStr
    else if Ctrl is TcxComboBox then
      TcxComboBox(Ctrl).ItemIndex := -1
    else if Ctrl is TcxCheckBox then
      TcxCheckBox(Ctrl).Checked := False
    else if Ctrl is TcxRadioButton then
      TRadioButton(Ctrl).Checked := False
    else if Ctrl is TcxDateEdit then
      TcxDateEdit(Ctrl).Date := Now
    else if Ctrl is TcxMemo then
      TcxMemo(Ctrl).Clear;

    if Ctrl is TWinControl then
      LimparControlesContainer(TWinControl(Ctrl)); // Recursão
  end;
end;

procedure TFraModelo.LimparControlesFrame;
var
  I: Integer;
  Ctrl: TControl;
begin
  for I := 0 to Self.ControlCount - 1 do
  begin
    Ctrl := Self.Controls[I];

    if Ctrl is TcxTextEdit then
      TcxTextEdit(Ctrl).Text := EmptyStr
    else if Ctrl is TcxComboBox then
      TcxComboBox(Ctrl).ItemIndex := -1
    else if Ctrl is TcxCheckBox then
      TcxCheckBox(Ctrl).Checked := False
    else if Ctrl is TcxRadioButton then
      TRadioButton(Ctrl).Checked := False
    else if Ctrl is TcxDateEdit then
      TcxDateEdit(Ctrl).Date := Now
    else if Ctrl is TcxMemo then
      TcxMemo(Ctrl).Clear;

    if Ctrl is TWinControl then
      LimparControlesContainer(TWinControl(Ctrl)); // Recursão

  end;
end;

procedure TFraModelo.pbConsultaPaint(Sender: TObject);
var
  X, Y: Integer;
  StartX: Integer;
  ExtraWidth, ExtraHeight: Integer;
begin

  ExtraWidth := pbConsulta.Width + FImg.Width;
  ExtraHeight := pbConsulta.Height + FImg.Height;

  Y := -FImg.Height;
  StartX := 0;

  while Y < ExtraHeight do
  begin
    X := -FImg.Width + StartX;
    while X < ExtraWidth do
    begin
      pbConsulta.Canvas.Draw(X, Y, FImg);
      X := X + FImg.Width;
    end;
    Y := Y + FImg.Height;
    StartX := (StartX + FImg.Width) mod FImg.Width;
  end;
end;

procedure TFraModelo.pbManutencaoPaint(Sender: TObject);
var
  X, Y: Integer;
  StartX: Integer;
  ExtraWidth, ExtraHeight: Integer;
begin

  ExtraWidth := pbManutencao.Width + FImg.Width;
  ExtraHeight := pbManutencao.Height + FImg.Height;

  Y := -FImg.Height;
  StartX := 0;

  while Y < ExtraHeight do
  begin
    X := -FImg.Width + StartX;
    while X < ExtraWidth do
    begin
      pbManutencao.Canvas.Draw(X, Y, FImg);
      X := X + FImg.Width;
    end;
    Y := Y + FImg.Height;
    StartX := (StartX + FImg.Width) mod FImg.Width;
  end;
end;

procedure TFraModelo.pcFramePrincipalResize(Sender: TObject);
begin
  pcFramePrincipal.HideTabs := True;
end;

procedure TFraModelo.tsConsultaResize(Sender: TObject);
begin
  grdFramePrincial.Left := Round(tsConsulta.ClientWidth * 0.1);
  grdFramePrincial.Width := tsConsulta.ClientWidth - Round(tsConsulta.ClientWidth * 0.2);

  grdFramePrincial.Top := Round(tsConsulta.ClientHeight * 0.05);
  grdFramePrincial.Height := tsConsulta.ClientHeight - Round(tsConsulta.ClientHeight * 0.1);
end;

procedure TFraModelo.tsManutencaoShow(Sender: TObject);
begin

  gbFramePrincipal.Left := Round(tsManutencao.ClientWidth * 0.1);
  gbFramePrincipal.Width := tsManutencao.ClientWidth - Round(tsManutencao.ClientWidth * 0.2);

  gbFramePrincipal.Top := Round(tsManutencao.ClientHeight * 0.05);
  gbFramePrincipal.Height := tsManutencao.ClientHeight - Round(tsManutencao.ClientHeight * 0.1);

  btnFrameConfirmar.Left := Round((gbFramePrincipal.Width / 2) - 102);
  btnFrameConfirmar.Top := Round(gbFramePrincipal.Height * 0.9);

  btnFrameCancelar.Left := Round((gbFramePrincipal.Width / 2) + 2);
  btnFrameCancelar.Top := Round(gbFramePrincipal.Height * 0.9);

  gbFrameSecundario.Transparent := True;

  gbFrameSecundario.Left := Round(gbFramePrincipal.Width * 0.2);
  gbFrameSecundario.Width := gbFramePrincipal.Width - Round(gbFramePrincipal.Width * 0.4);

  gbFrameSecundario.Top := Round(gbFramePrincipal.Height * 0.1);
  gbFrameSecundario.Height := gbFramePrincipal.Height - (Round(gbFramePrincipal.Height * 0.2) + (btnFrameCancelar.Height));

end;

end.

