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
  end;

implementation


end.

