unit uLembrete;

interface

uses
  uModeloBase;

  {$M+}
type
  TLembretes = class(TModeloBase)
  private
    FCodigo: Integer;
    FStatus: Integer;
    FLembrete: string;
  published
    [TPrimaryKey(True)]
    property Codigo: Integer read FCodigo write FCodigo;
    property Status: Integer read FStatus write FStatus;
    property Lembrete: string read FLembrete write FLembrete;
  end;

implementation

end.

