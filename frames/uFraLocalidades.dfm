inherited FraLocalidades: TFraLocalidades
  inherited gbPrincipal: TcxGroupBox
    Caption = 'LOCALIDADES'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsSelection.CellSelect = False
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codigo'
              Visible = False
              MinWidth = 74
              Options.Editing = False
              Options.Focusing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grdFramePrincialDBTableView1nome: TcxGridDBColumn [1]
              Caption = 'Nome'
              DataBinding.FieldName = 'nome'
              HeaderAlignmentHorz = taCenter
              MinWidth = 250
              Options.Editing = False
              Options.Focusing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 250
            end
            object grdFramePrincialDBTableView1descricao: TcxGridDBColumn [2]
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'descricao'
              HeaderAlignmentHorz = taCenter
              MinWidth = 450
              Options.Editing = False
              Options.Focusing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 450
            end
            inherited grdFramePrincialDBTableView1ColEdicao: TcxGridDBColumn
              MinWidth = 25
              Options.HorzSizing = False
            end
            inherited grdFramePrincialDBTableView1ColExclusao: TcxGridDBColumn
              MinWidth = 25
              Options.HorzSizing = False
            end
          end
        end
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
              end
              object cxLabel1: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Nome'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
              object cxLabel3: TcxLabel
                Left = 2
                Top = 50
                Align = alTop
                Caption = 'Descri'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              object edtCodigo: TcxTextEdit
                Left = 2
                Top = 2
                Align = alTop
                ParentFont = False
                Properties.Alignment.Horz = taCenter
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
    DesignInfo = 28574172
  end
  inherited FDMemTable1: TFDMemTable
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1nome: TWideMemoField
      FieldName = 'nome'
      BlobType = ftWideMemo
    end
    object FDMemTable1descricao: TWideMemoField
      FieldName = 'descricao'
      BlobType = ftWideMemo
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 506
    PixelsPerInch = 96
  end
end
