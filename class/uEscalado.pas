unit uEscalado;

interface

uses
  uModeloBase, uEscala, uObreiro, uLocalidade, uCargo;

type
  TEscalado = class(TModeloBase)
  private
    FEscala: TEscalas;
    FObreiro: TObreiros;
  public
    property Escala: TEscalas read FEscala write FEscala;
    property Obreiro: TObreiros read FObreiro write FObreiro;
  end;

implementation


end.

