unit uEscalado;

interface

uses
  uModeloBase, uEscala, uObreiro, uLocalidade, uCargo;

type
  TEscalado = class(TModeloBase)
  private
    FEscala: TEscala;
    FObreiro: TObreiro;
  public
    property Escala: TEscala read FEscala write FEscala;
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

  { TEscalado }

procedure TEscalado.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO escalados (codigo_escala, codigo_obreiro)');
  FQuery.SQL.Add('            VALUES (:codigo_escala, :codigo_obreiro) ');
  FQuery.ParamByName('codigo_escala').AsInteger := FEscala.Codigo;
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TEscalado.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE escalados SET codigo_escala = :codigo_escala, codigo_obreiro = :codigo_obreiro ');
  FQuery.SQL.Add('  WHERE codigo_escala = :codigo_escala, codigo_obreiro = :codigo_obreiro');
  FQuery.ParamByName('codigo_escala').AsInteger := FEscala.Codigo;
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TEscalado.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM escalados ');
  FQuery.SQL.Add('  WHERE codigo_escala = :codigo_escala, codigo_obreiro = :codigo_obreiro ');
  FQuery.ParamByName('codigo_escala').AsInteger := FEscala.Codigo;
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TEscalado.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('    SELECT escalas.codigo as codigo_escala, escalas.data, escalas.horario, escalas.turno, ');
  FQuery.SQL.Add('	         localidades.codigo as codigo_localidade, localidades.descricao as descricao_localidade, ');
  FQuery.SQL.Add('	         obreiros.codigo as codigo_obreiro, obreiros.nome, obreiros.dt_nascimento, ');
  FQuery.SQL.Add('		       cargos.codigo as codigo_cargo, cargos.abreviacao, cargos.descricao as descricao_cargo ');
  FQuery.SQL.Add('	    FROM escalados ');
  FQuery.SQL.Add('INNER JOIN escalas ON escalados.codigo_escala = escalas.codigo ');
  FQuery.SQL.Add('INNER JOIN localidades ON escalas.codigo_localidade = localidades.codigo ');
  FQuery.SQL.Add('INNER JOIN obreiros ON escalados.codigo_obreiro = obreiros.codigo ');
  FQuery.SQL.Add('INNER JOIN cargos ON obreiros.codigo_cargo = cargos.codigo ');
  FQuery.SQL.Add('     WHERE escalados.codigo_escala = :codigo_escala ');
  FQuery.SQL.Add('	     AND escalados.codigo_obreiro = :codigo_obreiro ');

  FQuery.ParamByName('codigo_escala').AsInteger := FEscala.Codigo;
  FQuery.ParamByName('codigo_obreiro').AsInteger := FObreiro.Codigo;

  try
    FQuery.Open;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar consultar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;

  if not (FQuery.IsEmpty) then
  begin
    FEscala.Codigo := FQuery.FieldByName('codigo_escala').AsInteger;
    FEscala.Data := FQuery.FieldByName('data').AsDateTime;
    FEscala.Horario := FQuery.FieldByName('turno').AsDateTime;
    FEscala.Turno := FQuery.FieldByName('turno').AsString;
    FEscala.Localidade.Codigo := FQuery.FieldByName('codigo_localidade').AsInteger;
    FEscala.Localidade.Descricao := FQuery.FieldByName('descricao_localidade').AsString;
    FObreiro.Codigo := FQuery.FieldByName('codigo_obreiro').AsInteger;
    FObreiro.Nome := FQuery.FieldByName('nome').AsString;
    FObreiro.DtNascimento := FQuery.FieldByName('dt_nascimento').AsDateTime;
    FObreiro.Cargo.Codigo := FQuery.FieldByName('codigo_cargo').AsInteger;
    FObreiro.Cargo.Abreviacao := FQuery.FieldByName('abreviacao').AsString;
    FObreiro.Cargo.Descricao := FQuery.FieldByName('descricao_cargo').AsString;
  end;
end;

constructor TEscalado.Create;
begin
  inherited;
  FEscala := TEscala.Create;
  FObreiro := TObreiro.Create;
end;

destructor TEscalado.Destroy;
begin
  FObreiro.Free;
  FEscala.Free;
  inherited;
end;

end.

