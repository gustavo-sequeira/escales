inherited FraObreiros: TFraObreiros
  Width = 898
  ExplicitWidth = 898
  inherited gbPrincipal: TcxGroupBox
    Caption = 'OBREIROS'
    Width = 898
    inherited pcFramePrincipal: TcxPageControl
      Width = 892
      Properties.ActivePage = tsManutencao
      ClientRectRight = 892
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
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
          ExplicitWidth = 689
          Width = 689
          inherited gbFrameSecundario: TcxGroupBox
            ExplicitWidth = 478
            Width = 478
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel1: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 89
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Data de Nasci.'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 77
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
              object cxLabel2: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 33
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Cargo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 27
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 61
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Nome'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 52
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
              object cxLabel4: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 5
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'C'#243'digo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 2
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
              object cxLabel5: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 148
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'Disponibilidade'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 127
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
              object cxLabel9: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 117
                Align = alTop
                AutoSize = False
                Caption = 'Telefone'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 2
                ExplicitTop = 102
                ExplicitWidth = 146
                Height = 25
                Width = 140
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              ExplicitLeft = 156
              ExplicitWidth = 324
              Width = 324
              object edtCodigo: TcxTextEdit
                AlignWithMargins = True
                Left = 5
                Top = 5
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
                ExplicitLeft = 2
                ExplicitTop = 2
                ExplicitWidth = 248
                Width = 314
              end
              object edtNome: TcxTextEdit
                AlignWithMargins = True
                Left = 5
                Top = 61
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                ExplicitLeft = 2
                ExplicitTop = 48
                ExplicitWidth = 248
                Width = 314
              end
              object cbCargo: TcxComboBox
                AlignWithMargins = True
                Left = 5
                Top = 33
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                ExplicitLeft = 2
                ExplicitTop = 27
                ExplicitWidth = 248
                Width = 314
              end
              object dtDataNascimento: TcxDateEdit
                AlignWithMargins = True
                Left = 5
                Top = 89
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                ExplicitLeft = 4
                ExplicitTop = 80
                ExplicitWidth = 242
                Width = 314
              end
              object cbTelefone: TcxComboBox
                AlignWithMargins = True
                Left = 5
                Top = 117
                Align = alTop
                TabOrder = 4
                ExplicitLeft = 6
                ExplicitTop = 101
                ExplicitWidth = 242
                Width = 314
              end
              object cxGroupBox3: TcxGroupBox
                Left = 2
                Top = 206
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = True
                TabOrder = 8
                Transparent = True
                ExplicitTop = 140
                Height = 21
                Width = 320
                object Bevel1: TBevel
                  Left = 72
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 0
                end
                object Bevel2: TBevel
                  Left = 282
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 290
                  ExplicitTop = 6
                end
                object Bevel4: TBevel
                  Left = 107
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 288
                  ExplicitHeight = 63
                end
                object Bevel5: TBevel
                  Left = 247
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 276
                  ExplicitTop = 6
                end
                object Bevel6: TBevel
                  Left = 177
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 183
                end
                object Bevel7: TBevel
                  Left = 142
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 148
                end
                object Bevel8: TBevel
                  Left = 212
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 243
                end
                object cxLabel6: TcxLabel
                  Left = 3
                  Top = 3
                  Align = alClient
                  Caption = 'NOITE'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  ExplicitWidth = 74
                  ExplicitHeight = 63
                  AnchorX = 38
                end
                object cxCheckBox1: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  ExplicitLeft = 92
                  Height = 15
                  Width = 33
                end
                object cxCheckBox2: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
                object cxCheckBox3: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
                object cxCheckBox4: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
                object cxCheckBox5: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
                object cxCheckBox6: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
                object cxCheckBox7: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 7
                  Transparent = True
                  ExplicitLeft = 287
                  ExplicitTop = 6
                  Height = 15
                  Width = 33
                end
              end
              object cxGroupBox4: TcxGroupBox
                Left = 2
                Top = 143
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = True
                TabOrder = 5
                Transparent = True
                ExplicitTop = 140
                Height = 21
                Width = 320
                object Bevel3: TBevel
                  Left = 142
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 179
                  ExplicitHeight = 63
                end
                object Bevel9: TBevel
                  Left = 247
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 298
                  ExplicitHeight = 63
                end
                object Bevel10: TBevel
                  Left = 282
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 288
                  ExplicitHeight = 63
                end
                object Bevel11: TBevel
                  Left = 212
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 226
                  ExplicitHeight = 63
                end
                object Bevel12: TBevel
                  Left = 177
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 198
                  ExplicitHeight = 63
                end
                object Bevel13: TBevel
                  Left = 107
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 164
                  ExplicitHeight = 63
                end
                object Bevel14: TBevel
                  Left = 72
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 42
                  ExplicitHeight = 63
                end
                object cxLabel14: TcxLabel
                  Left = 3
                  Top = 3
                  Align = alClient
                  Caption = 'TURNO / DIA'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  AnchorX = 38
                end
                object cxLabel15: TcxLabel
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'SEG'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 126
                end
                object cxLabel16: TcxLabel
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'TER'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 161
                end
                object cxLabel17: TcxLabel
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'DOM'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 91
                end
                object cxLabel18: TcxLabel
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'SEX'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 266
                end
                object cxLabel19: TcxLabel
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'QUI'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 231
                end
                object cxLabel20: TcxLabel
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'QUA'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 196
                end
                object cxLabel21: TcxLabel
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Caption = 'S'#193'B'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  Height = 15
                  Width = 33
                  AnchorX = 301
                end
              end
              object cxGroupBox5: TcxGroupBox
                Left = 2
                Top = 185
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = True
                TabOrder = 7
                Transparent = True
                ExplicitTop = 140
                Height = 21
                Width = 320
                object Bevel15: TBevel
                  Left = 72
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 0
                end
                object Bevel16: TBevel
                  Left = 282
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 290
                  ExplicitTop = 6
                end
                object Bevel17: TBevel
                  Left = 107
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 288
                  ExplicitHeight = 63
                end
                object Bevel18: TBevel
                  Left = 247
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 276
                  ExplicitTop = 6
                end
                object Bevel19: TBevel
                  Left = 177
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 183
                end
                object Bevel20: TBevel
                  Left = 142
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 148
                end
                object Bevel21: TBevel
                  Left = 212
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 243
                end
                object cxLabel7: TcxLabel
                  Left = 3
                  Top = 3
                  Align = alClient
                  Caption = 'TARDE'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  AnchorX = 38
                end
                object cxCheckBox8: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox9: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox10: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox11: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox12: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox13: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox14: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 7
                  Transparent = True
                  Height = 15
                  Width = 33
                end
              end
              object cxGroupBox6: TcxGroupBox
                Left = 2
                Top = 164
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = True
                TabOrder = 6
                Transparent = True
                ExplicitTop = 140
                Height = 21
                Width = 320
                object Bevel22: TBevel
                  Left = 72
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 0
                end
                object Bevel23: TBevel
                  Left = 282
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 290
                  ExplicitTop = 6
                end
                object Bevel24: TBevel
                  Left = 107
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 288
                  ExplicitHeight = 63
                end
                object Bevel25: TBevel
                  Left = 247
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 276
                  ExplicitTop = 6
                end
                object Bevel26: TBevel
                  Left = 177
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 183
                end
                object Bevel27: TBevel
                  Left = 142
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 148
                end
                object Bevel28: TBevel
                  Left = 212
                  Top = 3
                  Width = 2
                  Height = 15
                  Align = alRight
                  Shape = bsRightLine
                  ExplicitLeft = 243
                end
                object cxLabel8: TcxLabel
                  Left = 3
                  Top = 3
                  Align = alClient
                  Caption = 'MANH'#195
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -9
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  AnchorX = 38
                end
                object cxCheckBox15: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox16: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox17: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox18: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox19: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox20: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object cxCheckBox21: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = False
                  TabOrder = 7
                  Transparent = True
                  Height = 15
                  Width = 33
                end
              end
            end
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
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'codigo_cargo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftWideMemo
      end
      item
        Name = 'dt_nascimento'
        DataType = ftDate
      end>
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    StoreDefs = True
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1codigo_cargo: TIntegerField
      FieldName = 'codigo_cargo'
    end
    object FDMemTable1nome: TWideMemoField
      FieldName = 'nome'
      BlobType = ftWideMemo
    end
    object FDMemTable1dt_nascimento: TDateField
      FieldName = 'dt_nascimento'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 176
    Top = 432
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=escales'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 256
    Top = 424
  end
  object p: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from obreiros')
    Left = 320
    Top = 424
  end
end
