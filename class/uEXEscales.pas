unit uEXEscales;

interface

uses
  System.SysUtils;

type
  // Exceção base da aplicação
  EXEscales = class(Exception)
  private
    FCodigoErro: Integer;
  public
    constructor Create(const Msg: string; ACodigoErro: Integer = 0); reintroduce;
    property CodigoErro: Integer read FCodigoErro;
  end;


  ExCargosException = class(EXEscales);
  EConexaoBDException = class(EXEscales);
  EPermissaoException = class(EXEscales);

implementation

{ EXEscales }

constructor EXEscales.Create(const Msg: string; ACodigoErro: Integer);
begin
  inherited Create(Msg);
  FCodigoErro := ACodigoErro;
end;

end.

