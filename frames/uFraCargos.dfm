inherited FraCargos: TFraCargos
  inherited gbPrincipal: TcxGroupBox
    inherited pcFramePrincipal: TcxPageControl
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 26
        ExplicitWidth = 634
        ExplicitHeight = 430
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            Navigator.InfoPanel.Visible = True
          end
        end
      end
      inherited tsManutencao: TcxTabSheet
        inherited gbFramePrincipal: TcxGroupBox
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              ExplicitLeft = 3
              object cxLabel2: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Abrevia'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 1
                ExplicitTop = 22
              end
              object cxLabel4: TcxLabel
                Left = 2
                Top = 2
                Align = alTop
                Caption = 'C'#243'digo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
              object cxLabel3: TcxLabel
                Left = 2
                Top = 74
                Align = alTop
                Caption = 'Descri'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 50
              end
              object cxLabel1: TcxLabel
                Left = 2
                Top = 50
                Align = alTop
                Caption = 'Nome'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              object cxTextEdit1: TcxTextEdit
                Left = 2
                Top = 27
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 1
                Text = 'cxTextEdit1'
                ExplicitTop = 2
                Width = 248
              end
              object cxTextEdit2: TcxTextEdit
                Left = 2
                Top = 2
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                Text = 'cxTextEdit1'
                Width = 248
              end
              object cxTextEdit3: TcxTextEdit
                Left = 2
                Top = 52
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                Text = 'cxTextEdit1'
                Width = 248
              end
              object cxMemo1: TcxMemo
                Left = 2
                Top = 77
                Align = alTop
                Lines.Strings = (
                  'cxMemo1')
                ParentFont = False
                Properties.ScrollBars = ssVertical
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                ExplicitLeft = 80
                ExplicitTop = 144
                ExplicitWidth = 185
                Height = 89
                Width = 248
              end
            end
          end
        end
      end
    end
  end
  inherited cxImageList1: TcxImageList
    FormatVersion = 1
  end
end
