unit uVersiculo;

interface

uses
  uModeloBase;

type
  TVersiculo = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FVersiculo: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Versiculo: string read FVersiculo write FVersiculo;
  end;

implementation


end.

