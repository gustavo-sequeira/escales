unit uVersiculo;

interface

uses
  uModeloBase;

  {$M+}
type
  TVersiculos = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FVersiculo: string;
  published
    [TPrimaryKey(True)]
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Versiculo: string read FVersiculo write FVersiculo;
  end;

implementation

end.

