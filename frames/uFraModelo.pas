unit uFraModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinWXI,
  dxSkinXmas2008Blue, cxGroupBox, cxImage, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.Menus, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxLabel;

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
    p: TcxImageList;
    gbFrameSecundario: TcxGroupBox;
    btnFrameConfirmar: TcxButton;
    btnFrameCancelar: TcxButton;
    Button1: TButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    procedure tsManutencaoShow(Sender: TObject);
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure btnFrameCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pcFramePrincipalResize(Sender: TObject);
    procedure tsConsultaResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    emTransacao: Boolean;
  end;

implementation

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

procedure TFraModelo.Button1Click(Sender: TObject);
begin
  pcFramePrincipal.ActivePage := tsManutencao;
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

