unit uFrmSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, acPNG;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure FadeIn;
    procedure FadeOut;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  AlphaBlend := True;
  AlphaBlendValue := 0; // começa invisível
  BorderStyle := bsNone;
  FormStyle := fsStayOnTop;
  TransparentColor := True;
  TransparentColorValue := clFuchsia; // mesma cor do fundo da imagem

  Color := clFuchsia; // fundo invisível
  FadeIn;
  FadeOut;

end;

procedure TfrmSplash.FormHide(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSplash.FadeIn;
begin
  Self.AlphaBlendValue := 0;
  Show;
  while Self.AlphaBlendValue < 255 do
  begin
    Self.AlphaBlendValue := Self.AlphaBlendValue + 5;
   // Repaint;
    Sleep(50);
    Application.ProcessMessages;
  end;
end;

procedure TfrmSplash.FadeOut;
begin
  while Self.AlphaBlendValue > 0 do
  begin
    Self.AlphaBlendValue := Self.AlphaBlendValue - 5;
   // Repaint;
    Sleep(50);
    Application.ProcessMessages;
  end;
  Hide;
end;

end.

