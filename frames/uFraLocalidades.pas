unit uFraLocalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2010Blue, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxMemo, cxTextEdit, cxLabel;

type
  TFraLocalidades = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    cxLabel3: TcxLabel;
    mmDescricao: TcxMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FraLocalidades: TFraLocalidades;

implementation

{$R *.dfm}

end.
