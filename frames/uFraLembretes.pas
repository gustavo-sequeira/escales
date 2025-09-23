unit uFraLembretes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2010Blue, dxBarBuiltInMenu, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, cxImageList, Vcl.StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxLabel,
  cxMemo, cxCheckBox, cxTextEdit, Vcl.ExtCtrls, dxSkinWXI;

type
  TFraLembretes = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtCodigo: TcxTextEdit;
    chbStatus: TcxCheckBox;
    mmDescricao: TcxMemo;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1status: TIntegerField;
    FDMemTable1desc_status: TStringField;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1status: TcxGridDBColumn;
    grdFramePrincialDBTableView1lembrete: TcxGridDBColumn;
    grdFramePrincialDBTableView1desc_status: TcxGridDBColumn;
    FDMemTable1lembrete: TWideMemoField;
    procedure FDMemTable1BeforeInsert(DataSet: TDataSet);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EdicaoRegistro; override;
    procedure SalvarRegistro; override;
    procedure ExclusaoRegistro; override;
    procedure PreencherGrid; override;
    procedure ValidarAntesSalvar; override;
    procedure ValidarAntesExcluir; override;
  end;

var
  FraLembretes: TFraLembretes;

implementation


uses uLembrete, System.Math, uExEscales, System.StrUtils;

{$R *.dfm}

{ TFraLembretes }

procedure TFraLembretes.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  chbStatus.Checked := FDMemTable1.FieldByName('status').AsInteger = 1;
  mmDescricao.Lines.Text := FDMemTable1.FieldByName('lembrete').AsString;
end;

procedure TFraLembretes.ExclusaoRegistro;
var
  Lembrete: TLembretes;
begin
  inherited;
  Lembrete := TLembretes.Create;
  try
    Lembrete.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Lembrete.Delete;
    PreencherGrid;
  finally
    Lembrete.Free;
  end;
end;

procedure TFraLembretes.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
end;

procedure TFraLembretes.FDMemTable1CalcFields(DataSet: TDataSet);
begin
  inherited;
  FDMemTable1desc_status.AsString := ifthen(FDMemTable1status.AsInteger = 1, 'Ativo','Inativo');
end;

procedure TFraLembretes.PreencherGrid;
var
  Lembrete: TLembretes;
  Query: TFDQuery;
begin
  inherited;
  Lembrete := TLembretes.Create;
  Query := Lembrete.ListToQuery;

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
    Lembrete.Free;
    Query.Free;
  end;
end;

procedure TFraLembretes.SalvarRegistro;
var
  Lembrete: TLembretes;
begin
  inherited;
  Lembrete := TLembretes.Create;
  try
    Lembrete.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Lembrete.Status :=  ifthen(chbStatus.Checked, 1, 0);
    Lembrete.Lembrete := Trim(mmDescricao.Text);
    Lembrete.Save;
  finally
    Lembrete.Free;
  end;
end;

procedure TFraLembretes.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraLembretes.ValidarAntesSalvar;
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

  if Trim(mmDescricao.Text) = EmptyStr then
  begin
    raise ExLembretesException.Create('Para realizar a ' + vEstado + ' é necessário o campo: LEMBRETE. ', vCodException);
    Abort;
  end;
end;

end.
