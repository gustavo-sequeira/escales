inherited FraLocalidades: TFraLocalidades
  inherited gbPrincipal: TcxGroupBox
    Caption = 'Localidades'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 26
        ExplicitWidth = 634
        ExplicitHeight = 430
      end
      inherited tsManutencao: TcxTabSheet
        inherited gbFramePrincipal: TcxGroupBox
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel4: TcxLabel
                Left = 2
                Top = 2
                Align = alTop
                Caption = 'C'#243'digo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 4
                ExplicitTop = 10
              end
              object cxLabel1: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Nome'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 50
                ExplicitWidth = 8
              end
              object cxLabel3: TcxLabel
                Left = 2
                Top = 50
                Align = alTop
                Caption = 'Descri'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 74
                ExplicitWidth = 8
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              object edtCodigo: TcxTextEdit
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
                Width = 248
              end
              object edtNome: TcxTextEdit
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
                Width = 248
              end
              object mmDescricao: TcxMemo
                Left = 2
                Top = 52
                Align = alTop
                ParentFont = False
                Properties.ScrollBars = ssVertical
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                ExplicitTop = 77
                Height = 89
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
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
