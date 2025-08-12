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
    [TForeignKey('Cargos', 'Codigo')]
    property Cargo: TCargo read FCargo write FCargo;
    property Nome: string read FNome write FNome;
    property DtNascimento: TDate read FDtNascimento write FDtNascimento;
  end;

implementation


end.

