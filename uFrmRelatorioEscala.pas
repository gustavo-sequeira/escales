unit uFrmRelatorioEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmPrincipal, frxClass,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxDBSet;

type
  TFrmRelatorioEscala = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDMemTable1: TFDMemTable;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1nome: TStringField;
    FDMemTable1descricao: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioEscala: TFrmRelatorioEscala;

implementation

{$R *.dfm}

end.
