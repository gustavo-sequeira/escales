unit uEscala;

interface

uses
  uModeloBase, uLocalidade;

  {$M+}
type
  TEscalas = class(TModeloBase)
  private
    FCodigo: Integer;
    FLocalidade: TLocalidades;
    FData: TDate;
    FHorario: TTime;
    FTurno: string;
    FSituacao: string;
    FDia: string;
    FRepete: Integer;
  published
    [TPrimaryKey(True)]
    property Codigo: Integer read FCodigo write FCodigo;
    [TForeignKey('Localidades', 'Codigo', 'codigo_localidade')]
    property Localidade: TLocalidades read FLocalidade write FLocalidade;
    property Data: TDate read FData write FData;
    property Horario: TTime read FHorario write FHorario;
    property Turno: string read FTurno write FTurno;
    property Situacao: string read FSituacao write FSituacao;
    property Dia: string read FDia write FDia;
    property Repete: Integer read FRepete write FRepete;
  end;

implementation

end.

