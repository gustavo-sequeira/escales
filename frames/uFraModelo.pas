unit uFraModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinOffice2010Blue, cxGroupBox, cxImage, dxSkinsCore, dxBarBuiltInMenu, cxPC,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus,
  Vcl.StdCtrls, cxButtons;

type
  TFraModelo = class(TFrame)
    gbPrincipal: TcxGroupBox;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFraModelo.cxButton1Click(Sender: TObject);
begin
  ShowMessage('left: '+IntToStr(cxButton1.Left));
  ShowMessage('width: '+IntToStr(cxGroupBox1.Width));
end;

procedure TFraModelo.cxButton2Click(Sender: TObject);
begin
  ShowMessage('left: '+IntToStr(cxButton2.Left));
end;

procedure TFraModelo.cxButton3Click(Sender: TObject);
begin
  ShowMessage('left: '+IntToStr(cxButton3.Left));
end;

end.

