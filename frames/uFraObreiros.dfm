inherited FraObreiros: TFraObreiros
  inherited gbPrincipal: TcxGroupBox
    Caption = 'OBREIROS'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsManutencao: TcxTabSheet
        inherited gbFramePrincipal: TcxGroupBox
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel1: TcxLabel
                Left = 2
                Top = 74
                Align = alTop
                Caption = 'Data de Nasci.'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
              object cxLabel2: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Cargo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
              object cxLabel3: TcxLabel
                Left = 2
                Top = 50
                Align = alTop
                Caption = 'Nome'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
              object cxLabel4: TcxLabel
                Left = 2
                Top = 2
                Align = alTop
                Caption = 'C'#243'digo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              object cxTextEdit4: TcxTextEdit
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
                ExplicitTop = 48
                Width = 248
              end
              object cxComboBox1: TcxComboBox
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
                Text = 'cxComboBox1'
                Width = 248
              end
              object cxDateEdit1: TcxDateEdit
                Left = 2
                Top = 77
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                Width = 248
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
end
