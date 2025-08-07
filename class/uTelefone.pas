unit uTelefone;

interface

uses
  uModeloBase, uObreiro;

type
  TTelefone = class(TModeloBase)
  private
    FCodigo: Integer;
    FDdd: Integer;
    FNumero: integer;
    FPrincipal: Integer;
    FObreiro: TObreiro;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Ddd: Integer read FDdd write FDdd;
    property Numero: integer read FNumero write FNumero;
    property Principal: Integer read FPrincipal write FPrincipal;
    property Obreiro: TObreiro read FObreiro write FObreiro;

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

  { TTelefone }

constructor TTelefone.Create;
begin
  inherited;
  FObreiro := TObreiro.Create;
end;

destructor TTelefone.Destroy;
begin
  FObreiro.Free;
  inherited;
end;

procedure TTelefone.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO telefones (codigo_obreiro, numero)');
  FQuery.SQL.Add('            VALUES (:codigo_obreiro, :numero) ');
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;
  FQuery.ParamByName('numero').AsInteger := FNumero;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TTelefone.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE telefones SET codigo_obreiro=:codigo_obreiro, ddd=:ddd, numero=:numero, principal=:principal ');
  FQuery.SQL.Add('  WHERE codigo = :codigo');
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  FQuery.ParamByName('ddd').AsInteger := FDdd;
  FQuery.ParamByName('numero').AsInteger := FNumero;
  FQuery.ParamByName('principal').AsInteger := FPrincipal;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TTelefone.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM telefones ');
  FQuery.SQL.Add('  WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TTelefone.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('     SELECT telefones.ddd, telefones.numero, telefones.principal, telefones.codigo, ');
  FQuery.SQL.Add('            obreiros.codigo as codigo_obreiro, obreiros.nome, obreiros.dt_nascimento, ');
  FQuery.SQL.Add(' 	       cargos.codigo as codigo_cargo, cargos.abreviacao, cargos.descricao as descricao_cargo ');
  FQuery.SQL.Add('   	  FROM telefones ');
  FQuery.SQL.Add(' INNER JOIN obreiros on telefones.codigo_obreiro = obreiros.codigo ');
  FQuery.SQL.Add(' INNER JOIN cargos on obreiros.codigo_cargo = cargos.codigo ');
  FQuery.SQL.Add('      WHERE telefones.codigo.codigo = :codigo ');
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
    FDdd :=  FQuery.FieldByName('ddd').AsInteger;
    FNumero :=  FQuery.FieldByName('numero').AsInteger;
    FPrincipal :=  FQuery.FieldByName('principal').AsInteger;
    FObreiro.Codigo :=  FQuery.FieldByName('ddd').AsInteger;
    FObreiro.Nome :=  FQuery.FieldByName('nome').AsString;
    FObreiro.DtNascimento :=  FQuery.FieldByName('dt_nascimento').AsDateTime;
    FObreiro.Cargo.Codigo :=  FQuery.FieldByName('codigo_cargo').AsInteger;
    FObreiro.Cargo.Abreviacao :=  FQuery.FieldByName('abreviacao').AsString;
    FObreiro.Cargo.Descricao :=  FQuery.FieldByName('descricao_cargo').AsString;
  end;
end;

end.

