unit uCargo;

interface

uses
  uModeloBase;

type
  TCargos = class(TModeloBase)
  private
    FCodigo: Integer;
    FAbreviacao: string;
    FNome: string;
    FDescricao: string;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Abreviacao: string read FAbreviacao write FAbreviacao;
    property Nome: string read FNome write FNome;
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation


end.

