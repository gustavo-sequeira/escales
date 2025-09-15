unit uFrmInclusaoObreiroEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinOffice2010Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxGroupBox, cxCheckBox, cxDropDownEdit;

type
  TfrmInclusaoObreiroEscala = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnFrameConfirmar: TcxButton;
    cxButton1: TcxButton;
    cbNome: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDia, FTurno: string;
    FCodigoObreiro: integer;
    procedure CarregarListaObreiros(pDisponibilidade: Boolean);
  end;

var
  frmInclusaoObreiroEscala: TfrmInclusaoObreiroEscala;

implementation

uses uDmPrincipal, Data.DB, uLibary;

{$R *.dfm}

{ TfrmInclusaoObreiroEscala }

procedure TfrmInclusaoObreiroEscala.CarregarListaObreiros(pDisponibilidade: Boolean);
var
  Campo: string;
begin
  cbNome.Properties.Items.Clear;
  Campo := StringReplace(Copy(LowerCase(FTurno),1,1)+Copy(FDia,1,3),'á','a',[]);

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;

  if pDisponibilidade then
  begin
	  dmPrincipal.FDQuery1.SQL.Add('     select c.abreviacao||''. ''||o.nome  as nome ');
	  dmPrincipal.FDQuery1.SQL.Add(' 	     from public.obreiros o ');
	  dmPrincipal.FDQuery1.SQL.Add(' inner join public.disponibilidades d ');
	  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo = d.codigo_obreiro) ');
	  dmPrincipal.FDQuery1.SQL.Add(' inner join public.cargos c ');
	  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo_cargo = c.codigo) ');
	  dmPrincipal.FDQuery1.SQL.Add('      where "'+Campo+'" = 1 ');
	  dmPrincipal.FDQuery1.SQL.Add('   order by o.nome ');
  end;

  dmPrincipal.FDQuery1.Open;

  if dmPrincipal.FDQuery1.IsEmpty then
    Exit;

  dmPrincipal.FDQuery1.First;
  while not dmPrincipal.FDQuery1.Eof do
  begin
    cbNome.Properties.Items.Add(dmPrincipal.FDQuery1.FieldByName('nome').AsString);
    dmPrincipal.FDQuery1.Next;
  end;
end;

procedure TfrmInclusaoObreiroEscala.FormShow(Sender: TObject);
begin
    CarregarListaObreiros(cxCheckBox1.Checked);
end;

end.

