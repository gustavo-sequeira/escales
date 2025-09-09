unit uEscala;

interface

uses
  uModeloBase, uLocalidade;

type
  TEscalas = class(TModeloBase)
  private
    FCodigo: Integer;
    FLocalidade: TLocalidades;
    FData: TDate;
    FHorario: TTime;
    FTurno: string;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Localidade: TLocalidades read FLocalidade write FLocalidade;
    property Data: TDate read FData write FData;
    property Horario: TTime read FHorario write FHorario;
    property Turno: string read FTurno write FTurno;
  end;

implementation


end.

