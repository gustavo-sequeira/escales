inherited FraCargos: TFraCargos
  inherited gbPrincipal: TcxGroupBox
    Caption = 'CARGOS'
    inherited pcFramePrincipal: TcxPageControl
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn [0]
              DataBinding.FieldName = 'codigo'
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
              HeaderAlignmentHorz = taCenter
              MinWidth = 500
              Options.Editing = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 500
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
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cargos')
    Left = 320
    Top = 424
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=escales'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=pG')
    LoginPrompt = False
    Left = 256
    Top = 424
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 304
    Top = 224
  end
end
