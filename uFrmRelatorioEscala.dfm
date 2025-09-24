object FrmRelatorioEscala: TFrmRelatorioEscala
  Left = 0
  Top = 0
  Caption = 'FrmRelatorioEscala'
  ClientHeight = 209
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxReport1: TfrxReport
    Version = '6.7.9'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45924.434737372700000000
    ReportOptions.LastChange = 45924.653938032410000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 95.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Subreport1: TfrxSubreport
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 710.551640000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page3
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 2
      ColumnWidth = 95.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '95')
      Frame.Typ = []
      MirrorMode = []
      object frxDBDataset1codigo: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Top = 7.779530000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'codigo'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."codigo"]')
      end
      object frxDBDataset1nome: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 79.929190000000000000
        Top = 7.779530000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataField = 'nome'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."nome"]')
      end
      object frxDBDataset1descricao: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 238.110390000000000000
        Top = 7.559060000000000000
        Width = 117.165430000000000000
        Height = 18.897650000000000000
        DataField = 'descricao'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."descricao"]')
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codigo=codigo'
      'nome=nome'
      'descricao=descricao')
    DataSet = FDMemTable1
    BCDToCurrency = False
    Left = 200
    Top = 88
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 40
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
    end
    object FDMemTable1descricao: TStringField
      FieldName = 'descricao'
    end
  end
end
