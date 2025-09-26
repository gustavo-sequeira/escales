unit uEXEscales;

interface

uses
  System.SysUtils;

type
  // Exceção base da aplicação
  ExEscalas = class(Exception)
  private
    FCodigoErro: Integer;
  public
    constructor Create(const Msg: string; ACodigoErro: Integer = 0); reintroduce;
    property CodigoErro: Integer read FCodigoErro;
  end;


  ExCargosException = class(ExEscalas);
  ExDisponibilidadesException = class(ExEscalas);
  ExObreirosException = class(ExEscalas);
  EConexaoBDException = class(ExEscalas);
  ExPermissaoException = class(ExEscalas);
  ExLocalidadesException = class(ExEscalas);
  ExVersiculosException = class(ExEscalas);
  ExLembretesException = class(ExEscalas);
  ExEscalasException = class(ExEscalas);
  ExEventosException = class(ExEscalas);

implementation

{ EXEscales }

constructor ExEscalas.Create(const Msg: string; ACodigoErro: Integer);
begin
  inherited Create(Msg);
  FCodigoErro := ACodigoErro;
end;

end.

