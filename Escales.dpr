program Escales;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uContato in 'class\uContato.pas',
  uTelefone in 'class\uTelefone.pas',
  uLibary in 'lib\uLibary.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
