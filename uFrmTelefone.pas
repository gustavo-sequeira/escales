unit uFrmTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinOffice2010Blue, cxGroupBox, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxCheckBox, cxTextEdit, cxMaskEdit;

type
  TfrmTelefone = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxMaskEdit1: TcxMaskEdit;
    cxCheckBox1: TcxCheckBox;
    btnFrameConfirmar: TcxButton;
    cxButton1: TcxButton;
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure cxMaskEdit1PropertiesChange(Sender: TObject);
    procedure cxMaskEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelefone: TfrmTelefone;

implementation

uses
  uLibary;

{$R *.dfm}

procedure TfrmTelefone.btnFrameConfirmarClick(Sender: TObject);
var
  vMensagem: string;
begin
  if not (TLibary.ValidarTelefone(cxMaskEdit1.Text, vMensagem)) then
  begin
    ShowMessage(vMensagem);
    ModalResult := mrAbort;
  end
  else
    ModalResult := mrOk;

end;

procedure TfrmTelefone.cxMaskEdit1Enter(Sender: TObject);
begin
  (Sender as TcxMaskEdit).SelectAll;
end;

procedure TfrmTelefone.cxMaskEdit1PropertiesChange(Sender: TObject);
var
  TextoSemMascara: string;
  i: Integer;
begin
  // Remove caracteres não numéricos
  TextoSemMascara := '';
  for i := 1 to Length(cxMaskEdit1.Text) do
  begin
    if cxMaskEdit1.Text[i] in ['0'..'9'] then
      TextoSemMascara := TextoSemMascara + cxMaskEdit1.Text[i];
  end;

  // Aplica máscara conforme o tamanho do número
  if Length(TextoSemMascara) >= 2 then
  begin
    if (Length(TextoSemMascara) = 11) or
       ((Length(TextoSemMascara) > 11) and (Copy(TextoSemMascara, 3, 1) = '9')) then
    begin
      // Celular: (81) 99847-0484
      cxMaskEdit1.Properties.EditMask := '!\(99\) 99999-9999;1; '
    end
    else
    begin
      // Fixo: (81) 3427-0097
      cxMaskEdit1.Properties.EditMask := '!\(99\) 9999-9999;1; '
    end;
  end
  else
  begin
    // Máscara inicial
    cxMaskEdit1.Properties.EditMask := '!\(99\) 99999-9999;1; ';
  end;
end;


end.

