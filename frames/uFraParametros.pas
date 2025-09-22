unit uFraParametros;

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
  cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxPC, cxGroupBox,
  cxTextEdit, cxLabel;

type
  TFraParametros = class(TFraModelo)
    cxLabel3: TcxLabel;
    edtValor: TcxTextEdit;
    cxLabel1: TcxLabel;
    lbNomeParametro: TcxLabel;
    grdFramePrincialDBTableView1nome: TcxGridDBColumn;
    grdFramePrincialDBTableView1valor: TcxGridDBColumn;
    FDMemTable1nome: TWideMemoField;
    FDMemTable1valor: TWideMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EdicaoRegistro; override;
    procedure ValidarAntesSalvar; override;
    procedure ValidarAntesExcluir; override;
    procedure PreencherGrid; override;
    procedure SalvarRegistro; override;
  end;

var
  FraParametros: TFraParametros;

implementation

uses
  uDmPrincipal;

{$R *.dfm}

{ TFraParametros }

procedure TFraParametros.EdicaoRegistro;
begin
  inherited;
  lbNomeParametro.Caption := FDMemTable1.FieldByName('nome').AsString;
  edtValor.Text := FDMemTable1.FieldByName('valor').AsString;
end;

procedure TFraParametros.PreencherGrid;
var
  Query: TFDQuery;
begin
  inherited;

  Query := TFDQuery.Create(Self);
  Query.Connection := dmPrincipal.FDConnection;

  Query.SQL.Add(' select upper(nome) as nome, valor from parametros order by nome ');
  Query.Open;

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
    Query.Free;
  end;
end;

procedure TFraParametros.SalvarRegistro;
var
  Query: TFDQuery;
begin
  inherited;

  Query := TFDQuery.Create(Self);
  try
    try
      Query.Connection := dmPrincipal.FDConnection;

      Query.SQL.Add(' update parametros set valor = :valor where lower(nome) = lower(:nome) ');
      Query.ParamByName('valor').AsString := Trim(edtValor.Text);
      Query.ParamByName('nome').AsString := Trim(lbNomeParametro.Caption);
      Query.ExecSQL;
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  finally
    Query.Free;
  end;
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

