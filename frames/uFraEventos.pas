unit uFraEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinOffice2010Blue, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,
  cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxGroupBox,
  cxMemo, cxTextEdit, cxLabel, uEvento;

type
  TFraEventos = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    mmDescricao: TcxMemo;
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    procedure EdicaoRegistro; override;
    procedure SalvarRegistro; override;
    procedure ExclusaoRegistro; override;
    procedure PreencherGrid; override;
    procedure ValidarAntesSalvar; override;
    procedure ValidarAntesExcluir; override;
  end;

var
  FraEventos: TFraEventos;

implementation

uses
  System.UITypes, uEXEscales, uModeloBase;

{$R *.dfm}

{ TFraEventos }

procedure TFraEventos.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  edtNome.Text := FDMemTable1.FieldByName('nome').AsString;
  mmDescricao.Lines.Text := FDMemTable1.FieldByName('descricao').AsString;
end;

procedure TFraEventos.ExclusaoRegistro;
var
  Evento: TEventos;
begin
  inherited;
  Evento := TEventos.Create;
  try
    Evento.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Evento.Delete;
    PreencherGrid;
  finally
    Evento.Free;
  end;
end;


procedure TFraEventos.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
end;

procedure TFraEventos.PreencherGrid;
var
  Eventos: TEventos;
  Query: TFDQuery;
begin
  inherited;
  Eventos := TEventos.Create;
  Query := Eventos.ListToQuery;

  Query.Open;
  Query.FetchAll;
  try
    FDMemTable1.Close;
    try
      FDMemTable1.CloneCursor(Query);
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  finally
    Eventos.Free;
    Query.Free;
  end;
end;

procedure TFraEventos.SalvarRegistro;
var
  Evento: TEventos;
begin
  inherited;
  Evento := TEventos.Create;
  try
    Evento.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Evento.Nome := Trim(edtNome.Text);
    Evento.Descricao := Trim(mmDescricao.Text);
    Evento.Save;
  finally
    Evento.Free;
  end;
end;

procedure TFraEventos.ValidarAntesExcluir;
var
  vArrStrings: TArray<TFKInfo>;
  vEstado: string;
  vCodException: Integer;
  Evento: TEventos;
begin
  inherited;

  vEstado := 'exclusão';
  vCodException := 3001;

  SetLength(vArrStrings, 1);

  vArrStrings[0].tabela := 'escalas';
  vArrStrings[0].chaveEstrangeira := 'codigo_evento';

  Evento := TEventos.Create();
  try
    Evento.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    if Evento.TotalReg(vArrStrings) > 0 then
    begin
      raise ExCargosException.Create('Não foi possível realizar a exclusão. Registro é usado em outras tabelas. ', vCodException);
      Abort;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TFraEventos.ValidarAntesSalvar;
var
  vEstado: string;
  vCodException: Integer;
begin
  inherited;
  if ((Trim(edtCodigo.Text) = EmptyStr) or (Trim(edtCodigo.Text) = '0')) then
  begin
    vEstado := 'inclusão';
    vCodException := 1001;
  end
  else
  begin
    vEstado := 'alteração';
    vCodException := 2001;
  end;

  if Trim(edtNome.Text) = EmptyStr then
  begin
    raise ExEventosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: NOME. ', vCodException);
    Abort;
  end;
end;


end.

