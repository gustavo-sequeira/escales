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
    FObreiro: TObreiros;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Ddd: Integer read FDdd write FDdd;
    property Numero: integer read FNumero write FNumero;
    property Principal: Integer read FPrincipal write FPrincipal;
    property Obreiro: TObreiros read FObreiro write FObreiro;
  end;

implementation


end.

