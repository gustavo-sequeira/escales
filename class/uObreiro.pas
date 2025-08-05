unit uObreiro;

interface

uses
  uModeloBase, uCargo;

type
  TObreiro = class(TModeloBase)
  private
    FCodigo: Integer;
    FCargo: TCargo;
    FNome: string;
    FDtNascimento: TDate;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Cargo: TCargo read FCargo write FCargo;
    property Nome: string read FNome write FNome;
    property DtNascimento: TDate read FDtNascimento write FDtNascimento;

    constructor Create;
    destructor Destroy; override;
    procedure Inserir; override;
    procedure Atualizar; override;
    procedure Excluir; override;
    procedure BuscarPorID(ID: Integer); override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.UITypes, FiredaC.Stan.Param, Data.DB;

{ TObreiro }

procedure TObreiro.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE obreiros ');
  FQuery.SQL.Add('  	SET codigo_cargo = :codigo_cargo, nome = :nome, dt_nascimento = :dt_nascimento ');
  FQuery.SQL.Add('	WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  FQuery.ParamByName('codigo_cargo').AsInteger := FCargo.Codigo;
  FQuery.ParamByName('nome').AsString := FNome;
  FQuery.ParamByName('dt_nascimento').AsDate := FDtNascimento;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TObreiro.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('     SELECT obreiros.codigo, obreiros.nome, obreiros.dt_nascimento, ');
  FQuery.SQL.Add(' 	          cargos.codigo AS codigo_cargo, cargos.abreviacao, cargos.descricao ');
  FQuery.SQL.Add('       FROM obreiros ');
  FQuery.SQL.Add(' INNER JOIN cargos ON obreiros.codigo_cargo = cargos.codigo ');
  FQuery.SQL.Add('      WHERE obreiros.codigo = :codigo ');
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
    FCargo.Codigo := FQuery.FieldByName('codigo_cargo').AsInteger;
    FCargo.Abreviacao := FQuery.FieldByName('abreviacao').AsString;
    FCargo.Descricao := FQuery.FieldByName('descricao').AsString;
    FNome := FQuery.FieldByName('nome').AsString;
    FDtNascimento := FQuery.FieldByName('dt_nascimento').AsDateTime;
  end;
end;

constructor TObreiro.Create;
begin
  inherited;
  FCargo := TCargo.Create;
end;

destructor TObreiro.Destroy;
begin
  FCargo.Free;
  inherited;
end;

procedure TObreiro.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM obreiros ');
  FQuery.SQL.Add('	WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TObreiro.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' INSERT INTO obreiros (codigo_cargo, nome, dt_nascimento)');
  FQuery.SQL.Add('	             VALUES (:codigo_cargo, :nome, :dt_nascimento) ');
  FQuery.ParamByName('codigo_cargo').AsInteger := FCargo.Codigo;
  FQuery.ParamByName('nome').AsString := FNome;
  FQuery.ParamByName('dt_nascimento').AsDate := FDtNascimento;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

end.

