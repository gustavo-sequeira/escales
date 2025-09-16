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
    procedure cxCheckBox1Click(Sender: TObject);
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses
  uDmPrincipal, Data.DB, uLibary, FireDAC.Comp.Client;

{$R *.dfm}

{ TfrmInclusaoObreiroEscala }

procedure TfrmInclusaoObreiroEscala.btnFrameConfirmarClick(Sender: TObject);
begin
  if cbNome.Text = EmptyStr then
  begin
    Self.ModalResult := mrIgnore;
  end;
end;

procedure TfrmInclusaoObreiroEscala.CarregarListaObreiros(pDisponibilidade: Boolean);
var
  Campo: string;
begin
  cbNome.Properties.Items.Clear;
  Campo := StringReplace(Copy(LowerCase(FTurno), 1, 1) + Copy(FDia, 1, 3), 'á', 'a', []);

  dmPrincipal.FDQuery1.Close;
  dmPrincipal.FDQuery1.SQL.Clear;
  dmPrincipal.FDQuery1.SQL.Add('     select c.abreviacao||''. ''||o.nome  as nome, "' + Campo + '" campo ');
  dmPrincipal.FDQuery1.SQL.Add(' 	     from public.obreiros o ');
  dmPrincipal.FDQuery1.SQL.Add(' inner join public.disponibilidades d ');
  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo = d.codigo_obreiro) ');
  dmPrincipal.FDQuery1.SQL.Add(' inner join public.cargos c ');
  dmPrincipal.FDQuery1.SQL.Add('         on (o.codigo_cargo = c.codigo) ');
  dmPrincipal.FDQuery1.SQL.Add('  left join public.ranking_escalas r ');
  dmPrincipal.FDQuery1.SQL.Add('	        on r.codigo_obreiro = o.codigo ');

  if pDisponibilidade then
    dmPrincipal.FDQuery1.SQL.Add('      where "' + Campo + '" = 1 ');
  dmPrincipal.FDQuery1.SQL.Add('   order by r.ranking, o.nome ');

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

procedure TfrmInclusaoObreiroEscala.cxCheckBox1Click(Sender: TObject);
begin
  CarregarListaObreiros(cxCheckBox1.Checked);
end;

procedure TfrmInclusaoObreiroEscala.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self.ModalResult = mrIgnore then
    Action := caNone;
end;

procedure TfrmInclusaoObreiroEscala.FormShow(Sender: TObject);
begin
  CarregarListaObreiros(cxCheckBox1.Checked);
end;

end.

