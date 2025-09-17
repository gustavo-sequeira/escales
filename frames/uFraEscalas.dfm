inherited FraEscalas: TFraEscalas
  Height = 594
  ExplicitHeight = 594
  inherited gbPrincipal: TcxGroupBox
    Caption = 'ESCALAS'
    ExplicitHeight = 594
    Height = 594
    inherited pcFramePrincipal: TcxPageControl
      Height = 570
      ExplicitHeight = 570
      ClientRectBottom = 570
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 26
        ExplicitWidth = 634
        ExplicitHeight = 544
        inherited PaintBox1: TPaintBox
          Height = 544
          ExplicitHeight = 544
        end
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
            end
            object grdFramePrincialDBTableView1situacao: TcxGridDBColumn [1]
              DataBinding.FieldName = 'situacao'
            end
            object grdFramePrincialDBTableView1data: TcxGridDBColumn [2]
              DataBinding.FieldName = 'data'
            end
            object grdFramePrincialDBTableView1dia: TcxGridDBColumn [3]
              DataBinding.FieldName = 'dia'
            end
            object grdFramePrincialDBTableView1turno: TcxGridDBColumn [4]
              DataBinding.FieldName = 'turno'
            end
            object grdFramePrincialDBTableView1horario: TcxGridDBColumn [5]
              DataBinding.FieldName = 'horario'
            end
            object grdFramePrincialDBTableView1repete: TcxGridDBColumn [6]
              DataBinding.FieldName = 'repete'
            end
            object grdFramePrincialDBTableView1codigo_localidade: TcxGridDBColumn [7]
              DataBinding.FieldName = 'codigo_localidade'
            end
            object grdFramePrincialDBTableView1nome_localidade: TcxGridDBColumn [8]
              DataBinding.FieldName = 'nome_localidade'
              DataBinding.IsNullValueType = True
            end
            object grdFramePrincialDBTableView1data_dia: TcxGridDBColumn [9]
              DataBinding.FieldName = 'data_dia'
              DataBinding.IsNullValueType = True
            end
            inherited grdFramePrincialDBTableView1ColEdicao: TcxGridDBColumn
              DataBinding.IsNullValueType = True
            end
            inherited grdFramePrincialDBTableView1ColExclusao: TcxGridDBColumn
              DataBinding.IsNullValueType = True
            end
          end
        end
      end
      inherited tsManutencao: TcxTabSheet
        ExplicitHeight = 544
        inherited PaintBox2: TPaintBox
          Height = 544
          ExplicitHeight = 544
        end
        inherited gbFramePrincipal: TcxGroupBox
          ExplicitHeight = 462
          Height = 462
          inherited gbFrameSecundario: TcxGroupBox
            ExplicitHeight = 355
            Height = 355
            inherited cxGroupBox1: TcxGroupBox
              ExplicitHeight = 173
              Height = 173
              object cxLabel4: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 5
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'C'#243'digo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
              object cxLabel2: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 61
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Localidade'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
              object lbData: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 89
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Data'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 142
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Turno'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
              object cxLabel5: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 117
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Hor'#225'rio'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
              object cxLabel6: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 33
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Situa'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                Height = 25
                Width = 146
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              ExplicitHeight = 173
              Height = 173
              object edtCodigo: TcxTextEdit
                AlignWithMargins = True
                Left = 2
                Top = 5
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 248
              end
              object cbSituacao: TcxComboBox
                AlignWithMargins = True
                Left = 2
                Top = 33
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.DropDownListStyle = lsFixedList
                Properties.DropDownRows = 2
                Properties.Items.Strings = (
                  'Confirmado'
                  'Cancelado')
                Properties.PopupAlignment = taCenter
                Properties.UseLeftAlignmentOnEditing = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 248
              end
              object cbLocalidade: TcxComboBox
                AlignWithMargins = True
                Left = 2
                Top = 61
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.DropDownListStyle = lsFixedList
                Properties.PopupAlignment = taCenter
                Properties.UseLeftAlignmentOnEditing = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                OnEditing = cbLocalidadeEditing
                Width = 248
              end
              object cxGroupBox5: TcxGroupBox
                AlignWithMargins = True
                Left = 2
                Top = 89
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = False
                TabOrder = 3
                Transparent = True
                Height = 23
                Width = 248
                object dtData: TcxDateEdit
                  Left = 0
                  Top = 0
                  Margins.Bottom = 0
                  Align = alClient
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.DisplayFormat = 'dd/MM/yyyy'
                  Properties.UseLeftAlignmentOnEditing = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 0
                  OnEditing = dtDataEditing
                  Width = 167
                end
                object chbRepetir: TcxCheckBox
                  AlignWithMargins = True
                  Left = 170
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'Repetir?'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -12
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.TransparentBorder = False
                  Style.IsFontAssigned = True
                  TabOrder = 2
                  Transparent = True
                  OnClick = chbRepetirClick
                  Height = 17
                  Width = 75
                end
                object cbDiasSemana: TcxComboBox
                  Left = 76
                  Top = 1
                  Margins.Left = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    'Domingo'
                    'Segunda-feira'
                    'Ter'#231'a-feira'
                    'Quarta-feira'
                    'Quinta-feira'
                    'Sexta-feira'
                    'S'#225'bado')
                  Properties.PopupAlignment = taCenter
                  Properties.UseLeftAlignmentOnEditing = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 1
                  Visible = False
                  OnEditing = cbDiasSemanaEditing
                  Width = 91
                end
              end
              object hrHorario: TcxTimeEdit
                AlignWithMargins = True
                Left = 2
                Top = 115
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.SpinButtons.Visible = False
                Properties.TimeFormat = tfHourMin
                Properties.UseCtrlIncrement = True
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = hrHorarioPropertiesChange
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.LookAndFeel.NativeStyle = False
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                StyleReadOnly.LookAndFeel.NativeStyle = False
                TabOrder = 4
                OnEditing = hrHorarioEditing
                Height = 25
                Width = 248
              end
              object lbTurno: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 143
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Manh'#227
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -12
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = [fsBold]
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Transparent = True
                AnchorX = 126
                AnchorY = 153
              end
            end
            object cxGroupBox3: TcxGroupBox
              Left = 2
              Top = 175
              Align = alBottom
              PanelStyle.Active = True
              TabOrder = 2
              Height = 178
              Width = 402
              object cxGroupBox4: TcxGroupBox
                AlignWithMargins = True
                Left = 6
                Top = 6
                Align = alTop
                PanelStyle.Active = True
                TabOrder = 0
                Height = 37
                Width = 390
                object cxButton1: TcxButton
                  AlignWithMargins = True
                  Left = 274
                  Top = 6
                  Width = 110
                  Height = 25
                  Align = alRight
                  Caption = '&Autom'#225'tico'
                  OptionsImage.ImageIndex = 5
                  OptionsImage.Images = cxImageList
                  TabOrder = 2
                  OnClick = cxButton1Click
                end
                object cxButton2: TcxButton
                  AlignWithMargins = True
                  Left = 158
                  Top = 6
                  Width = 110
                  Height = 25
                  Align = alRight
                  Caption = '&Manual'
                  OptionsImage.ImageIndex = 4
                  OptionsImage.Images = cxImageList
                  TabOrder = 1
                  OnClick = cxButton2Click
                end
                object cxLabel1: TcxLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 6
                  Margins.Left = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alClient
                  AutoSize = False
                  Caption = 'Gerar rela'#231#227'o escala x obreiro'
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  Transparent = True
                  Height = 28
                  Width = 152
                  AnchorX = 79
                  AnchorY = 20
                end
              end
              object cxGrid1: TcxGrid
                AlignWithMargins = True
                Left = 6
                Top = 49
                Width = 390
                Height = 123
                Align = alClient
                TabOrder = 1
                object cxGrid1DBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  ScrollbarAnnotations.CustomAnnotations = <>
                  OnCellClick = cxGrid1DBTableView1CellClick
                  OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
                  DataController.DataSource = dsGridEscalados
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsSelection.CellSelect = False
                  OptionsView.GroupByBox = False
                  OptionsView.Header = False
                  object cxGrid1DBTableView1nome: TcxGridDBColumn
                    Caption = 'Nome'
                    DataBinding.FieldName = 'nome'
                    PropertiesClassName = 'TcxTextEditProperties'
                    MinWidth = 400
                    Options.Editing = False
                    Options.HorzSizing = False
                    Width = 400
                  end
                  object cxGrid1DBTableView1Exclusao: TcxGridDBColumn
                    DataBinding.IsNullValueType = True
                    Width = 34
                  end
                end
                object cxGrid1Level1: TcxGridLevel
                  GridView = cxGrid1DBTableView1
                end
              end
            end
          end
          inherited btnFrameConfirmar: TcxButton
            Top = 401
            ExplicitTop = 401
          end
          inherited btnFrameCancelar: TcxButton
            Top = 401
            ExplicitTop = 401
          end
        end
      end
    end
  end
  inherited cxImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 36045216
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
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000DE49444154789C
          ADD3B14A03411485E10F2B11051B2B8BD8A4B6F41D7C3D216852686223D80521
          451A8580B5A0A6B313D2465002168681AB6E969D75091E186667E79E7F99D973
          F927EDA38F71C371119E1FA5175F15E3066FF8A8D83BFFB5332A6D0E31C336AE
          B0858752CDA80E70805E18D3D1926ED1C16713400B6725C065CCD3750183989F
          738005EE0B80D3009C44CD37E8290718C4733700ED6241619D05BCE330BEBA23
          AFC7BA3B78C15E8D7903F3BF2E7182CD0CE0B8690EC6D82D998FF09A03544539
          45F83AFEC65D214095514E8D91204D9B2999579A696D2D012A30743C36A8317B
          0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000C349444154789C
          AD93BB0AC24010454F65D0CEDADFB0104DE34799F809162A82A585060B6B6DB6
          C85F89A6B0892C5C35421EE363E092E5EEDC9364D9813F550F4880D4A89D32CF
          F246FEA1B6AF38B88AA619B0AED8735580137000AE401F18031781520B6023AF
          53D86FE979B400CE0A04C01488B5EE02B726C01C18C88B0BCD91BC11B0A803AC
          80B004309117AAA7F61732A0ADCF8E140EE4659633484A0EF1B14E2C0007ECF5
          B6A194C97316405ED0526ABC483F5F653F181E621D261F7E1BA6AFEB0E791E87
          FD0FB228FF0000000049454E44AE426082}
      end>
  end
  inherited FDMemTable1: TFDMemTable
    StoreDefs = True
    Left = 536
    Top = 550
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1data: TDateField
      FieldName = 'data'
    end
    object FDMemTable1repete: TIntegerField
      FieldName = 'repete'
    end
    object FDMemTable1codigo_localidade: TIntegerField
      FieldName = 'codigo_localidade'
    end
    object FDMemTable1situacao: TWideMemoField
      FieldName = 'situacao'
      BlobType = ftWideMemo
    end
    object FDMemTable1dia: TWideMemoField
      FieldName = 'dia'
      BlobType = ftWideMemo
    end
    object FDMemTable1turno: TWideMemoField
      FieldName = 'turno'
      BlobType = ftWideMemo
    end
    object FDMemTable1horario: TTimeField
      FieldName = 'horario'
    end
  end
  inherited DataSource1: TDataSource
    Left = 476
    Top = 550
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 446
    Top = 550
    PixelsPerInch = 96
  end
  object dsGridEscalados: TDataSource
    DataSet = memGridEscalados
    Left = 506
    Top = 550
  end
  object memGridEscalados: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 566
    Top = 550
    object memGridEscaladosnome: TWideMemoField
      FieldName = 'nome'
      BlobType = ftWideMemo
    end
  end
end
