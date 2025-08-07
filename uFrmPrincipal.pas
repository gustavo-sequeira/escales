unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox,
  AdvSmoothStepControl, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvGridWorkbook, cxTextEdit, cxMemo, tmsAdvGridExcel, System.ImageList,
  Vcl.ImgList, cxImageList, dxCore, cxClasses, dxSkinsForm, dxSkinWhiteprint,
  dxSkinLondonLiquidSky, dxSkinMcSkin, cxSplitter, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uLibary, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWXI, dxSkinXmas2008Blue, dxNavBarCollns, dxNavBarBase, dxNavBar, cxLabel,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    dxSkinController1: TdxSkinController;
    gbPrincipal: TcxGroupBox;
    gbSecundarioTop: TcxGroupBox;
    gbSecundarioCenter: TcxGroupBox;
    gbSecundarioBottom: TcxGroupBox;
    gbTerciarioLeft: TcxGroupBox;
    gbTerciarioCenter: TcxGroupBox;
    gbTerciarioRight: TcxGroupBox;
    cxLabel1: TcxLabel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    dxNavBar1Group4Control: TdxNavBarGroupControl;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    procedure dxNavBar1Item5Click(Sender: TObject);
    procedure dxNavBar1Group4Click(Sender: TObject);

  private
    { Private declarations }
    lib: TLibary;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uFraObreiros;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.dxNavBar1Group4Click(Sender: TObject);
var
 f: TFraObreiros;
begin
  f := TFraObreiros.Create(Self);
  f.Parent := gbTerciarioCenter;
  f.Align := alClient;
end;

procedure TfrmPrincipal.dxNavBar1Item5Click(Sender: TObject);
var
 f: TFraObreiros;
begin
  f := TFraObreiros.Create(Self);
  f.Parent := gbTerciarioCenter;
  f.Align := alClient;
end;

end.

