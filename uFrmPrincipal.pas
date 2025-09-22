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
  cxSplitter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uLibary, dxSkinOffice2010Blue,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxLabel, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxLocalization;

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
    actCadastroLocalidades: TAction;
    actCadastroVersiculos: TAction;
    actCadastroLembretes: TAction;
    actCadastroEscalas: TAction;
    actConfiguracaoParametros: TAction;
    procedure actCadastroCargosExecute(Sender: TObject);
    procedure actCadastroObreirosExecute(Sender: TObject);
    procedure dxNavBarDashboardClick(Sender: TObject);
    procedure actCadastroLocalidadesExecute(Sender: TObject);
    procedure actCadastroVersiculosExecute(Sender: TObject);
    procedure actCadastroLembretesExecute(Sender: TObject);
    procedure actCadastroEscalasExecute(Sender: TObject);
    procedure actConfiguracaoParametrosExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uFraObreiros, uFraModelo, uFraCargos, uFraLocalidades, uFraVersiculos,
  uFraLembretes, uFraEscalas, Vcl.Imaging.pngimage, Math, uFraParametros;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.actCadastroCargosExecute(Sender: TObject);
begin
  ControleFrame('cargos');
end;

procedure TfrmPrincipal.actCadastroLocalidadesExecute(Sender: TObject);
begin
  ControleFrame('localidades');
end;

procedure TfrmPrincipal.actCadastroObreirosExecute(Sender: TObject);
begin
  ControleFrame('obreiros');
end;

procedure TfrmPrincipal.actCadastroVersiculosExecute(Sender: TObject);
begin
  ControleFrame('versiculos');
end;

procedure TfrmPrincipal.actConfiguracaoParametrosExecute(Sender: TObject);
begin
  ControleFrame('parametros');
end;

procedure TfrmPrincipal.actCadastroEscalasExecute(Sender: TObject);
begin
  ControleFrame('escalas');
end;

procedure TfrmPrincipal.actCadastroLembretesExecute(Sender: TObject);
begin
  ControleFrame('lembretes');
end;

procedure TfrmPrincipal.ControleFrame(pFrame: string; pLimparTodos: Boolean = False);
var
  fCargo, fObreiro, fLocalidade, fVersiculo, fLembrete, fEscala, fParametros: TFraModelo;
  i: Integer;
begin

  for i := gbTerciarioCenter.ControlCount - 1 downto 0 do
  begin
    if gbTerciarioCenter.Controls[i] is TFrame then
    begin
      if pFrame = 'obreiros' then
      begin
        if TfraObreiros(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'cargos' then
      begin
        if TfraCargos(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'localidades' then
      begin
        if TfraLocalidades(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'versiculos' then
      begin
        if TFraVersiculos(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'lembretes' then
      begin
        if TFraLembretes(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'escalas' then
      begin
        if TFraEscalas(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end
      else if pFrame = 'parametros' then
      begin
        if TFraParametros(gbTerciarioCenter.Controls[i]).emTransacao then
          Exit;
      end;

      gbTerciarioCenter.Controls[i].Free;
    end;
  end;

  if not (pLimparTodos) then
  begin
    if pFrame = 'obreiros' then
    begin
 //     if TfraObreiros(gbTerciarioCenter.Controls[i]).emTransacao then
 //       Exit;
      fObreiro := TfraObreiros.Create(Self);
      fObreiro.Parent := gbTerciarioCenter;
      fObreiro.Align := alClient;
      fObreiro.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'cargos' then
    begin
 //     if TfraCargos(TControl(FindComponent('TfraCargos'))).emTransacao then
 //       Exit;
      fCargo := TfraCargos.Create(Self);
      fCargo.Parent := gbTerciarioCenter;
      fCargo.Align := alClient;
      fCargo.pcFramePrincipal.ActivePageIndex := 0;

    end
    else if pFrame = 'localidades' then
    begin
 //     if TfraCargos(TControl(FindComponent('TfraCargos'))).emTransacao then
 //       Exit;
      fLocalidade := TfraLocalidades.Create(Self);
      fLocalidade.Parent := gbTerciarioCenter;
      fLocalidade.Align := alClient;
      fLocalidade.pcFramePrincipal.ActivePageIndex := 0;

    end
    else if pFrame = 'versiculos' then
    begin
 //     if TfraCargos(TControl(FindComponent('TfraCargos'))).emTransacao then
 //       Exit;
      fVersiculo := TfraVersiculos.Create(Self);
      fVersiculo.Parent := gbTerciarioCenter;
      fVersiculo.Align := alClient;
      fVersiculo.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'lembretes' then
    begin
 //     if TfraCargos(TControl(FindComponent('TfraCargos'))).emTransacao then
 //       Exit;
      fLembrete := TfraLembretes.Create(Self);
      fLembrete.Parent := gbTerciarioCenter;
      fLembrete.Align := alClient;
      fLembrete.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'escalas' then
    begin
 //     if TfraCargos(TControl(FindComponent('TfraCargos'))).emTransacao then
 //       Exit;
      fEscala := TfraEscalas.Create(Self);
      fEscala.Parent := gbTerciarioCenter;
      fEscala.Align := alClient;
      fEscala.pcFramePrincipal.ActivePageIndex := 0;
    end
    else if pFrame = 'parametros' then
    begin
      fParametros := TFraParametros.Create(Self);
      fParametros.Parent := gbTerciarioCenter;
      fParametros.Align := alClient;
      fParametros.pcFramePrincipal.ActivePageIndex := 0;    end;
  end;
end;

procedure TfrmPrincipal.dxNavBarDashboardClick(Sender: TObject);
begin
  ControleFrame(EmptyStr, True);
end;

end.

