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
  uFraObreiros in 'frames\uFraObreiros.pas' {FraObreiros: TFrame},
  uFraCargos in 'frames\uFraCargos.pas' {FraCargos: TFrame},
  uEXEscales in 'class\uEXEscales.pas',
  uFrmTelefone in 'uFrmTelefone.pas' {frmTelefone},
  uFraLocalidades in 'frames\uFraLocalidades.pas' {FraLocalidades: TFrame},
  uFraVersiculos in 'frames\uFraVersiculos.pas' {FraVersiculos: TFrame},
  uFraLembretes in 'frames\uFraLembretes.pas' {FraLembretes: TFrame},
  uFraEscalas in 'frames\uFraEscalas.pas' {FraEscalas: TFrame},
  uFrmInclusaoObreiroEscala in 'uFrmInclusaoObreiroEscala.pas' {frmInclusaoObreiroEscala},
  uFraParametros in 'frames\uFraParametros.pas' {FraParametros: TFrame},
  uFrmSplash in 'uFrmSplash.pas' {frmSplash},
  uFrmRelatorioEscala in 'uFrmRelatorioEscala.pas' {FrmRelatorioEscala};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
