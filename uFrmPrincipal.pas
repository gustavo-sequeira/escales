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
  cxLabel, Vcl.ExtCtrls, dxNavBarCollns, dxNavBarBase, dxNavBar,
  Vcl.WinXCalendars, cxCalendar, cxScheduler, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerAgendaView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, cxSchedulerRecurrence,
  dxBarBuiltInMenu, cxSchedulerTreeListBrowser,
  cxSchedulerRibbonStyleEventEditor, dxPrinting, cxSchedulerActions,
  System.Actions, Vcl.ActnList, dxActions;

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
    ActionList1: TActionList;
    cxImageList1: TcxImageList;
    cxImageList2: TcxImageList;
    dxSchedulerNewEvent: TdxSchedulerNewEvent;
    dxSchedulerNewRecurringEvent: TdxSchedulerNewRecurringEvent;
    dxSchedulerGoBackward: TdxSchedulerGoBackward;
    dxSchedulerGoForward: TdxSchedulerGoForward;
    dxSchedulerGoToToday: TdxSchedulerGoToToday;
    dxSchedulerGoToDate: TdxSchedulerGoToDate;
    dxSchedulerNextSevenDays: TdxSchedulerNextSevenDays;
    dxSchedulerDayView: TdxSchedulerDayView;
    dxSchedulerWorkWeekView: TdxSchedulerWorkWeekView;
    dxSchedulerWeekView: TdxSchedulerWeekView;
    dxSchedulerMonthView: TdxSchedulerMonthView;
    dxSchedulerTimeGridView: TdxSchedulerTimeGridView;
    dxSchedulerYearView: TdxSchedulerYearView;
    dxSchedulerGanttView: TdxSchedulerGanttView;
    dxSchedulerAgendaView: TdxSchedulerAgendaView;
    dxSchedulerGroupByNone: TdxSchedulerGroupByNone;
    dxSchedulerGroupByDate: TdxSchedulerGroupByDate;
    dxSchedulerGroupByResource: TdxSchedulerGroupByResource;
    dxSchedulerTimeScale60Minutes: TdxSchedulerTimeScale60Minutes;
    dxSchedulerTimeScale30Minutes: TdxSchedulerTimeScale30Minutes;
    dxSchedulerTimeScale15Minutes: TdxSchedulerTimeScale15Minutes;
    dxSchedulerTimeScale10Minutes: TdxSchedulerTimeScale10Minutes;
    dxSchedulerTimeScale6Minutes: TdxSchedulerTimeScale6Minutes;
    dxSchedulerTimeScale5Minutes: TdxSchedulerTimeScale5Minutes;
    dxSchedulerCompressWeekends: TdxSchedulerCompressWeekends;
    dxSchedulerWorkTimeOnly: TdxSchedulerWorkTimeOnly;
    dxSchedulerSnapEventsToTimeSlots: TdxSchedulerSnapEventsToTimeSlots;
    dxSchedulerDateNavigator: TdxSchedulerDateNavigator;
    dxSchedulerResourcesLayoutEditor: TdxSchedulerResourcesLayoutEditor;
    dxSchedulerShowPrintForm: TdxSchedulerShowPrintForm;
    dxSchedulerShowPrintPreviewForm: TdxSchedulerShowPrintPreviewForm;
    dxSchedulerShowPageSetupForm: TdxSchedulerShowPageSetupForm;
    cxScheduler1: TcxScheduler;
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

uses
  uFraObreiros, uFraModelo;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.dxNavBar1Group4Click(Sender: TObject);
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

  f := TFraModelo.Create(Self);
  f.Parent := gbTerciarioCenter;
  f.Align := alClient;
end;

procedure TfrmPrincipal.dxNavBar1Item5Click(Sender: TObject);
var
  f: TFraObreiros;
  i: Integer;
begin

  for i := gbTerciarioCenter.ControlCount - 1 downto 0 do
  begin
    if gbTerciarioCenter.Controls[i] is TFrame then
    begin
      gbTerciarioCenter.Controls[i].Free;
    end;
  end;

  f := TFraObreiros.Create(Self);
  f.Parent := gbTerciarioCenter;
  f.Align := alClient;
end;

end.

