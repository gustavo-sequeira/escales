unit uLocalidade;

interface

uses
  uModeloBase;

type
  TLocalidade = class(TModeloBase)
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

