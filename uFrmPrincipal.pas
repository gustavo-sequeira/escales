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
  cxGridTableView, cxGridDBTableView, cxGrid, uLibary, dxSkinOffice2010Blue,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxLabel, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

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
    dxNavBarCadastros: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBarDashboard: TdxNavBarGroup;
    dxNavBarCadastroCargos: TdxNavBarItem;
    dxNavBarCadastroEscalas: TdxNavBarItem;
    dxNavBarCadastroLembretes: TdxNavBarItem;
    dxNavBarCadastroLocalidades: TdxNavBarItem;
    dxNavBarCadastroObreiros: TdxNavBarItem;
    dxNavBarCadastroTelefones: TdxNavBarItem;
    dxNavBarCadastroVersiculos: TdxNavBarItem;
    dxNavBarDashboardControl: TdxNavBarGroupControl;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    ActionManager1: TActionManager;
    actCadastroCargos: TAction;
    actCadastroObreiros: TAction;
    Action1: TAction;
    procedure actCadastroCargosExecute(Sender: TObject);
    procedure actCadastroObreirosExecute(Sender: TObject);
    procedure dxNavBarDashboardClick(Sender: TObject);

  private
    { Private declarations }
    lib: TLibary;
  public
    { Public declarations }
    procedure ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFraObreiros, uFraModelo, uFraCargos;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.actCadastroCargosExecute(Sender: TObject);
begin
  ControleFrame('cargos');
end;

procedure TfrmPrincipal.actCadastroObreirosExecute(Sender: TObject);
begin
  ControleFrame('obreiros');
end;

procedure TfrmPrincipal.ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
var
  f: TFraModelo;
  i: Integer;
begin

  for i := gbTerciarioCenter.ControlCount - 1 downto 0 do
  begin
    if gbTerciarioCenter.Controls[i] is TFrame then
    begin
      gbTerciarioCenter.Controls[i].Free;
    end;
  end;
  if not (pLimparTodos) then
  begin
    if pFrame = 'obreiros' then
      f := TfraObreiros.Create(Self)
    else if pFrame = 'cargos' then
      f := TfraCargos.Create(Self)
    else
      f := TFraModelo.Create(Self);
    f.Parent := gbTerciarioCenter;
    f.Align := alClient;
    f.pcFramePrincipal.ActivePageIndex := 0;
  end;
end;

procedure TfrmPrincipal.dxNavBarDashboardClick(Sender: TObject);
begin
  ControleFrame(EmptyStr, True);
end;

end.

