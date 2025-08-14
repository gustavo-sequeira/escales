unit uFraCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFraModelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, Vcl.Menus, System.ImageList, Vcl.ImgList, cxImageList, cxButtons,
  Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, cxGroupBox, cxLabel, cxMemo,
  cxTextEdit, uCargo, dxSkinWXI, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.StorageBin;

type
  TFraCargos = class(TFraModelo)
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    edtAbreviacao: TcxTextEdit;
    edtCodigo: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtNome: TcxTextEdit;
    mmDescricao: TcxMemo;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    grdFramePrincialDBTableView1codigo: TcxGridDBColumn;
    grdFramePrincialDBTableView1abreviacao: TcxGridDBColumn;
    grdFramePrincialDBTableView1nome: TcxGridDBColumn;
    grdFramePrincialDBTableView1descricao: TcxGridDBColumn;
    procedure btnFrameConfirmarClick(Sender: TObject);
    procedure btnFrameCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FraCargos: TFraCargos;

implementation

uses System.UITypes;

{$R *.dfm}

{ TFraCargos }

procedure TFraCargos.btnFrameCancelarClick(Sender: TObject);
begin
  emTransacao := True;
  //inherited;

end;

procedure TFraCargos.btnFrameConfirmarClick(Sender: TObject);
var
  Cargo: TCargos;
begin
  inherited;
  Cargo := TCargos.Create;
  try
    if trim(edtCodigo.Text) = EmptyStr then
      Cargo.Codigo := 0
    else
      Cargo.Codigo := StrToInt(edtCodigo.Text);
    Cargo.Abreviacao := Trim(edtAbreviacao.Text);
    Cargo.Nome := Trim(edtNome.Text);
    Cargo.Descricao := Trim(mmDescricao.Text);
    try
      Cargo.Save;
    except
      on e: Exception do
      begin
        if Cargo.Codigo = 0 then
          MessageDlg('Erro ao tentar incluir. '+e.Message, mtError, [mbOK], 0)
        else
          MessageDlg('Erro ao tentar atualizar. '+e.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    Cargo.Free;
  end;
end;

end.

