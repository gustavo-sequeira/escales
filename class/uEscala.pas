unit uEscala;

interface

uses
  uModeloBase, uLocalidade;

type
  TEscala = class(TModeloBase)
  private
    FCodigo: Integer;
    FLocalidade: TLocalidade;
    FData: TDate;
    FHorario: TTime;
    FTurno: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Localidade: TLocalidade read FLocalidade write FLocalidade;
    property Data: TDate read FData write FData;
    property Horario: TTime read FHorario write FHorario;
    property Turno: string read FTurno write FTurno;

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

{ TEscala }

procedure TEscala.Atualizar;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' UPDATE escalas ');
  FQuery.SQL.Add('  	SET codigo_localidade=:codigo_localidade, data=:data, horario=:horario, turno=:turno ');
  FQuery.SQL.Add('	WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo_localidade').AsInteger := FLocalidade.Codigo;
  FQuery.ParamByName('data').AsDate := FData;
  FQuery.ParamByName('horario').AsTime := FHorario;
  FQuery.ParamByName('turno').AsString := FTurno;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar atualizar. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TEscala.BuscarPorID(ID: Integer);
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('    SELECT escalas.codigo, escalas.data, escalas.horario, escalas.turno, ');
  FQuery.SQL.Add('	         localidades.codigo as codigo_localidade, localidades.descricao ');
  FQuery.SQL.Add('   	  FROM escalas ');
  FQuery.SQL.Add('INNER JOIN localidades ON escalas.codigo_localidade = localidades.codigo ');
  FQuery.SQL.Add('     WHERE escalas.codigo = :codigo ');
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
    FLocalidade.Codigo := FQuery.FieldByName('codigo_localidade').AsInteger;
    FLocalidade.Descricao := FQuery.FieldByName('descricao').AsString;
    FData := FQuery.FieldByName('data').AsDateTime;
    FHorario := FQuery.FieldByName('horario').AsDateTime;
    FTurno := FQuery.FieldByName('turno').AsString;
  end;
end;

constructor TEscala.Create;
begin
  inherited;
  FLocalidade := TLocalidade.Create;
end;

destructor TEscala.Destroy;
begin
  FLocalidade.Free;
  inherited;
end;

procedure TEscala.Excluir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' DELETE FROM escalas ');
  FQuery.SQL.Add('	WHERE codigo = :codigo ');
  FQuery.ParamByName('codigo').AsInteger := FCodigo;
  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar excluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TEscala.Inserir;
begin
  inherited;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(' INSERT INTO escalas (codigo_localidade, data, horario, turno)');
  FQuery.SQL.Add('	             VALUES (:codigo_localidade, :data, :horario, :turno) ');
  FQuery.ParamByName('codigo_localidade').AsInteger := FLocalidade.Codigo;
  FQuery.ParamByName('data').AsDate := FData;
  FQuery.ParamByName('horario').AsTime := FHorario;
  FQuery.ParamByName('turno').AsString := FTurno;

  try
    FQuery.ExecSQL;
  except
    on e: Exception do
      MessageDlg('Erro ao tentar incluir. ERROR: ' + e.Message, mtError, [mbOK], 0);
  end;
end;

end.

