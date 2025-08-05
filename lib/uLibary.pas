unit uLibary;

interface

type
  TLibary = class
  public
    function MesValido(const AMes: string): Boolean;
    function RetornarPalavra(const Texto: string; Posicao: integer): string;
    function AnoValido(const Texto: string; out Ano: Integer): Boolean;   
  end;

implementation

uses
  System.SysUtils, System.StrUtils, System.Classes;

function TLibary.MesValido(const AMes: string): Boolean;
const
  Meses: array[1..12] of string = ('janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro');
var
  MesNormalizado: string;
  I: Integer;
begin
  // Remove acentos e converte para min�sculas
  MesNormalizado := AnsiLowerCase(AnsiReplaceText(AnsiReplaceText(AnsiReplaceText(LowerCase(AMes), '�', 'c'), '�', 'a'), '�', 'e'));
  MesNormalizado := StringReplace(MesNormalizado, '�', 'i', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, '�', 'o', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, '�', 'u', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, '�', 'a', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, '�', 'e', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, '�', 'o', [rfReplaceAll]);

  Result := False;
  for I := Low(Meses) to High(Meses) do
    if Meses[I] = MesNormalizado then
      Exit(True);
end;

function TLibary.RetornarPalavra(const Texto: string; Posicao: integer): string;
var
  Lista: TStringList;
begin
  Result := '';
  Lista := TStringList.Create;
  try
    Lista.Delimiter := ' ';
    Lista.StrictDelimiter := True; // considera apenas espa�o como separador
    Lista.DelimitedText := Trim(Texto);

    if (Posicao >= 1) and (Posicao <= Lista.Count) then
      Result := Lista[Posicao - 1];
  finally
    Lista.Free;
  end;
end;

function TLibary.AnoValido(const Texto: string; out Ano: Integer): Boolean;
begin
  Result := TryStrToInt(Texto, Ano) and (Ano >= 2025) and (Ano <= 2030);
end;

end.

