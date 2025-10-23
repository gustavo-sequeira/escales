unit uLibary;

interface

uses
  cxLabel;

type
  TLibary = class
  public
    class function RemoveAcentos(const Texto: string): string; static;
    class function DiaDaSemana(Data: TDateTime): string; static;
    class function MesValido(const AMes: string): Boolean;
    class function RetornarPalavra(const Texto: string; Posicao: integer): string;
    class function AnoValido(const Texto: string; out Ano: Integer): Boolean;
    class function MelhorarTexto(const TextoOriginal: string): string;
    class function SegundosAleatorios: Integer;
    class function GerarMensagemLembrete(const Nome: string; const Horario: string): string;
    class procedure MudarCorLabelEnter(pLabel: TcxLabel);
    class procedure MudarCorLabelLeave(pLabel: TcxLabel);
    class function ValidarTelefone(const pTelefone: string; out pMensagem: string): boolean;
    class function ArquivoAlteradoRecentemente(const FileName: string): Boolean;
    class function KillProcessByName(const ExeName: string): Boolean;
  end;

implementation

uses
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  Vcl.Graphics, System.SysUtils, System.StrUtils, System.JSON, System.Classes,
  System.Generics.Collections, System.RegularExpressions, DateUtils,
  FireDAC.Comp.Client, uDmPrincipal, Winapi.TlHelp32, WinApi.Windows;

class function TLibary.MesValido(const AMes: string): Boolean;
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

class procedure TLibary.MudarCorLabelEnter(pLabel: TcxLabel);
begin
  pLabel.Style.TextColor := clBlue;
end;

class procedure TLibary.MudarCorLabelLeave(pLabel: TcxLabel);
begin
  pLabel.Style.TextColor := clWindowText;
end;

class function TLibary.ValidarTelefone(const pTelefone: string; out pMensagem: string): boolean;
var
  Digits, DDD, Numero: string;
begin
  Result := true;

  // mantém apenas dígitos
  Digits := TRegEx.Replace(pTelefone, '\D', '');

  // precisa ter 10 ou 11 dígitos (DDD + número)
  if not (Length(Digits) in [10, 11]) then
  begin
    pMensagem := 'Número inválido';
    Result := False;
    Exit;
  end;

  // separa DDD
  DDD := Copy(Digits, 1, 2);
  Numero := Copy(Digits, 3, Length(Digits) - 2);

  // valida DDD (11–99)
  if not TRegEx.IsMatch(DDD, '^(1[1-9]|[2-9][0-9])$') then
  begin
    pMensagem := 'DDD inválido';
    Result := False;
    Exit;
  end;

  // celular: 9 dígitos começando com 9
  if (Length(Numero) = 9) and not (Numero.StartsWith('9')) then
  begin
    pMensagem := 'Número de celular inválido';
    Result := False;
    Exit;
  end
  else if (Length(Numero) = 8) and not (TRegEx.IsMatch(Numero[1], '[2-5]')) then
  begin
    pMensagem := 'Número de telefone inválido';
    Result := False;
    Exit;
  end;
end;

class function TLibary.RetornarPalavra(const Texto: string; Posicao: integer): string;
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

class function TLibary.AnoValido(const Texto: string; out Ano: Integer): Boolean;
begin
  Result := TryStrToInt(Texto, Ano) and (Ano >= 2025) and (Ano <= 2030);
end;

class function TLibary.MelhorarTexto(const TextoOriginal: string): string;
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

class function TLibary.SegundosAleatorios: Integer;
begin
  Randomize;
  Result := Random(20) + 1;
end;

class function TLibary.KillProcessByName(const ExeName: string): Boolean;
var
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
  hProcess: THandle;
begin
  Result := False;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  if Snapshot <> INVALID_HANDLE_VALUE then
  try
    ProcessEntry.dwSize := SizeOf(ProcessEntry);
    if Process32First(Snapshot, ProcessEntry) then
      repeat
        if SameText(ProcessEntry.szExeFile, ExeName) then
        begin
          hProcess := OpenProcess(PROCESS_TERMINATE, False, ProcessEntry.th32ProcessID);
          if hProcess <> 0 then
          try
            Result := TerminateProcess(hProcess, 0);
          finally
            CloseHandle(hProcess);
          end;
        end;
      until not Process32Next(Snapshot, ProcessEntry);
  finally
    CloseHandle(Snapshot);
  end;
end;


class function TLibary.ArquivoAlteradoRecentemente(
  const FileName: string): Boolean;
var
  DataModificacao: TDateTime;
  d1, d2: Integer;
begin
  Result := False;
  if not FileExists(FileName) then
    Exit;

  // obtém a data/hora da última modificação
  DataModificacao := FileDateToDateTime(FileAge(FileName));

  d2 := FileAge(FileName);
  d1 := DateTimeToFileDate(now);

  // compara com o horário atual (diferença em minutos)
  // Result := (Now - DataModificacao) * 24 * 60 <= 5;
  Result := (FileDateToDateTime(d1) - FileDateToDateTime(d2)) * 24 * 60 <= 5;
end;

class function TLibary.DiaDaSemana(Data: TDateTime): string;
const
  Dias: array[1..7] of string = ('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado');
begin
  Result := Dias[DayOfTheWeek(Data)];
end;

class function TLibary.GerarMensagemLembrete(const Nome: string; const Horario: string): string;
const
  Versiculos: array[0..3] of string = ('"Sede firmes e constantes, sempre abundantes na obra do Senhor." (1Co 15:58)', '"Rogai, pois, ao Senhor da seara que envie obreiros para a sua seara." (Mt 9:38)', '"Cada um exerça o dom que recebeu para servir aos outros." (1Pe 4:10)', '"Tudo quanto fizerdes, fazei-o de coração, como ao Senhor." (Cl 3:23)');
  Mensagens: array[0..3] of string = ('Que alegria tê-lo servindo ao Senhor conosco!', 'Que sua dedicação inspire e edifique a todos!', 'Deus fortaleça seu coração neste serviço!', 'Que sua presença seja canal de bênção nesta obra!');
var
  Versiculo, Saudacao: string;
begin
  Randomize;
  Versiculo := Versiculos[Random(Length(Versiculos))];
  Saudacao := Mensagens[Random(Length(Mensagens))];

  Result := Format('Olá, irmão %s! Você está escalado para o culto às %s. %s %s', [Nome, Horario, Versiculo, Saudacao]);
end;

class function TLibary.RemoveAcentos(const Texto: string): string;
var
  s: string;
begin
  s := Trim(Texto);
  if s = '' then
  begin
    Result := '';
    Exit;
  end;

  s := LowerCase(RemoveAcentos(s));

  Result := UpperCase(s[1]) + Copy(s, 2, MaxInt);
end;

end.

