unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox,
  AdvSmoothStepControl, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvGridWorkbook, cxTextEdit, cxMemo, tmsAdvGridExcel, System.ImageList,
  Vcl.ImgList, cxImageList, dxCore, cxClasses, dxSkinsForm, dxSkinWhiteprint,
  dxSkinLondonLiquidSky, dxSkinMcSkin, cxSplitter;

type
  TfrmPrincipal = class(TForm)
    AdvSmoothStepControl1: TAdvSmoothStepControl;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxMemo1: TcxMemo;
    AdvGridWorkbook1: TAdvGridWorkbook;
    AdvGridExcelIO1: TAdvGridExcelIO;
    OpenDialog1: TOpenDialog;
    cxImageList1: TcxImageList;
    dxSkinController1: TdxSkinController;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxSplitter1: TcxSplitter;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure AdvSmoothStepControl1StepChanged(Sender: TObject; StepIndex: Integer);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AdvSmoothStepControl1StepChanged(Sender: TObject; StepIndex: Integer);
begin
  case StepIndex of
    0:
      begin
        cxGroupBox3.Visible := True;
        cxGroupBox4.Visible := False;
        cxGroupBox5.Visible := False;
      end;
    1:
      begin
        cxGroupBox3.Visible := False;
        cxGroupBox4.Visible := True;
        cxGroupBox5.Visible := False;
      end;
    2:
      begin
        cxGroupBox3.Visible := False;
        cxGroupBox4.Visible := False;
        cxGroupBox5.Visible := True;
      end;
  end;
end;

procedure TfrmPrincipal.cxButton1Click(Sender: TObject);
begin
  if AdvSmoothStepControl1.ActiveStep > 0 then
    AdvSmoothStepControl1.PreviousStep;
end;

procedure TfrmPrincipal.cxButton2Click(Sender: TObject);
begin
  if AdvSmoothStepControl1.ActiveStep <= 3 then
    AdvSmoothStepControl1.NextStep;
end;

procedure TfrmPrincipal.cxButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    AdvGridExcelIO1.XLSImport(OpenDialog1.FileName);
end;

procedure TfrmPrincipal.cxButton5Click(Sender: TObject);
var
  valorInteiro, iSheet, iSheetContato, row, col, rowContato, colContato, totalRows, totalCols, totalRowsContato, totalColsContato: Integer;
  Grid, GridContato: TAdvStringGrid;
  valor, valorData, telefoneContato: string;
  dataAtual: TDateTime;
  achouData: Boolean;
begin
  for iSheet := 0 to AdvGridWorkbook1.Sheets.Count - 1 do
  begin
    AdvGridWorkbook1.ActiveSheet := iSheet;
    Grid := AdvGridWorkbook1.Grid;

    totalRows := Grid.RowCount;
    totalCols := Grid.ColCount;

    cxMemo1.Lines.Add('>> Planilha: ' + AdvGridWorkbook1.Sheets[iSheet].Name);

    for col := 1 to totalCols do
    begin
      for row := 0 to totalRows do
      begin
        valor := Grid.Cells[col, row];
        valorData := Copy(valor, 1, 10);
        achouData := TryStrToDate(valorData, dataAtual);

        if achouData then
        begin
          cxMemo1.Lines.Add(Format('>> Data encontrada: %s [linha %d, coluna %d]', [DateToStr(dataAtual), row, col]));

          // Pegar nomes abaixo dessa célula
          var r := row + 1;
          while (r < 1001) do
          begin
            valor := Grid.Cells[col, r];
            valorData := Copy(valor, 1, 10);
            if Trim(valor) = '' then
              Break;

            if TryStrToDate(valorData, dataAtual) then
              Break;

            if TryStrToInt(valor, valorInteiro) then
              Break;

            telefoneContato := EmptyStr;

            //procura a aba de contatos
            for iSheetContato := 0 to AdvGridWorkbook1.Sheets.Count - 1 do
            begin
              AdvGridWorkbook1.ActiveSheet := iSheetContato;
              if UpperCase(AdvGridWorkbook1.Sheets[iSheetContato].Name) = 'CONTATO' then
              begin
                GridContato := AdvGridWorkbook1.Grid;

                totalRowsContato := GridContato.RowCount;
                totalColsContato := GridContato.ColCount;

                for colContato := 1 to totalColsContato do
                begin
                  for rowContato := 0 to totalRowsContato do
                  begin
                    if UpperCase(Trim(valor)) = UpperCase(Trim(Grid.Cells[colContato, rowContato])) then
                    begin
                      telefoneContato := '(' + Grid.Cells[colContato + 1, rowContato] + ') ' + Grid.Cells[colContato + 2, rowContato];
                      Break
                    end;
                  end;
                end;
              end;
            end;
            AdvGridWorkbook1.ActiveSheet := iSheet;

            cxMemo1.Lines.Add('   Nome encontrado: ' + valor + ' e de telefone: ' + telefoneContato);

            // pegar coluna lateral
            {}


            {}
            Inc(r);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  AdvGridExcelIO1.AdvGridWorkbook := AdvGridWorkbook1;
end;

end.

