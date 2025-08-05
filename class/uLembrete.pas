unit uLembrete;

interface

uses
  uModeloBase;

type
  TLembrete = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FLembrete: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Lembrete: string read FLembrete write FLembrete;

    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure BuscarPorID(ID: Integer); override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FiredaC.Stan.Param, Data.DB;

  { TLembrete }

procedure TLembrete.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO lembretes (status, lembrete)');
  FQuery.SQL.Add('            VALUES (:status, :lembrete) ');
  FQuery.ParamByName('status').AsInteger := FStatus;
  FQuery.ParamByName('lembrete').AsString := FLembrete;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TLembrete.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE lembretes SET status = :status, lembrete = :lembrete ');
  FQuery.SQL.Add('  WHERE codigo = :codigo');
  FQuery.ParamByName('status').AsInteger := FStatus;
  FQuery.ParamByName('lembrete').AsString := FLembrete;
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TLembrete.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM lembretes ');
  FQuery.SQL.Add('  WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TLembrete.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' SELECT codigo, status, lembrete');
  FQuery.SQL.Add('  FROM lembretes WHERE codigo = :codigo');
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
    FLembrete := FQuery.FieldByName('lembrete').AsString;
  end;
end;

end.

