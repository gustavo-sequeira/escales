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
  FireDAC.Comp.Client, cxButtonEdit;

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
    procedure tsManutencaoShow(Sender: TObject);
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure btnFrameCancelarClick(Sender: TObject);
    procedure pcFramePrincipalResize(Sender: TObject);
    procedure tsConsultaResize(Sender: TObject);
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure grdFramePrincialDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure grdFramePrincialDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }

  public
    { Public declarations }
    emTransacao: Boolean;
    procedure PreencherCamposEdicao; virtual; abstract;
    procedure ExclusaoRegistro; virtual; abstract;
  end;

implementation

uses
  uDmPrincipal;

{$R *.dfm}

procedure TFraModelo.btnFrameCancelarClick(Sender: TObject);
begin
  emTransacao := False;
  pcFramePrincipal.ActivePage := tsConsulta;
end;

procedure TFraModelo.btnFrameConfirmarClick(Sender: TObject);
begin
  emTransacao := False;
  pcFramePrincipal.ActivePage := tsConsulta;
end;

procedure TFraModelo.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  pcFramePrincipal.ActivePage := tsManutencao;
  emTransacao := True;
  Abort;
end;

procedure TFraModelo.grdFramePrincialDBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if ACellViewInfo.Item = grdFramePrincialDBTableView1ColEdicao then
  begin
    // Ação de edição
    PreencherCamposEdicao;
    pcFramePrincipal.ActivePage := tsManutencao;
    AHandled := True;
  end
  else if ACellViewInfo.Item = grdFramePrincialDBTableView1ColExclusao then
  begin
    if MessageDlg('Deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
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

