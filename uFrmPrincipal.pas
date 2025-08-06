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
  cxGridTableView, cxGridDBTableView, cxGrid, uLibary;

type
  TfrmPrincipal = class(TForm)
    dxSkinController1: TdxSkinController;

  private
    { Private declarations }
    lib: TLibary;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

end.

