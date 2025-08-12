inherited FraCargos: TFraCargos
  inherited gbPrincipal: TcxGroupBox
    Caption = 'CARGOS'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          end
        end
      end
      inherited tsManutencao: TcxTabSheet
        inherited gbFramePrincipal: TcxGroupBox
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel2: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Abrevia'#231#227'o'
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
              object cxLabel3: TcxLabel
                Left = 2
                Top = 74
                Align = alTop
                Caption = 'Descri'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
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
              object edtAbreviacao: TcxTextEdit
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
                ExplicitTop = 23
                Width = 248
              end
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
                Width = 248
              end
              object mmDescricao: TcxMemo
                Left = 2
                Top = 77
                Align = alTop
                ParentFont = False
                Properties.ScrollBars = ssVertical
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                ExplicitTop = 65
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
end
