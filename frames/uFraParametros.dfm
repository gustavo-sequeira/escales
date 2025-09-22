inherited FraParametros: TFraParametros
  inherited gbPrincipal: TcxGroupBox
    Caption = 'PAR'#194'METROS'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsSelection.CellSelect = False
            object grdFramePrincialDBTableView1nome: TcxGridDBColumn [0]
              Caption = 'Par'#226'metro'
              DataBinding.FieldName = 'nome'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              MinWidth = 360
              Options.Editing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 360
            end
            object grdFramePrincialDBTableView1valor: TcxGridDBColumn [1]
              Caption = 'Valor'
              DataBinding.FieldName = 'valor'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 360
              Options.Editing = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 360
            end
            inherited grdFramePrincialDBTableView1ColExclusao: TcxGridDBColumn
              Visible = False
            end
          end
        end
      end
      inherited tsManutencao: TcxTabSheet
        inherited gbFramePrincipal: TcxGroupBox
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 33
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'VALOR'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 61
                Height = 25
                Width = 140
              end
              object cxLabel1: TcxLabel
                AlignWithMargins = True
                Left = 5
                Top = 5
                Margins.Bottom = 0
                Align = alTop
                AutoSize = False
                Caption = 'PAR'#194'MENTRO'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitLeft = 10
                ExplicitTop = 13
                Height = 25
                Width = 140
              end
            end
            inherited cxGroupBox2: TcxGroupBox
              object edtValor: TcxTextEdit
                AlignWithMargins = True
                Left = 5
                Top = 27
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
                ExplicitLeft = 6
                ExplicitTop = 55
                Width = 242
              end
              object lbNomeParametro: TcxLabel
                AlignWithMargins = True
                Left = 2
                Top = 5
                Margins.Left = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Par'#226'metro'
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
                ExplicitTop = 143
                ExplicitWidth = 7
                AnchorX = 126
                AnchorY = 15
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
    object FDMemTable1nome: TWideMemoField
      FieldName = 'nome'
      BlobType = ftWideMemo
    end
    object FDMemTable1valor: TWideMemoField
      FieldName = 'valor'
      BlobType = ftWideMemo
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
