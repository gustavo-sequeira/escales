program Escales;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uLibary in 'lib\uLibary.pas',
  uCargo in 'class\uCargo.pas',
  uObreiro in 'class\uObreiro.pas',
  uLembrete in 'class\uLembrete.pas',
  uVersiculo in 'class\uVersiculo.pas',
  uLocalidade in 'class\uLocalidade.pas',
  uEscala in 'class\uEscala.pas',
  uEscalado in 'class\uEscalado.pas',
  uModeloBase in 'class\uModeloBase.pas',
  uTelefone in 'class\uTelefone.pas',
  uFraModelo in 'frames\uFraModelo.pas' {FraModelo: TFrame},
  uFraObreiros in 'frames\uFraObreiros.pas' {FraObreiros: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
