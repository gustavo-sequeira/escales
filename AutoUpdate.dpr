program AutoUpdate;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uAppUtils in 'lib\uAppUtils.pas',
  uConsts in 'lib\uConsts.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  IsConsole := True;
  EscreverConsole(' ====================================', ccCyan);
  EscreverConsole(' Sistema de atualização do Escales...', ccCyan);
  EscreverConsole(' ====================================', ccCyan);
  Writeln('');


  try
    AtualizarSeNecessario;
  except
    on E: Exception do
      Abort
  end;

  Readln;
end.
