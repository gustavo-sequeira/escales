inherited FraVersiculos: TFraVersiculos
  inherited gbPrincipal: TcxGroupBox
    Caption = 'VERS'#205'CULOS'
    inherited pcFramePrincipal: TcxPageControl
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 26
        ExplicitWidth = 634
        ExplicitHeight = 430
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            OptionsSelection.CellSelect = False
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
              Visible = False
            end
            object grdFramePrincialDBTableView1desc_status: TcxGridDBColumn [1]
              Caption = 'Status'
              DataBinding.FieldName = 'desc_status'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Moving = False
              Width = 100
            end
            object grdFramePrincialDBTableView1status: TcxGridDBColumn [2]
              Caption = 'Status'
              DataBinding.FieldName = 'status'
              Visible = False
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Width = 60
            end
            object grdFramePrincialDBTableView1versiculo: TcxGridDBColumn [3]
              Caption = 'Vers'#237'culo'
              DataBinding.FieldName = 'versiculo'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Moving = False
              Width = 600
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
              object cxLabel3: TcxLabel
                Left = 2
                Top = 50
                Align = alTop
                Caption = 'Vers'#237'culo'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 47
              end
              object cxLabel2: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Status'
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
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                Width = 248
              end
              object chbStatus: TcxCheckBox
                Left = 2
                Top = 23
                Align = alTop
                ParentFont = False
                Properties.Alignment = taCenter
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                TabOrder = 1
                Transparent = True
                ExplicitTop = 27
                Width = 248
              end
              object mmDescricao: TcxMemo
                Left = 2
                Top = 44
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
                ExplicitTop = 46
                Height = 171
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
  inherited FDMemTable1: TFDMemTable
    OnCalcFields = FDMemTable1CalcFields
    object FDMemTable1codigo: TIntegerField
      FieldName = 'codigo'
    end
    object FDMemTable1status: TIntegerField
      FieldName = 'status'
    end
    object FDMemTable1versiculo: TWideMemoField
      FieldName = 'versiculo'
      BlobType = ftWideMemo
    end
    object FDMemTable1desc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_status'
      Calculated = True
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
