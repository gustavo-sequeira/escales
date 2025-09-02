inherited FraCargos: TFraCargos
  inherited gbPrincipal: TcxGroupBox
    Caption = 'CARGOS'
    inherited pcFramePrincipal: TcxPageControl
      inherited tsConsulta: TcxTabSheet
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
              DataBinding.IsNullValueType = True
              Visible = False
              MinWidth = 64
              Options.Editing = False
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grdFramePrincialDBTableView1abreviacao: TcxGridDBColumn [1]
              Caption = 'Abrevia'#231#227'o'
              DataBinding.FieldName = 'abreviacao'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 64
              Options.Editing = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grdFramePrincialDBTableView1nome: TcxGridDBColumn [2]
              Caption = 'Nome'
              DataBinding.FieldName = 'nome'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 150
              Options.Editing = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 150
            end
            object grdFramePrincialDBTableView1descricao: TcxGridDBColumn [3]
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'descricao'
              DataBinding.IsNullValueType = True
              HeaderAlignmentHorz = taCenter
              MinWidth = 500
              Options.Editing = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 500
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
          inherited gbFrameSecundario: TcxGroupBox
            inherited cxGroupBox1: TcxGroupBox
              object cxLabel2: TcxLabel
                Left = 2
                Top = 26
                Align = alTop
                Caption = 'Abrevia'#231#227'o'
                Properties.Alignment.Horz = taLeftJustify
                Transparent = True
                ExplicitTop = 23
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
                ExplicitTop = 71
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
                Top = 23
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
                Top = 44
                Align = alTop
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 2
                ExplicitTop = 52
                Width = 248
              end
              object mmDescricao: TcxMemo
                Left = 2
                Top = 65
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
  inherited FDMemTable1: TFDMemTable
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    StoreDefs = True
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end
