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
            OnCellClick = grdFramePrincialDBTableView1CellClick
            OnCustomDrawCell = grdFramePrincialDBTableView1CustomDrawCell
            DataController.DataSource = DataSource1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            Styles.ContentEven = zebradoEven
            Styles.ContentOdd = zebradoOdd
            object grdFramePrincialDBTableView1ColEdicao: TcxGridDBColumn
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.ExpressionEditing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 25
            end
            object grdFramePrincialDBTableView1ColExclusao: TcxGridDBColumn
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.ExpressionEditing = False
              Options.Moving = False
              Options.Sorting = False
              Width = 25
            end
          end
          object grdFramePrincialLevel1: TcxGridLevel
            GridView = grdFramePrincialDBTableView1
          end
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
    DesignInfo = 28574202
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
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000A649444154789C
          BD90B10A0231104473889D6015373349955AAB341662A37F27A8957E8E95FF72
          5F71CAEAA9872024873A3055F6CDEEC4987F2A843023B94E290D4BD90AC086E4
          450DE05C1252C518C7004E8F80D6AB2C98E45E61119974421A119966C17C9DFD
          0CD13A45303B215A47DF8B61DEBDFB296C74A837EC9C5BF68655008E1FE02C0D
          48D66F3FBECDDAACF2DECF5BB00670D03AB99B6FB2D68E002CF49222F01BBA02
          B2005444E14CB2130000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000E849444154789C
          B592BD6A024114852DD20512D86266CE376C91913C8C69CD13D8E70DB4D4DEF4
          A6D142F2005A9A37882F91903275822803BBE0DFECAE810C5CB803E71CBEB973
          5BADFF3A799EB78167606C8C0917994308B7923E813E3090F49165D94DD2608C
          0992E6925E63016F92BECB7BD1AFF6EEF3032A6BED35D003B60DAB173DC72057
          C0A6817913B5679F027C9542EFFDFDB93E6A92B390B42E8545E0492FE93D1900
          2CEB02804515C14B03824915C1A801C1B08AE0A96E8851930CF0DE3FD67DA373
          AE9B0C88DB05FCA6CC927EACB577C98082E20198EDAD6DB9DE53E75CA7D2FC97
          B303FB418A3E280E6ACF0000000049454E44AE426082}
      end>
  end
  object FDMemTable1: TFDMemTable
    BeforeInsert = FDMemTable1BeforeInsert
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 566
    Top = 436
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 536
    Top = 436
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 598
    Top = 436
    PixelsPerInch = 96
    object zebradoEven: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientActiveCaption
    end
    object zebradoOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 15653832
    end
  end
end
