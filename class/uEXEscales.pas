unit uEXEscales;

interface

uses
  System.SysUtils;

type
  // Exce��o base da aplica��o
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

