unit uFraLocalidades;

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
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxMemo,
  cxTextEdit, cxLabel, FireDAC.Phys.PGDef, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.VCLUI.Wait;

type
  TFraLocalidades = class(TFraModelo)
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    cxLabel3: TcxLabel;
    mmDescricao: TcxMemo;
    FDMemTable1codigo: TIntegerField;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1nome: TcxGridDBColumn;
    grdFramePrincialDBTableView1descricao: TcxGridDBColumn;
    FDMemTable1nome: TWideMemoField;
    FDMemTable1descricao: TWideMemoField;
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure FDMemTable1AfterInsert(DataSet: TDataSet);
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
  FraLocalidades: TFraLocalidades;

implementation

uses
  uLocalidade, uEXEscales, uModeloBase, System.UITypes;

{$R *.dfm}

{ TFraLocalidades }

procedure TFraLocalidades.btnFrameConfirmarClick(Sender: TObject);
var
  Localidade: TLocalidades;
begin
  Localidade := TLocalidades.Create;
  try
    try
      if trim(edtCodigo.Text) = EmptyStr then
        Localidade.Codigo := 0
      else
        Localidade.Codigo := StrToInt(edtCodigo.Text);
      Localidade.Nome := Trim(edtNome.Text);
      Localidade.Descricao := Trim(mmDescricao.Text);
      inherited;

    except
      on e: Exception do
      begin
        if Localidade.Codigo = 0 then
          MessageDlg('Erro ao tentar incluir. ' + e.Message, mtError, [mbOK], 0)
        else
          MessageDlg('Erro ao tentar atualizar. ' + e.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    Localidade.Free;
  end;
end;

procedure TFraLocalidades.EdicaoRegistro;
begin
  inherited;
  edtCodigo.Text := IntToStr(FDMemTable1.FieldByName('codigo').AsInteger);
  edtCodigo.Enabled := False;
  edtNome.Text := FDMemTable1.FieldByName('nome').AsString;
  mmDescricao.Lines.Text := FDMemTable1.FieldByName('descricao').AsString;
end;

procedure TFraLocalidades.ExclusaoRegistro;
var
  Localidade: TLocalidades;
begin
  inherited;
  Localidade := TLocalidades.Create;
  try
    Localidade.Codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    Localidade.Delete;
  finally
    Localidade.Free;
  end;
end;

procedure TFraLocalidades.FDMemTable1AfterInsert(DataSet: TDataSet);
begin
  edtCodigo.Text := '0';
  edtCodigo.Enabled := False;
  inherited;
end;

procedure TFraLocalidades.PreencherGrid;
var
  Localidade: TLocalidades;
  Query: TFDQuery;
begin
  inherited;
  Localidade := TLocalidades.Create;
  Query := Localidade.ListToQuery;

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
    Localidade.Free;
    Query.Free;
  end;
end;

procedure TFraLocalidades.SalvarRegistro;
var
  Localidade: TLocalidades;
begin
  inherited;
  Localidade := TLocalidades.Create;
  try
    Localidade.Codigo := StrToIntDef(edtCodigo.Text, 0);
    Localidade.Nome := Trim(edtNome.Text);
    Localidade.Descricao := Trim(mmDescricao.Text);
    Localidade.Save;
  finally
    Localidade.Free;
  end;
end;

procedure TFraLocalidades.ValidarAntesExcluir;
var
  vArrStrings: TArray<TFKInfo>;
  vEstado: string;
  vCodException: Integer;
  Localidades: TLocalidades;
begin
  inherited;

  vEstado := 'exclusão';
  vCodException := 3001;

  SetLength(vArrStrings, 1);

  vArrStrings[0].tabela := 'escalas';
  vArrStrings[0].chaveEstrangeira := 'codigo_localidade';

  Localidades := TLocalidades.Create();
  try
    if Localidades.TotalReg(vArrStrings) > 0 then
    begin
      raise EXEscales.Create('Não foi possível realizar a exclusão. Registro é usado em outras tabelas. ', vCodException);
      Abort;
    end;
  finally
    Localidades.Free;
  end;
end;

procedure TFraLocalidades.ValidarAntesSalvar;
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
    raise ExLocalidadesException.Create('Para realizar a ' + vEstado + ' é necessário o campo: NOME. ', vCodException);
    Abort;
  end;
end;

end.

