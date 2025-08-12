unit uLembrete;

interface

uses
  uModeloBase;

type
  TLembrete = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FLembrete: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Lembrete: string read FLembrete write FLembrete;
  end;

implementation


end.

