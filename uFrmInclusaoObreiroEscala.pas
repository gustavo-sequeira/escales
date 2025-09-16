unit uFrmInclusaoObreiroEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinOffice2010Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxGroupBox, cxCheckBox, cxDropDownEdit, dxSkinWXI;

type
  TfrmInclusaoObreiroEscala = class(TForm)
    cxGroupBox1: TcxGroupBox;
    btnFrameConfirmar: TcxButton;
    cxButton1: TcxButton;
    cbNome: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cbNomePropertiesDrawItem(AControl: TcxCustomComboBox; ACanvas: TcxCanvas; AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState);
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

procedure TfrmInclusaoObreiroEscala.CarregarListaObreiros(pDisponibilidade: Boolean);
var
  Campo: string;
  Query: TFDQuery;
begin
  cbNome.Properties.Items.Clear;
  Campo := StringReplace(Copy(LowerCase(FTurno), 1, 1) + Copy(FDia, 1, 3), 'á', 'a', []);

  Query := TFDQuery.Create(Self);
  Query.Connection := dmPrincipal.FDConnection;
  try
    Query.SQL.Clear;

    Query.SQL.Add('     select c.abreviacao||''. ''||o.nome  as nome, "' + Campo + '" campo ');
    Query.SQL.Add(' 	     from public.obreiros o ');
    Query.SQL.Add(' inner join public.disponibilidades d ');
    Query.SQL.Add('         on (o.codigo = d.codigo_obreiro) ');
    Query.SQL.Add(' inner join public.cargos c ');
    Query.SQL.Add('         on (o.codigo_cargo = c.codigo) ');
    if pDisponibilidade then
      Query.SQL.Add('      where "' + Campo + '" = 1 ');
    Query.SQL.Add('   order by o.nome ');

    Query.Open;

    if Query.IsEmpty then
      Exit;

    Query.First;
    while not Query.Eof do
    begin
      cbNome.Properties.Items.Add(Query.FieldByName('nome').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmInclusaoObreiroEscala.cbNomePropertiesDrawItem(AControl: TcxCustomComboBox; ACanvas: TcxCanvas; AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState);
var
  vNome, vCampo: string;
  i: Integer;
begin
  vNome := AControl.Properties.Items[AIndex];
 // if odNoFocusRect in AState then
 // begin

    if not cxCheckBox1.Checked then
    begin
      for i := 0 to AControl.Properties.Items.Count - 1 do
      begin

        vNome := Copy(AControl.Properties.Items[i], Pos('.', AControl.Properties.Items[i]) + 1, Length(AControl.Properties.Items[i]));
 //       vNome := Copy(AControl.Properties.Items[AIndex], Pos('.', AControl.Properties.Items[AIndex]) + 1, Length(AControl.Properties.Items[AIndex]));
        vCampo := StringReplace(Copy(LowerCase(FTurno), 1, 1) + Copy(FDia, 1, 3), 'á', 'a', []);

        dmPrincipal.FDQuery1.Close;
        dmPrincipal.FDQuery1.SQL.Clear;

        dmPrincipal.FDQuery1.SQL.Add('	select "' + vCampo + '" as campo ');
        dmPrincipal.FDQuery1.SQL.Add('	  from disponibilidades d ');
        dmPrincipal.FDQuery1.SQL.Add('inner join obreiros o ');
        dmPrincipal.FDQuery1.SQL.Add('        on d.codigo_obreiro = o.codigo ');
        dmPrincipal.FDQuery1.SQL.Add('     where lower(o.nome) = lower(:nome) ');
//        dmPrincipal.FDQuery1.SQL.Add('       and "'+vCampo+'" = lower('''+vCampo+''') ');
        dmPrincipal.FDQuery1.ParamByName('nome').AsString := Trim(vNome);
       // dmPrincipal.FDQuery1.ParamByName('campo').AsString := vCampo;
        dmPrincipal.FDQuery1.Open;

        vNome := AControl.Properties.Items[i];

  // Exemplo de validação: se contém "negativo"
        if dmPrincipal.FDQuery1.FieldByName('campo').AsInteger = 0 then
          ACanvas.Font.Color := clRed
        else
          ACanvas.Font.Color := clWindowText;
      end;
    end
    else
    begin
      ACanvas.Font.Color := clWindowText;
    end;
 //   ACanvas.FillRect(ARect);
  //  ACanvas.DrawText(vNome, ARect, cxAlignLeft or cxAlignVCenter);
 // end
 // else
  //  ACanvas.Font.Color := clWindowText;
  ACanvas.FillRect(ARect);
  ACanvas.DrawText(vNome, ARect, cxAlignLeft or cxAlignVCenter);
end;

procedure TfrmInclusaoObreiroEscala.cxCheckBox1Click(Sender: TObject);
begin
  CarregarListaObreiros(cxCheckBox1.Checked);
end;

procedure TfrmInclusaoObreiroEscala.FormShow(Sender: TObject);
begin
  CarregarListaObreiros(cxCheckBox1.Checked);
end;

end.

