unit uObreiro;

interface

uses
  uModeloBase, uCargo;

type
  TObreiros = class(TModeloBase)
  private
    FCodigo: Integer;
    FCargo: TCargos;
    FNome: string;
    FDtNascimento: TDate;
  published
    [TPrimaryKey(True)]
    property Codigo: Integer read FCodigo write FCodigo;
    [TForeignKey('Cargos', 'Codigo', 'codigo_cargo')]
    property Cargo: TCargos read FCargo write FCargo;
    property Nome: string read FNome write FNome;
    property Dt_Nascimento: TDate read FDtNascimento write FDtNascimento;
  end;

implementation


end.

