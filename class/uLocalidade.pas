unit uLocalidade;

interface

uses
  uModeloBase;

type
  TLocalidades = class(TModeloBase)
  private
    FCodigo: Integer;
    FNome: string;
    FDescricao: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

