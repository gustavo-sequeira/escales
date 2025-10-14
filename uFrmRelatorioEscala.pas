unit uFrmRelatorioEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmPrincipal, frxClass,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxDBSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2010Blue,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, dxSkinWXI, frxSmartMemo, frCoreClasses;

type
  TFrmRelatorioEscala = class(TForm)
    frxReport1: TfrxReport;
    frxDBDatasetPrincipal: TfrxDBDataset;
    FDMemTable1: TFDMemTable;
    FDMemTable1localidade: TStringField;
    cxGroupBox1: TcxGroupBox;
    cbMeses: TcxComboBox;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    frxDBDatasetEvento: TfrxDBDataset;
    frxDBDatasetLocalidade: TfrxDBDataset;
    frxDBDatasetObreiro: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioEscala: TFrmRelatorioEscala;

implementation

uses DateUtils;

{$R *.dfm}

procedure TFrmRelatorioEscala.FormShow(Sender: TObject);
var
  MesAtual: Integer;
begin
  // Obtém o mês atual (1 = Janeiro, 12 = Dezembro)
  MesAtual := MonthOf(Date);

  // Ajusta o ItemIndex do ComboBox
  // Obs: ItemIndex começa em 0, então subtrai 1
  cbMeses.ItemIndex := MesAtual - 1;
end;

end.

