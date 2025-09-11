unit uEscalado;

interface

uses
  uModeloBase, uEscala, uObreiro, uLocalidade, uCargo;

  {$M+}
type
  TEscalados = class(TModeloBase)
  private
    FEscala: TEscalas;
    FObreiro: TObreiros;
  published
    property Escala: TEscalas read FEscala write FEscala;
    property Obreiro: TObreiros read FObreiro write FObreiro;
  end;

implementation

end.

