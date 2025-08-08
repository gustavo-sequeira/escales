object FraModelo: TFraModelo
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object gbPrincipal: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Caption = 'MODELO'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 480
    Width = 640
    object cxPageControl1: TcxPageControl
      Left = 3
      Top = 17
      Width = 634
      Height = 456
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet2
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 100
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 192
      ExplicitTop = 128
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 450
      ClientRectLeft = 2
      ClientRectRight = 628
      ClientRectTop = 29
      object cxTabSheet1: TcxTabSheet
        Caption = 'Consulta'
        ImageIndex = 0
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 620
          Height = 415
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 144
          ExplicitTop = 96
          ExplicitWidth = 250
          ExplicitHeight = 200
          object cxGrid1DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Manuten'#231#227'o'
        ImageIndex = 1
        ExplicitLeft = 3
        ExplicitTop = 32
        object cxGroupBox1: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 360
          Align = alBottom
          PanelStyle.Active = True
          TabOrder = 0
          Height = 58
          Width = 620
          object cxButton2: TcxButton
            Left = 403
            Top = 17
            Width = 150
            Height = 25
            Caption = '&Salvar'
            TabOrder = 0
            OnClick = cxButton2Click
          end
          object cxButton1: TcxButton
            Left = 247
            Top = 17
            Width = 150
            Height = 25
            Caption = '&Novo'
            TabOrder = 1
            OnClick = cxButton1Click
          end
          object cxButton3: TcxButton
            Left = 559
            Top = 17
            Width = 150
            Height = 25
            Caption = '&Cancelar'
            TabOrder = 2
            OnClick = cxButton3Click
          end
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 21
    Top = 422
  end
  object DataSource1: TDataSource
    Left = 85
    Top = 422
  end
end
