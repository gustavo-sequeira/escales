unit uTelefone;

interface

uses
  FireDAC.Comp.Client;

type
  TTelefone = class
  private
    FContatoId: Integer;
    FTelefone: string;
  public
    property ContatoId: Integer read FContatoId write FContatoId;
    property Telefone: string read FTelefone write FTelefone;

    function Inserir(AConn: TFDConnection): Boolean;
    function Atualizar(AConn: TFDConnection; ANovoTelefone: string): Boolean;
    function Excluir(AConn: TFDConnection): Boolean;
    function Carregar(AConn: TFDConnection; AContatoId: Integer; ATelefone: string): Boolean;
  end;

implementation

uses
  Firedac.Stan.Param;

function TTelefone.Inserir(AConn: TFDConnection): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'INSERT INTO telefones ("contatoId", telefone) VALUES (:contatoId, :telefone)';
    ParamByName('contatoId').AsInteger := FContatoId;
    ParamByName('telefone').AsString := FTelefone;
    ExecSQL;
    Result := True;
  finally
    Free;
  end;
end;

function TTelefone.Atualizar(AConn: TFDConnection; ANovoTelefone: string): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'UPDATE telefones SET telefone = :novoTelefone WHERE "contatoId" = :contatoId AND telefone = :telefone';
    ParamByName('contatoId').AsInteger := FContatoId;
    ParamByName('telefone').AsString := FTelefone;
    ParamByName('novoTelefone').AsString := ANovoTelefone;
    ExecSQL;
    FTelefone := ANovoTelefone;
    Result := True;
  finally
    Free;
  end;
end;

function TTelefone.Excluir(AConn: TFDConnection): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'DELETE FROM telefones WHERE "contatoId" = :contatoId AND telefone = :telefone';
    ParamByName('contatoId').AsInteger := FContatoId;
    ParamByName('telefone').AsString := FTelefone;
    ExecSQL;
    Result := True;
  finally
    Free;
  end;
end;

function TTelefone.Carregar(AConn: TFDConnection; AContatoId: Integer; ATelefone: string): Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
  try
    Connection := AConn;
    SQL.Text := 'SELECT * FROM telefones WHERE "contatoId" = :contatoId AND telefone = :telefone';
    ParamByName('contatoId').AsInteger := AContatoId;
    ParamByName('telefone').AsString := ATelefone;
    Open;
    if not Eof then
    begin
      FContatoId := FieldByName('contatoId').AsInteger;
      FTelefone := FieldByName('telefone').AsString;
      Result := True;
    end;
  finally
    Free;
  end;
end;

end.

