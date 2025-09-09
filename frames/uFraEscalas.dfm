inherited FraEscalas: TFraEscalas
  Height = 594
  ExplicitHeight = 594
  inherited gbPrincipal: TcxGroupBox
    Height = 594
    inherited pcFramePrincipal: TcxPageControl
      Height = 570
      Properties.ActivePage = tsManutencao
      ClientRectBottom = 570
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
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
        inherited gbFramePrincipal: TcxGroupBox
          ExplicitHeight = 462
          Height = 462
          inherited gbFrameSecundario: TcxGroupBox
            ExplicitHeight = 355
            Height = 355
            inherited cxGroupBox1: TcxGroupBox
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
                ExplicitLeft = 5
                ExplicitWidth = 140
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
                ExplicitLeft = 5
                ExplicitTop = 67
                ExplicitWidth = 140
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
                ExplicitLeft = 5
                ExplicitTop = 98
                ExplicitWidth = 140
                Height = 25
                Width = 146
              end
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 145
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Turno'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 5
                ExplicitTop = 160
                ExplicitWidth = 140
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
                ExplicitLeft = 5
                ExplicitTop = 129
                ExplicitWidth = 140
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
                ExplicitLeft = 5
                ExplicitTop = 36
                ExplicitWidth = 140
                Height = 25
                Width = 146
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              ExplicitLeft = 296
              ExplicitTop = -34
              ExplicitHeight = 182
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
                ExplicitTop = 3
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
                ExplicitLeft = 5
                ExplicitTop = 49
                ExplicitWidth = 242
                Width = 248
              end
              object cxGroupBox7: TcxGroupBox
                AlignWithMargins = True
                Left = 2
                Top = 143
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = False
                TabOrder = 5
                Transparent = True
                ExplicitLeft = 5
                ExplicitTop = 117
                ExplicitWidth = 242
                Height = 23
                Width = 248
                object lbTurno: TcxLabel
                  AlignWithMargins = True
                  Left = 0
                  Top = 3
                  Margins.Left = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alTop
                  AutoSize = False
                  Caption = 'MANH'#195
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
                  ExplicitTop = 0
                  Height = 25
                  Width = 248
                  AnchorX = 124
                  AnchorY = 16
                end
              end
              object cxComboBox1: TcxComboBox
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
                ExplicitLeft = 5
                ExplicitTop = 58
                ExplicitWidth = 242
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
                ExplicitTop = 109
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
                  ExplicitWidth = 73
                  ExplicitHeight = 25
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
                  OnClick = chbRepetirClick
                  ExplicitLeft = 168
                  ExplicitTop = 0
                  ExplicitHeight = 23
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
                ExplicitLeft = 3
                Height = 25
                Width = 248
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
                  Left = 235
                  Top = 6
                  Width = 150
                  Height = 25
                  Caption = '&Confirmar'
                  OptionsImage.ImageIndex = 0
                  OptionsImage.Images = cxImageList
                  TabOrder = 1
                  OnClick = btnFrameConfirmarClick
                end
                object cxButton2: TcxButton
                  Left = 75
                  Top = 6
                  Width = 150
                  Height = 25
                  Caption = '&Confirmar'
                  OptionsImage.ImageIndex = 0
                  OptionsImage.Images = cxImageList
                  TabOrder = 0
                  OnClick = btnFrameConfirmarClick
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
                ExplicitLeft = 2
                ExplicitTop = 142
                ExplicitWidth = 402
                ExplicitHeight = 103
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
  end
  inherited FDMemTable1: TFDMemTable
    Active = True
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
