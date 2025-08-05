unit uContato;

interface

uses
  FireDAC.Comp.Client;

type
  TContato = class
  private
    FCodigo: Integer;
    FNome: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;

    function Inserir(AConn: TFDConnection): Boolean;
    function Atualizar(AConn: TFDConnection): Boolean;
    function Excluir(AConn: TFDConnection): Boolean;
    function Carregar(AConn: TFDConnection; ACodigo: Integer): Boolean;
  end;

implementation

uses
  Firedac.Stan.Param;

function TContato.Inserir(AConn: TFDConnection): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'INSERT INTO contatos (nome) VALUES (:nome) RETURNING codigo';
    ParamByName('nome').AsString := FNome;
    Open;
    FCodigo := FieldByName('codigo').AsInteger;
    Result := True;
  finally
    Free;
  end;
end;

function TContato.Atualizar(AConn: TFDConnection): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'UPDATE contatos SET nome = :nome WHERE codigo = :codigo';
    ParamByName('nome').AsString := FNome;
    ParamByName('codigo').AsInteger := FCodigo;
    ExecSQL;
    Result := True;
  finally
    Free;
  end;
end;

function TContato.Excluir(AConn: TFDConnection): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'DELETE FROM contatos WHERE codigo = :codigo';
    ParamByName('codigo').AsInteger := FCodigo;
    ExecSQL;
    Result := True;
  finally
    Free;
  end;
end;

function TContato.Carregar(AConn: TFDConnection; ACodigo: Integer): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'SELECT codigo, nome FROM contatos WHERE codigo = :codigo';
    ParamByName('codigo').AsInteger := ACodigo;
    Open;
    if not Eof then
    begin
      FCodigo := FieldByName('codigo').AsInteger;
      FNome := FieldByName('nome').AsString;
      Result := True;
    end;
  finally
    Free;
  end;
end;

end.

