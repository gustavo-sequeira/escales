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

function ArquivoAlteradoRecentemente(const FileName: string): Boolean;

implementation

uses
  Winapi.Windows, System.Net.HttpClient, System.IOUtils, ShellApi,
  System.Classes, uConsts, Winapi.TlHelp32, System.SysUtils, Vcl.Forms,
  System.RegularExpressions, System.Net.URLClient,
  System.Net.HttpClientComponent;

function ArquivoAlteradoRecentemente(const FileName: string): Boolean;
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

procedure DownloadGoogleDriveFile(const FileID, Destino: string);
var
  Http: TNetHTTPClient;
  Resp: IHTTPResponse;
  vStrData, HTML, ConfirmToken, DownloadURL: string;
  Stream: TFileStream;
begin
  Http := TNetHTTPClient.Create(nil);
  try
    // 1 Primeira requisição (gera token de confirmação)
    EscreverConsole(' INFO - Iniciando o download da nova versão...', ccWhite);
    EscreverConsole(' INFO - Gerando token de autorização...', ccWhite);
    Resp := Http.Get('https://drive.google.com/uc?export=download&id=' + FileID);
    HTML := Resp.ContentAsString();


    // 2 Extrair token "confirm"
    var TokenStart := HTML.IndexOf('confirm=') + Length('confirm=');
    if TokenStart > 0 then
    begin
      var TokenEnd := HTML.IndexOf('"', TokenStart);
      ConfirmToken := HTML.Substring(TokenStart, TokenEnd - TokenStart);
      EscreverConsole(' INFO - Token gerado e confirmado com sucesso', ccWhite);
    end
    else
    begin
      EscreverConsole(' ERRO - Token de confirmação não encontrado. Link pode estar inválido', ccRed, true);
      raise Exception.Create('Token de confirmação não encontrado. Link pode estar inválido.');
    end;

    // 3 Segunda requisição — agora baixa o arquivo real
    EscreverConsole(' INFO - Baixando a nova versão... CONTINUE AGUARDANDO!', ccGreen, True);
    DownloadURL := Format('https://drive.usercontent.google.com/download?id=%s&export=download&confirm=%s', [FileID, ConfirmToken]);

    vStrData := FormatDateTime('yyyymmddmmss', Now);
    FecharERenomear(NOME_EXE, 'bkp_' + vStrData + '_' + LowerCase(NOME_EXE));

    Stream := TFileStream.Create(Destino, fmCreate);
    try
      Http.Get(DownloadURL, Stream);
      EscreverConsole(' INFO - Download realizado com sucesso', ccWhite);
    finally
      Stream.Free;
    end;

  finally
    Http.Free;
  end;
end;

procedure FecharERenomear(const NomeExe, NovoNomeExe: string);
begin
  // Renomeia
  if TFile.Exists(NomeExe) then
  begin
    EscreverConsole(' INFO - Renomeado o executável antigo...', ccWhite);
    TFile.Move(NomeExe, NovoNomeExe);
    EscreverConsole(' INFO - Executável renomeado com sucesso', ccWhite);
  end
  else
    EscreverConsole(' ERRO - Executável não encontrado: ' + NomeExe, ccRed, true);
end;

function KillProcessByName(const ExeName: string): Boolean;
var
  Snapshot: THandle;
  ProcessEntry: TProcessEntry32;
  hProcess: THandle;
begin
  Result := False;
  Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  EscreverConsole(' INFO - Verificando se o executável esta sendo executado...', ccWhite);
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
            EscreverConsole(' INFO - Executável finalizado com sucesso', ccWhite);
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
  vStrData, CaminhoNovoExe, CaminhoAtualExe: string;
begin
  CaminhoNovoExe := TPath.Combine(ExtractFilePath(ParamStr(0)), NOME_EXE);

  // Fecha o processo se estiver rodando
  KillProcessByName(CaminhoNovoExe);
  // Aguarda o sistema liberar o arquivo
  EscreverConsole(' INFO - Aguardando o sistema liberar o arquivo...', ccWhite);
  Sleep(1000);

  Http := THTTPClient.Create;
  try
    EscreverConsole(' INFO - Verificando versão local...', ccWhite);
    if FileExists(NOME_VERSAO_LOCAL) then
      VersaoLocal := Trim(TFile.ReadAllText(NOME_VERSAO_LOCAL))
    else
      VersaoLocal := '';

    EscreverConsole(' INFO - Verificando versão online...', ccWhite);
    VersaoOnline := Trim(Http.Get(URL_VERSAO).ContentAsString());

    if VersaoOnline <> VersaoLocal then
    begin
      EscreverConsole(' INFO - Existe uma versão diferente (' + VersaoOnline + ') da que você esta usando (' + VersaoLocal + ') ', ccGreen, True);
      EscreverConsole(' INFO - Iniciando processo de atualização... AGUARDE!', ccWhite);

//      vStrData := FormatDateTime('yyyymmddmmss', Now);
//      FecharERenomear(NOME_EXE, 'bkp_' + vStrData + '_' + LowerCase(NOME_EXE));
//      CaminhoAtualExe := TPath.Combine(ExtractFilePath(ParamStr(0)), 'bkp_' + vStrData + '_' + LowerCase(NOME_EXE));

      DownloadGoogleDriveFile(ID_GOOGLE, CaminhoNovoExe);

      // Substitui o antigo (precisa sair antes)
//      if FileExists(CaminhoAtualExe) then
//        MoveFileEx(PChar(CaminhoAtualExe), nil, MOVEFILE_DELAY_UNTIL_REBOOT);
    end
    else
      EscreverConsole(' INFO - Não existe versão disponível', ccWhite);

      // Atualiza versão local
    TFile.WriteAllText(NOME_VERSAO_LOCAL, VersaoOnline);

//    writeln('');
//    EscreverConsole(' INFO - Processo de atualização concluído com sucesso. Precione ENTER para continuar ...', ccYellow, true);
//    Readln;

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

  Writeln(FormatDateTime('hh:nn', Now) + Texto);
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

