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
  FireDAC.VCLUI.Wait;

type
  TFrmRelatorioEscala = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDMemTable1: TFDMemTable;
    FDMemTable1situacao: TStringField;
    FDMemTable1repete: TStringField;
    FDMemTable1dia: TStringField;
    FDMemTable1data: TDateField;
    FDMemTable1turno: TStringField;
    FDMemTable1codigo_evento: TIntegerField;
    FDMemTable1evento: TStringField;
    FDMemTable1localidade: TStringField;
    FDMemTable1abreviacao: TStringField;
    FDMemTable1obreiro: TStringField;
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
