unit uLibary;

interface

type
  TLibary = class
  public
    function MesValido(const AMes: string): Boolean;
    function RetornarPalavra(const Texto: string; Posicao: integer): string;
    function AnoValido(const Texto: string; out Ano: Integer): Boolean;
    function MelhorarTexto(const TextoOriginal: string): string;
    function SegundosAleatorios: Integer;
    function GerarMensagemLembrete(const Nome: string; const Horario: string): string;
  end;

implementation

uses
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  System.SysUtils, System.StrUtils, System.JSON, System.Classes, System.Generics.Collections;

function TLibary.MesValido(const AMes: string): Boolean;
const
  Meses: array[1..12] of string = ('janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro');
var
  MesNormalizado: string;
  I: Integer;
begin
  // Remove acentos e converte para minúsculas
  MesNormalizado := AnsiLowerCase(AnsiReplaceText(AnsiReplaceText(AnsiReplaceText(LowerCase(AMes), 'ç', 'c'), 'á', 'a'), 'é', 'e'));
  MesNormalizado := StringReplace(MesNormalizado, 'í', 'i', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, 'ó', 'o', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, 'ú', 'u', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, 'â', 'a', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, 'ê', 'e', [rfReplaceAll]);
  MesNormalizado := StringReplace(MesNormalizado, 'ô', 'o', [rfReplaceAll]);

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
    Lista.StrictDelimiter := True; // considera apenas espaço como separador
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

function TLibary.MelhorarTexto(const TextoOriginal: string): string;
const
  API_KEY = 'SUA_CHAVE_AQUI';
  URL = 'https://api.openai.com/v1/chat/completions';
var
  HttpClient: TNetHTTPClient;
  ReqBody, MsgObj: TJSONObject;
  Msgs: TJSONArray;
  Response: IHTTPResponse;
  RespJSON: TJSONObject;
begin
  Result := '';
  HttpClient := TNetHTTPClient.Create(nil);
  try
    HttpClient.CustomHeaders['Authorization'] := 'Bearer ' + API_KEY;
    HttpClient.ContentType := 'application/json';

    // Montar o corpo da requisição
    MsgObj := TJSONObject.Create;
    MsgObj.AddPair('role', 'user');
    MsgObj.AddPair('content', TextoOriginal);

    Msgs := TJSONArray.Create;
    Msgs.AddElement(MsgObj);

    ReqBody := TJSONObject.Create;
    ReqBody.AddPair('model', 'gpt-3.5-turbo');
    ReqBody.AddPair('messages', Msgs);

    // Enviar requisição
    Response := HttpClient.Post(URL, TStringStream.Create(ReqBody.ToJSON, TEncoding.UTF8), nil);

    // Tratar resposta
    RespJSON := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
    try
      Result := RespJSON.GetValue<TJSONArray>('choices').Items[0].GetValue<TJSONObject>('message').GetValue<string>('content').Trim;
    finally
      RespJSON.Free;
    end;
  finally
    HttpClient.Free;
  end;
end;

function TLibary.SegundosAleatorios: Integer;
begin
  Randomize; 
  Result := Random(20) + 1; 
end;

function TLibary.GerarMensagemLembrete(const Nome: string; const Horario: string): string;
const
  Versiculos: array[0..3] of string = (
    '"Sede firmes e constantes, sempre abundantes na obra do Senhor." (1Co 15:58)',
    '"Rogai, pois, ao Senhor da seara que envie obreiros para a sua seara." (Mt 9:38)',
    '"Cada um exerça o dom que recebeu para servir aos outros." (1Pe 4:10)',
    '"Tudo quanto fizerdes, fazei-o de coração, como ao Senhor." (Cl 3:23)'
  );

  Mensagens: array[0..3] of string = (
    'Que alegria tê-lo servindo ao Senhor conosco!',
    'Que sua dedicação inspire e edifique a todos!',
    'Deus fortaleça seu coração neste serviço!',
    'Que sua presença seja canal de bênção nesta obra!'
  );
var
  Versiculo, Saudacao: string;
begin
  Randomize;
  Versiculo := Versiculos[Random(Length(Versiculos))];
  Saudacao := Mensagens[Random(Length(Mensagens))];

  Result := Format('Olá, irmão/irmã %s! Você está escalado para o culto às %s. %s %s',
                   [Nome, Horario, Versiculo, Saudacao]);
end;

end.

