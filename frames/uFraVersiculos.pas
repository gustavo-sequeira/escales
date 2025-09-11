unit uFraVersiculos;

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
  cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxMemo, cxCheckBox, cxTextEdit,
  cxLabel;

type
  TFraVersiculos = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    edtCodigo: TcxTextEdit;
    chbStatus: TcxCheckBox;
    mmDescricao: TcxMemo;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1status: TIntegerField;
    FDMemTable1versiculo: TWideMemoField;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1status: TcxGridDBColumn;
    grdFramePrincialDBTableView1versiculo: TcxGridDBColumn;
    FDMemTable1desc_status: TStringField;
    grdFramePrincialDBTableView1desc_status: TcxGridDBColumn;
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
  FraVersiculos: TFraVersiculos;

implementation

uses uVersiculo, System.Math, uExEscales, System.StrUtils;

{$R *.dfm}

{ TFraVersiculos }

procedure TFraVersiculos.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  chbStatus.Checked := FDMemTable1.FieldByName('status').AsInteger = 1;
  mmDescricao.Lines.Text := FDMemTable1.FieldByName('versiculo').AsString;
end;

procedure TFraVersiculos.ExclusaoRegistro;
var
  Versiculo: TVersiculos;
begin
  inherited;
  Versiculo := TVersiculos.Create;
  try
    Versiculo.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Versiculo.Delete;
    PreencherGrid;
  finally
    Versiculo.Free;
  end;
end;

procedure TFraVersiculos.FDMemTable1BeforeInsert(DataSet: TDataSet);
begin
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
  inherited;
end;

procedure TFraVersiculos.FDMemTable1CalcFields(DataSet: TDataSet);
begin
  inherited;
  FDMemTable1desc_status.AsString := ifthen(FDMemTable1status.AsInteger = 1, 'Ativo','Inativo');
end;

procedure TFraVersiculos.PreencherGrid;
var
  Versiculo: TVersiculos;
  Query: TFDQuery;
begin
  inherited;
  Versiculo := TVersiculos.Create;
  Query := Versiculo.ListToQuery;

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
    Versiculo.Free;
    Query.Free;
  end;
end;


procedure TFraVersiculos.SalvarRegistro;
var
  Versiculo: TVersiculos;
begin
  inherited;
  Versiculo := TVersiculos.Create;
  try
    Versiculo.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Versiculo.Status :=  ifthen(chbStatus.Checked, 1, 0);
    Versiculo.Versiculo := Trim(mmDescricao.Text);
    Versiculo.Save;
  finally
    Versiculo.Free;
  end;
end;

procedure TFraVersiculos.ValidarAntesExcluir;
begin
  inherited;

end;

procedure TFraVersiculos.ValidarAntesSalvar;
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
    raise ExVersiculosException.Create('Para realizar a ' + vEstado + ' é necessário o campo: VERSÍCULO. ', vCodException);
    Abort;
  end;
end;


end.
