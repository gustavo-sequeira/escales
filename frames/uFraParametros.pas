unit uFraParametros;

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
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxPC, cxGroupBox, cxTextEdit, cxLabel;

type
  TFraParametros = class(TFraModelo)
    cxLabel3: TcxLabel;
    edtNome: TcxTextEdit;
    cxLabel1: TcxLabel;
    lbNomeParametro: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidarAntesSalvar; override;
    procedure ValidarAntesExcluir; override;
    procedure PreencherGrid; override;
  end;

var
  FraParametros: TFraParametros;

implementation

{$R *.dfm}

{ TFraParametros }

procedure TFraParametros.PreencherGrid;
begin
  inherited;

end;

procedure TFraParametros.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraParametros.ValidarAntesSalvar;
begin
  inherited;

end;

end.
