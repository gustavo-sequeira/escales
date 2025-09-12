unit uFrmInclusaoObreiroEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2010Blue,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxGroupBox,
  cxCheckBox, cxDropDownEdit;

type
  TfrmInclusaoObreiroEscala = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnFrameConfirmar: TcxButton;
    cxButton1: TcxButton;
    cbNome: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInclusaoObreiroEscala: TfrmInclusaoObreiroEscala;

implementation

{$R *.dfm}

end.
