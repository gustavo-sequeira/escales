unit uCargo;

interface

uses
  uModeloBase;

type
  TCargo = class(TModeloBase)
  private
    FCodigo: Integer;
    FAbreviacao: string;
    FDescricao: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Abreviacao: string read FAbreviacao write FAbreviacao;
    property Descricao: string read FDescricao write FDescricao;

    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure BuscarPorID(ID: Integer); override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FiredaC.Stan.Param, Data.DB;

procedure TCargo.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO cargos (abreviacao, descricao)');
  FQuery.SQL.Add('            VALUES (:abreviacao, :descricao) ');
  FQuery.ParamByName('abreviacao').AsString := FAbreviacao;
  FQuery.ParamByName('descricao').AsString := FDescricao;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TCargo.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE cargos SET abreviacao = :abreviacao, descricao = :descricao ');
  FQuery.SQL.Add('  WHERE codigo = :codigo');
  FQuery.ParamByName('abreviacao').AsString := FAbreviacao;
  FQuery.ParamByName('descricao').AsString := FDescricao;
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TCargo.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM cargos ');
  FQuery.SQL.Add('  WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TCargo.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' SELECT codigo, abreviacao, descricao');
  FQuery.SQL.Add('  FROM cargos WHERE codigo = :codigo');
  FQuery.ParamByName('codigo').AsInteger := ID;

  try
    FQuery.Open;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar consultar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;

  if not (FQuery.IsEmpty) then
  begin
    FCodigo := FQuery.FieldByName('codigo').AsInteger;
    FAbreviacao := FQuery.FieldByName('abreviacao').AsString;
    FDescricao := FQuery.FieldByName('descricao').AsString;
  end;
end;

end.

