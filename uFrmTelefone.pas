unit uFrmTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2010Blue,
  cxGroupBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox, cxTextEdit,
  cxMaskEdit;

type
  TfrmTelefone = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxMaskEdit1: TcxMaskEdit;
    cxCheckBox1: TcxCheckBox;
    btnFrameConfirmar: TcxButton;
    cxButton1: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelefone: TfrmTelefone;

implementation

{$R *.dfm}

end.
