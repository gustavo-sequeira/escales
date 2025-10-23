unit uAppUtils;

interface

type
  TConsoleColor = (ccDefault, ccRed, ccGreen, ccBlue, ccYellow, ccCyan, ccMagenta, ccWhite);

procedure Log(const Msg: string; IsError: Boolean = False);

procedure EscreverConsole(const Texto: string; Cor: TConsoleColor = ccWhite; Negrito: Boolean = false);

procedure AtualizarSeNecessario;

function KillProcessByName(const ExeName: string): Boolean;

procedure FecharERenomear(const NomeExe, NovoNomeExe: string);

procedure DownloadGoogleDriveFile(const FileID, Destino: string);

implementation

uses
  Winapi.Windows, System.Net.HttpClient, System.IOUtils, ShellApi,
  System.Classes, uConsts, Winapi.TlHelp32, System.SysUtils, Vcl.Forms,
  System.RegularExpressions, System.Net.URLClient,
  System.Net.HttpClientComponent;

procedure DownloadGoogleDriveFile(const FileID, Destino: string);
var
  Http: TNetHTTPClient;
  Resp: IHTTPResponse;
  HTML, ConfirmToken, DownloadURL: string;
  Stream: TFileStream;
begin
  Http := TNetHTTPClient.Create(nil);
  try
    // 1 Primeira requisição (gera token de confirmação)
    EscreverConsole('Iniciando o download da nova versão', ccWhite);
    EscreverConsole('Gerando token de autorização', ccWhite);
    Resp := Http.Get('https://drive.google.com/uc?export=download&id=' + FileID);
    HTML := Resp.ContentAsString();


    // 2 Extrair token "confirm"
    var TokenStart := HTML.IndexOf('confirm=') + Length('confirm=');
    if TokenStart > 0 then
    begin
      var TokenEnd := HTML.IndexOf('"', TokenStart);
      ConfirmToken := HTML.Substring(TokenStart, TokenEnd - TokenStart);
      EscreverConsole('Token gerado e confirmado com sucesso', ccWhite);
    end
    else
    begin
      EscreverConsole('Token de confirmação não encontrado. Link pode estar inválido', ccRed);
      raise Exception.Create('Token de confirmação não encontrado. Link pode estar inválido.');
    end;

    // 3 Segunda requisição — agora baixa o arquivo real
    EscreverConsole('Baixando a nova versão', ccGreen);
    DownloadURL := Format('https://drive.usercontent.google.com/download?id=%s&export=download&confirm=%s', [FileID, ConfirmToken]);

    Stream := TFileStream.Create(Destino, fmCreate);
    try
      Http.Get(DownloadURL, Stream);
    finally
      Stream.Free;
    end;

  finally
    Http.Free;
  end;
end;

procedure FecharERenomear(const NomeExe, NovoNomeExe: string);
begin
  // Fecha o processo se estiver rodando

  KillProcessByName(NomeExe);

  // Aguarda o sistema liberar o arquivo
  EscreverConsole('Aguarda o sistema liberar o arquivo', ccWhite);
  Sleep(1000);

  // Renomeia
  if TFile.Exists(NomeExe) then
  begin
    EscreverConsole('Renomeado o executável antigo', ccWhite);
    TFile.Move(NomeExe, NovoNomeExe);
    EscreverConsole('Executável renomeado com sucesso!', ccWhite);
  end
  else
    EscreverConsole('Executável não encontrado: ' + NomeExe, ccRed);
end;

function KillProcessByName(const ExeName: string): Boolean;
var
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
  hProcess: THandle;
begin
  Result := False;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  EscreverConsole('Verificando se o executável esta sendo executado', ccWhite);
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
            EscreverConsole('Executável finalizado com sucesso', ccWhite);
            CloseHandle(hProcess);
          end;
        end;
      until not Process32Next(Snapshot, ProcessEntry);
  finally
    CloseHandle(Snapshot);
  end;
end;

procedure AtualizarSeNecessario;
var
  Http: THTTPClient;
  VersaoOnline, VersaoLocal: string;
  CaminhoNovoExe, CaminhoAtualExe: string;
  Stream: TMemoryStream;
begin
  Http := THTTPClient.Create;
  try
    EscreverConsole('Verificando versão local', ccWhite);
    if FileExists(NOME_VERSAO_LOCAL) then
      VersaoLocal := Trim(TFile.ReadAllText(NOME_VERSAO_LOCAL))
    else
      VersaoLocal := '';

    EscreverConsole('Verificando versão online', ccWhite);
    VersaoOnline := Trim(Http.Get(URL_VERSAO).ContentAsString());

    if VersaoOnline <> VersaoLocal then
    begin
      EscreverConsole(' Existe uma versão mais atualizada (' + VersaoOnline + ') do que a que você esta usando (' + VersaoLocal + ') ', ccWhite);
      Writeln('');
      EscreverConsole(' Iniciando processo de atualização... ', ccWhite);

      FecharERenomear(NOME_EXE, 'BKP_' + NOME_EXE);
      CaminhoAtualExe := TPath.Combine(ExtractFilePath(ParamStr(0)), 'BKP_' + NOME_EXE);
      CaminhoNovoExe := TPath.Combine(ExtractFilePath(ParamStr(0)), NOME_EXE);

      // Baixa novo executável
{      Stream := TMemoryStream.Create;
      try
        Http.Get(URL_EXE, Stream);
        Stream.SaveToFile(CaminhoNovoExe);
        Readln; //**
      finally
        Stream.Free;
      end;   }

      DownloadGoogleDriveFile(ID_GOOGLE, CaminhoNovoExe);


      // Substitui o antigo (precisa sair antes)
      if FileExists(CaminhoAtualExe) then
        MoveFileEx(PChar(CaminhoAtualExe), nil, MOVEFILE_DELAY_UNTIL_REBOOT);

      // Atualiza versão local
      TFile.WriteAllText(NOME_VERSAO_LOCAL, VersaoOnline);
    end
    else
      EscreverConsole('Não existe versão disponível', ccWhite);
      // Executa o novo e sai
    ShellExecute(0, 'open', PChar(CaminhoNovoExe), nil, nil, SW_SHOWNORMAL);

    Halt(0);

  finally
    Http.Free;
  end;
end;

procedure EscreverConsole(const Texto: string; Cor: TConsoleColor = ccWhite; Negrito: Boolean = false);
var
  vCor: Word;
  vConsole: THandle;
begin
  case Cor of
    ccRed:
      vCor := FOREGROUND_RED;
    ccGreen:
      vCor := FOREGROUND_GREEN;
    ccBlue:
      vCor := FOREGROUND_BLUE;
    ccYellow:
      vCor := FOREGROUND_RED or FOREGROUND_GREEN;
    ccCyan:
      vCor := FOREGROUND_GREEN or FOREGROUND_BLUE;
    ccMagenta:
      vCor := FOREGROUND_RED or FOREGROUND_BLUE;
    ccWhite:
      vCor := FOREGROUND_RED or FOREGROUND_GREEN or FOREGROUND_BLUE;
  else
    vCor := 0;
  end;

  if Negrito then
    vCor := vCor or FOREGROUND_INTENSITY;

  vConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(vConsole, vCor);

  Writeln(Texto);
  vConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(vConsole, FOREGROUND_RED or FOREGROUND_GREEN or FOREGROUND_BLUE);
end;

procedure Log(const Msg: string; IsError: Boolean);
begin
  if IsError then
    Writeln('[ERRO] ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + Msg)
  else
    Writeln('[INFO] ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + Msg);
end;

end.

