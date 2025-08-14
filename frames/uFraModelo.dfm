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
    object pcFramePrincipal: TcxPageControl
      Left = 3
      Top = 17
      Width = 634
      Height = 456
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsConsulta
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 8
      LookAndFeel.NativeStyle = False
      OnResize = pcFramePrincipalResize
      ClientRectBottom = 456
      ClientRectRight = 634
      ClientRectTop = 26
      object tsConsulta: TcxTabSheet
        Caption = 'Consulta'
        ImageIndex = 0
        OnResize = tsConsultaResize
        object grdFramePrincial: TcxGrid
          AlignWithMargins = True
          Left = 72
          Top = 64
          Width = 497
          Height = 297
          TabOrder = 0
          object grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.Prior.Visible = True
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Insert.Visible = True
            Navigator.Buttons.Append.Visible = False
            Navigator.Buttons.Delete.Visible = False
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.Refresh.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.InfoPanel.Visible = True
            Navigator.Visible = True
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = DataSource1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object grdFramePrincialLevel1: TcxGridLevel
            GridView = grdFramePrincialDBTableView1
          end
        end
        object Button1: TButton
          Left = 72
          Top = 400
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object tsManutencao: TcxTabSheet
        Caption = 'Manuten'#231#227'o'
        ImageIndex = 1
        OnShow = tsManutencaoShow
        object gbFramePrincipal: TcxGroupBox
          Left = 32
          Top = 3
          PanelStyle.Active = True
          Style.BorderStyle = ebsFlat
          TabOrder = 0
          Height = 374
          Width = 577
          object gbFrameSecundario: TcxGroupBox
            Left = 83
            Top = 40
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            PanelStyle.Active = True
            ParentBackground = False
            ParentBiDiMode = False
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Style.BorderColor = clWhite
            Style.BorderStyle = ebsNone
            Style.Color = clWhite
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = True
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Height = 241
            Width = 406
            object cxGroupBox1: TcxGroupBox
              Left = 2
              Top = 2
              ParentCustomHint = False
              Align = alLeft
              BiDiMode = bdLeftToRight
              Ctl3D = True
              PanelStyle.Active = True
              ParentBackground = False
              ParentBiDiMode = False
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style.BorderColor = clWhite
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.NativeStyle = True
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              TabOrder = 0
              Transparent = True
              Height = 237
              Width = 150
            end
            object cxGroupBox2: TcxGroupBox
              Left = 152
              Top = 2
              ParentCustomHint = False
              Align = alClient
              BiDiMode = bdLeftToRight
              Ctl3D = True
              PanelStyle.Active = True
              ParentBackground = False
              ParentBiDiMode = False
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style.BorderColor = clWhite
              Style.BorderStyle = ebsNone
              Style.Color = clWhite
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -12
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = []
              Style.LookAndFeel.NativeStyle = True
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.NativeStyle = True
              TabOrder = 1
              Transparent = True
              Height = 237
              Width = 252
            end
          end
          object btnFrameConfirmar: TcxButton
            Left = 168
            Top = 329
            Width = 100
            Height = 25
            Caption = '&Confirmar'
            OptionsImage.ImageIndex = 0
            OptionsImage.Images = cxImageList
            TabOrder = 1
            OnClick = btnFrameConfirmarClick
          end
          object btnFrameCancelar: TcxButton
            Left = 296
            Top = 329
            Width = 100
            Height = 25
            Caption = 'C&ancelar'
            OptionsImage.ImageIndex = 1
            OptionsImage.Images = cxImageList
            TabOrder = 2
            OnClick = btnFrameCancelarClick
          end
        end
      end
    end
  end
  object cxImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 28049934
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000BB49444154789C
          B5934D0AC2301046DF05AC3BCF605D49379ECCBFDE45A522BD867B57EAC25B08
          BD8055065208D3491A4107868449DE97CC64027FB219B0050ECE659EA78063A0
          065AE0AD5C6227208BC17703D47E0B89D40970E7472BE7F60B01D93BF505CA01
          E00CCC556CE30BECD5E245C11337FA7B76318105B08CC03D81522D3E81C2BD8C
          05F752C88D2236C02300BF7411714D92FA0A158665AE4986E02B30B2043A1169
          12AB27E4DA727210F64DF25B7B9F6965E5FC13FB0063DE8299BD8214BB000000
          0049454E44AE426082}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000A749444154789C
          B5936B0A83301084BF13D87F9EA1F6807D78972AD8EA350ADEA0F53C5A594820
          2E1BAB681706F29A496677037F8A1370034A0719674B8807A00106E0AB206B35
          90CC913B83A8F18989340BC81E0FCBF3A00EB4C1BC756BA19D494E7275831052
          E0E5902A41C13514288C677AA217D2FBF75D05F2AD16B29549EC81A3AE44BDA2
          8C95D507896B925FE4F75C37CAC633D2CAF26CB9394AD639B9049FE96C79DE25
          46CE857DB7CE85F8A80000000049454E44AE426082}
      end>
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 467
    Top = 427
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 400
    Top = 424
  end
end
