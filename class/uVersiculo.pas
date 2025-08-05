unit uVersiculo;

interface

uses
  uModeloBase;

type
  TVersiculo = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FVersiculo: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Versiculo: string read FVersiculo write FVersiculo;

    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure BuscarPorID(ID: Integer); override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FiredaC.Stan.Param, Data.DB;

{ TVersiculo }

procedure TVersiculo.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO versiculos (status, versiculo)');
  FQuery.SQL.Add('            VALUES (:status, :versiculo) ');
  FQuery.ParamByName('status').AsInteger := FStatus;
  FQuery.ParamByName('versiculo').AsString := FVersiculo;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TVersiculo.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE versiculos SET status = :status, versiculo = :versiculo ');
  FQuery.SQL.Add('  WHERE codigo = :codigo');
  FQuery.ParamByName('status').AsInteger := FStatus;
  FQuery.ParamByName('versiculo').AsString := FVersiculo;
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TVersiculo.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM versiculos ');
  FQuery.SQL.Add('  WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TVersiculo.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' SELECT codigo, status, versiculo');
  FQuery.SQL.Add('  FROM versiculos WHERE codigo = :codigo');
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
    FStatus := FQuery.FieldByName('status').AsInteger;
    FVersiculo := FQuery.FieldByName('versiculo').AsString;
  end;
end;

end.

