unit uEvento;

interface

uses
  uModeloBase;

  {$M+}
type
  TEventos = class(TModeloBase)
  private
    FCodigo: Integer;
    FNome: string;
    FDescricao: string;
  published
    [TPrimaryKey(True)]
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.

