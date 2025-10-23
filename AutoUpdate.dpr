program AutoUpdate;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uAppUtils in 'lib\uAppUtils.pas',
  uConsts in 'lib\uConsts.pas';
begin
  if not ArquivoAlteradoRecentemente(PChar(ExtractFilePath(ParamStr(0)) + 'versao.txt')) then
  begin
    ReportMemoryLeaksOnShutdown := True;
    IsConsole := True;
    EscreverConsole(' ===========================================', ccCyan, true);
    EscreverConsole(' Sistema de atualização do Escales (v.1.0.0)', ccCyan, true);
    EscreverConsole(' ===========================================', ccCyan, true);
    Writeln('');

    try
      AtualizarSeNecessario;
    except
      on E: Exception do
      begin
        EscreverConsole(' ERRO - ' + e.Message, ccRed, true);
        Readln;
      end;
    end;
  end;
end.

