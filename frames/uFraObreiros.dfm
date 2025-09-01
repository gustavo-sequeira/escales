inherited FraObreiros: TFraObreiros
  Width = 898
  ExplicitWidth = 898
  inherited gbPrincipal: TcxGroupBox
    Caption = 'OBREIROS'
    ExplicitWidth = 897
    Width = 898
    inherited pcFramePrincipal: TcxPageControl
      Width = 892
      Properties.ActivePage = tsManutencao
      ExplicitWidth = 891
      ClientRectRight = 892
      inherited tsConsulta: TcxTabSheet
        ExplicitWidth = 891
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            OptionsSelection.CellSelect = False
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
              Visible = False
            end
            object grdFramePrincialDBTableView1codigo_cargo: TcxGridDBColumn [1]
              DataBinding.FieldName = 'codigo_cargo'
              Visible = False
            end
            object grdFramePrincialDBTableView1nome_cargo: TcxGridDBColumn [2]
              Caption = 'Cargo'
              DataBinding.FieldName = 'nome_cargo'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 200
            end
            object grdFramePrincialDBTableView1nome: TcxGridDBColumn [3]
              Caption = 'Nome'
              DataBinding.FieldName = 'nome'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 330
            end
            object grdFramePrincialDBTableView1dt_nascimento: TcxGridDBColumn [4]
              Caption = 'Data de Nascimento'
              DataBinding.FieldName = 'dt_nascimento'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 150
            end
          end
        end
      end
      inherited tsManutencao: TcxTabSheet
        ExplicitWidth = 891
        inherited gbFramePrincipal: TcxGroupBox
          Top = 0
          Hint = 'Excluir telefone'
          ExplicitTop = 0
          ExplicitWidth = 689
          Width = 689
          inherited gbFrameSecundario: TcxGroupBox
            ExplicitWidth = 478
            ExplicitHeight = 265
            Height = 265
            Width = 478
            inherited cxGroupBox1: TcxGroupBox
              ExplicitHeight = 261
              Height = 261
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
                Height = 25
                Width = 140
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              ExplicitWidth = 324
              ExplicitHeight = 261
              Height = 261
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
                ExplicitTop = 57
                Width = 314
              end
              object cbCargo: TcxComboBox
                AlignWithMargins = True
                Left = 5
                Top = 33
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Width = 314
              end
              object dtDataNascimento: TcxDateEdit
                AlignWithMargins = True
                Left = 5
                Top = 89
                Margins.Bottom = 0
                Align = alTop
                ParentFont = False
                Properties.DisplayFormat = 'dd/MM/yyyy'
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                Width = 314
              end
              object cxGroupBox3: TcxGroupBox
                Left = 2
                Top = 206
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = True
                TabOrder = 7
                Transparent = True
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
                  Cursor = crHandPoint
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
                  OnClick = cxLabel6Click
                  OnMouseEnter = cxLabel6MouseEnter
                  OnMouseLeave = cxLabel6MouseLeave
                  ExplicitLeft = 4
                  AnchorX = 38
                end
                object chbDomNoite: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSegNoite: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbTerNoite: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuaNoite: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuiNoite: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSexNoite: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSabNoite: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 7
                  Transparent = True
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
                TabOrder = 4
                Transparent = True
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
                  Cursor = crHandPoint
                  Align = alClient
                  Caption = 'TURNO / DIA'
                  ParentFont = False
                  Style.Font.Charset = DEFAULT_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -8
                  Style.Font.Name = 'Segoe UI'
                  Style.Font.Style = [fsBold]
                  Style.TextColor = clWindowText
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Transparent = True
                  OnClick = cxLabel14Click
                  OnMouseEnter = cxLabel14MouseEnter
                  OnMouseLeave = cxLabel14MouseLeave
                  AnchorX = 38
                end
                object cxLabel15: TcxLabel
                  Left = 109
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel15Click
                  OnMouseEnter = cxLabel15MouseEnter
                  OnMouseLeave = cxLabel15MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 126
                end
                object cxLabel16: TcxLabel
                  Left = 144
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel16Click
                  OnMouseEnter = cxLabel16MouseEnter
                  OnMouseLeave = cxLabel16MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 161
                end
                object cxLabel17: TcxLabel
                  Left = 74
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel17Click
                  OnMouseEnter = cxLabel17MouseEnter
                  OnMouseLeave = cxLabel17MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 91
                end
                object cxLabel18: TcxLabel
                  Left = 249
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel18Click
                  OnMouseEnter = cxLabel18MouseEnter
                  OnMouseLeave = cxLabel18MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 266
                end
                object cxLabel19: TcxLabel
                  Left = 214
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel19Click
                  OnMouseEnter = cxLabel19MouseEnter
                  OnMouseLeave = cxLabel19MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 231
                end
                object cxLabel20: TcxLabel
                  Left = 179
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel20Click
                  OnMouseEnter = cxLabel20MouseEnter
                  OnMouseLeave = cxLabel20MouseLeave
                  Height = 15
                  Width = 33
                  AnchorX = 196
                end
                object cxLabel21: TcxLabel
                  Left = 284
                  Top = 3
                  Cursor = crHandPoint
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
                  OnClick = cxLabel21Click
                  OnMouseEnter = cxLabel21MouseEnter
                  OnMouseLeave = cxLabel21MouseLeave
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
                TabOrder = 6
                Transparent = True
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
                  Cursor = crHandPoint
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
                  OnClick = cxLabel7Click
                  OnMouseEnter = cxLabel7MouseEnter
                  OnMouseLeave = cxLabel7MouseLeave
                  AnchorX = 38
                end
                object chbDomTarde: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSegTarde: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbTerTarde: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuaTarde: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuiTarde: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSexTarde: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSabTarde: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
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
                TabOrder = 5
                Transparent = True
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
                  Cursor = crHandPoint
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
                  OnClick = cxLabel8Click
                  OnMouseEnter = cxLabel8MouseEnter
                  OnMouseLeave = cxLabel8MouseLeave
                  AnchorX = 38
                end
                object chbDomManha: TcxCheckBox
                  Left = 74
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 1
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSegManha: TcxCheckBox
                  Left = 109
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 2
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbTerManha: TcxCheckBox
                  Left = 144
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 3
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuaManha: TcxCheckBox
                  Left = 179
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 4
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbQuiManha: TcxCheckBox
                  Left = 214
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 5
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSexManha: TcxCheckBox
                  Left = 249
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 6
                  Transparent = True
                  Height = 15
                  Width = 33
                end
                object chbSabManha: TcxCheckBox
                  Left = 284
                  Top = 3
                  Align = alRight
                  AutoSize = False
                  Properties.Alignment = taCenter
                  Style.BorderStyle = ebsNone
                  Style.TextStyle = []
                  Style.TransparentBorder = False
                  TabOrder = 7
                  Transparent = True
                  Height = 15
                  Width = 33
                end
              end
              object cxGroupBox7: TcxGroupBox
                AlignWithMargins = True
                Left = 5
                Top = 117
                Align = alTop
                PanelStyle.Active = True
                Style.BorderStyle = ebsNone
                Style.TransparentBorder = False
                TabOrder = 8
                Transparent = True
                Height = 23
                Width = 314
                object cbTelefone: TcxComboBox
                  Left = 0
                  Top = 0
                  Align = alClient
                  Properties.DropDownListStyle = lsFixedList
                  Style.TransparentBorder = True
                  TabOrder = 0
                  Width = 245
                end
                object cxImage1: TcxImage
                  Left = 245
                  Top = 0
                  Hint = 'Incluir telefone'
                  Align = alRight
                  ParentShowHint = False
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    00100000001008060000001FF3FF61000000097048597300000B1300000B1301
                    009A9C180000007949444154789CDD51BB0A80301073D4D1A9E4AEB4F81715FD
                    FF6FD249C950F1056AD541038170BD0B24CDB23701A005D0241D5B6B0B003D49
                    7DD9C039578AC840527FC0C07B9F7331D218534503EAF91B7717C72252B3AC78
                    7044009DAA86C940550387C906B723FCE41BD7604E96459ECABC0736BD69FB69
                    8CE6A74BE9C461889C0000000049454E44AE426082}
                  ShowHint = True
                  Style.BorderStyle = ebsNone
                  Style.TransparentBorder = True
                  TabOrder = 1
                  Transparent = True
                  OnClick = cxImage1Click
                  Height = 23
                  Width = 23
                end
                object cxImage2: TcxImage
                  Left = 268
                  Top = 0
                  Hint = 'Editar telefone'
                  Align = alRight
                  ParentShowHint = False
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    00100000001008060000001FF3FF61000000017352474200AECE1CE900000004
                    67414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8
                    64000000B149444154384FBD8F310E0221104521C6CEC40AE10F54D45AD15818
                    1BBD9D895AE971ACBCCB9E42CD1836C1092A16EB4BA69AFF3E8C52FF2484B020
                    A26D4A692C77DFD000764474E771CE5D7F29D131C629804B5F90672383353411
                    1D59B6D6CE8A929BB5762EC392A7DCBF5896F039322C7991CB123E87F75228A9
                    CA790E83CA8A4315B14D76CEAD2B629BCC0038BF919B18115157CA00F64D2F33
                    DEFB65163B00273E47663E628C990058F14FE46E701EA7F85441281493D80000
                    000049454E44AE426082}
                  ShowHint = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 2
                  Transparent = True
                  OnClick = cxImage2Click
                  Height = 23
                  Width = 23
                end
                object cxImage3: TcxImage
                  Left = 291
                  Top = 0
                  Hint = 'Excluir telefone'
                  Align = alRight
                  ParentShowHint = False
                  Picture.Data = {
                    0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
                    00100000001008060000001FF3FF61000000017352474200AECE1CE900000004
                    67414D410000B18F0BFC6105000000097048597300000EC300000EC301C76FA8
                    64000000F849444154384FB592314A044110452730131426D8FEF59A091CF130
                    9AEA0936F7061A6AAEB9266B201E4043BD815E4231345616A5C56E7A8A5604F1
                    414115F31FD50CD575FFC5300C9BC02970329BCD46FFFD47C6715C37B327E000
                    3894F4D8F7FD9ACF15D20649976676950AB833B3973C7FF5B7794ED9C9AB4208
                    ABC01C78FF65CD93337945D7752BC0B211F6B54C592F7F023CE7608C71ABD5A7
                    8CF70A921E7230CDAD5ED2BDF70AC04D4BAA7BE0DA7B0549E72DA9EE259D79AF
                    001CB7A4BA078EBC5730B3FD1CFCEE27A68CF70A31C6BD6A53B324ED7AAF90AE
                    0B78F352B5FD3584B0E1BD0931C61DE0A23AE37CDE0B49DB3EFF673E00C71B8A
                    29919C20C40000000049454E44AE426082}
                  ShowHint = True
                  Style.BorderStyle = ebsNone
                  TabOrder = 3
                  Transparent = True
                  OnClick = cxImage3Click
                  ExplicitLeft = 297
                  Height = 23
                  Width = 23
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
    DesignInfo = 28573712
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
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000A449444154789C
          B592CB0DC2400C445F3A8270A00D883810282417A28832F95541014196466863
          7943F88D3497D9F56F6CF8130AA004F6E25CDA246C801BD03B5E80EA55F03108
          F4ECC62AF78E77D1EBEB68E66BF0F1207AFDEC3D5964DA6DC4E8CD8C7DA2766D
          B70A5C8A8DB4749CFADB04DB3441F9C108B33441A13D4726B6817E8A0EAB7A63
          8D2B32E8261C9275340A3B12DB73D476B6B287CD6726EDB4A181613FC5031481
          7379415F70DB0000000049454E44AE426082}
      end>
  end
  inherited FDMemTable1: TFDMemTable
    Active = True
    OnCalcFields = FDMemTable1CalcFields
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
    Left = 136
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1codigo_cargo: TIntegerField
      FieldName = 'codigo_cargo'
    end
    object FDMemTable1nome_cargo: TStringField
      FieldKind = fkCalculated
      FieldName = 'nome_cargo'
      Calculated = True
    end
    object FDMemTable1nome: TWideMemoField
      FieldName = 'nome'
      BlobType = ftWideMemo
    end
    object FDMemTable1dt_nascimento: TDateField
      FieldName = 'dt_nascimento'
    end
  end
  inherited DataSource1: TDataSource
    Left = 76
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 46
    PixelsPerInch = 96
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 196
    Top = 436
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=escales'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=pG')
    LoginPrompt = False
    Left = 106
    Top = 436
  end
  object p: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from obreiros')
    Left = 226
    Top = 436
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 166
    Top = 436
    object FDMemTable2ddd: TIntegerField
      FieldName = 'ddd'
    end
    object FDMemTable2numero: TIntegerField
      FieldName = 'numero'
    end
    object FDMemTable2principal: TIntegerField
      FieldName = 'principal'
    end
    object FDMemTable2telefone: TStringField
      FieldName = 'telefone'
    end
  end
end
