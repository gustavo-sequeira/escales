inherited FraCargos: TFraCargos
  inherited gbPrincipal: TcxGroupBox
    Caption = 'CARGOS'
    inherited pcFramePrincipal: TcxPageControl
      Properties.ActivePage = tsManutencao
      inherited tsConsulta: TcxTabSheet
        ExplicitTop = 26
        ExplicitWidth = 634
        ExplicitHeight = 430
        inherited grdFramePrincial: TcxGrid
          inherited grdFramePrincialDBTableView1: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object grdFramePrincialDBTableView1codigo: TcxGridDBColumn
              DataBinding.FieldName = 'codigo'
              Visible = False
              MinWidth = 74
              Options.Editing = False
              Options.Filtering = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grdFramePrincialDBTableView1abreviacao: TcxGridDBColumn
              Caption = 'Abrevia'#231#227'o'
              DataBinding.FieldName = 'abreviacao'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              MinWidth = 74
              Options.Editing = False
              Options.Focusing = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object grdFramePrincialDBTableView1nome: TcxGridDBColumn
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
            object grdFramePrincialDBTableView1descricao: TcxGridDBColumn
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
        inherited Button1: TButton
          Left = 363
          Top = 367
          ExplicitLeft = 363
          ExplicitTop = 367
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
    Active = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'abreviacao'
        DataType = ftWideMemo
      end
      item
        Name = 'nome'
        DataType = ftWideMemo
      end
      item
        Name = 'descricao'
        DataType = ftWideMemo
      end>
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    StoreDefs = True
    Content = {
      414442531000000065070000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003100050016000000460044004D0065006D
      005400610062006C0065003100060000000000070000080032000000090000FF
      0AFF0B04000C00000063006F006400690067006F0005000C00000063006F0064
      00690067006F000C00010000000E000D000F0001100001110001120001130001
      14000115000116000C00000063006F006400690067006F00FEFF0B0400140000
      006100620072006500760069006100630061006F000500140000006100620072
      006500760069006100630061006F000C00020000000E0017000F000110000118
      0001110001120001130001140001160014000000610062007200650076006900
      6100630061006F00FEFF0B0400080000006E006F006D0065000500080000006E
      006F006D0065000C00030000000E0017000F0001100001180001110001120001
      1300011400011600080000006E006F006D006500FEFF0B040012000000640065
      007300630072006900630061006F000500120000006400650073006300720069
      00630061006F000C00040000000E0017000F0001100001180001110001120001
      130001140001160012000000640065007300630072006900630061006F00FEFE
      FF19FEFF1AFEFF1BFF1C1D0000000000FF1E0000020000000100040000005000
      520002000C00000050006100730074006F0072000300560000004C00ED006400
      6500720020006500730070006900720069007400750061006C00200065002000
      610064006D0069006E00690073007400720061007400690076006F0020006400
      6100200069006700720065006A006100FEFEFF1C1D0001000000FF1E00000300
      0000010004000000450056000200160000004500760061006E00670065006C00
      690073007400610003007800000052006500730070006F006E007300E1007600
      65006C002000700065006C006100200070007200650067006100E700E3006F00
      2000650020006500760061006E00670065006C0069007A006100E700E3006F00
      200065006D0020006400690076006500720073006F00730020006C006F006300
      610069007300FEFEFF1C1D0002000000FF1E0000040000000100040000005000
      420002001400000050007200650073006200ED007400650072006F0003008400
      000041007500780069006C006900610020006F00200070006100730074006F00
      720020006E00610020006D0069006E0069007300740072006100E700E3006F00
      2000640061002000700061006C0061007600720061002000650020006E006F00
      20006300750069006400610064006F00200064006F0020007200650062006100
      6E0068006F00FEFEFF1C1D0003000000FF1E0000050000000100040000004400
      490002000E00000044006900E10063006F006E006F0003007400000041007500
      780069006C006900610020006E006F007300200073006500720076006900E700
      6F007300200064006100200069006700720065006A0061002000650020006E00
      6F0020006300750069006400610064006F00200063006F006D0020006F007300
      20006D0065006D00620072006F007300FEFEFF1C1D0004000000FF1E00000600
      00000100040000004D0049000200160000004D0069007300730069006F006E00
      E100720069006F000300820000004400650064006900630061002D0073006500
      200061006F002000740072006100620061006C0068006F0020006D0069007300
      730069006F006E00E100720069006F00200065006D002000630061006D007000
      6F0020006C006F00630061006C0020006F00750020007400720061006E007300
      630075006C0074007500720061006C00FEFEFF1C1D0005000000FF1E00000700
      000001000400000043004F0002001400000043006F006F007000650072006100
      64006F00720003006E00000041007500780069006C006900610020006E006100
      730020006100740069007600690064006100640065007300200070007200E100
      7400690063006100730020006500200065007300700069007200690074007500
      610069007300200064006100200069006700720065006A006100FEFEFF1C1D00
      06000000FF1E0000080000000100040000004500580002001200000045007800
      6F0072007400610064006F00720003006800000052006500730070006F006E00
      7300E100760065006C00200070006F0072002000650078006F00720074006100
      720020006500200069006E00630065006E007400690076006100720020006100
      20006600E900200064006F0073002000690072006D00E3006F007300FEFEFF1C
      1D0007000000FF1E0000090000000100040000004F00420002000E0000004F00
      620072006500690072006F0003007E000000540072006100620061006C006800
      610064006F007200200061007400690076006F0020006E00610020006F006200
      72006100200064006F002000530065006E0068006F0072002C00200061007500
      780069006C00690061006E0064006F00200065006D0020007600E10072006900
      610073002000E1007200650061007300FEFEFEFEFEFF1FFEFF2021001A000000
      FF22FEFEFE0E004D0061006E0061006700650072001E00550070006400610074
      00650073005200650067006900730074007200790012005400610062006C0065
      004C006900730074000A005400610062006C00650008004E0061006D00650014
      0053006F0075007200630065004E0061006D0065000A00540061006200490044
      00240045006E0066006F0072006300650043006F006E00730074007200610069
      006E00740073001E004D0069006E0069006D0075006D00430061007000610063
      00690074007900180043006800650063006B004E006F0074004E0075006C006C
      00140043006F006C0075006D006E004C006900730074000C0043006F006C0075
      006D006E00100053006F007500720063006500490044000E006400740049006E
      0074003300320010004400610074006100540079007000650014005300650061
      00720063006800610062006C006500120041006C006C006F0077004E0075006C
      006C000800420061007300650014004F0041006C006C006F0077004E0075006C
      006C0012004F0049006E0055007000640061007400650010004F0049006E0057
      0068006500720065000C004F0049006E004B00650079001A004F007200690067
      0069006E0043006F006C004E0061006D00650014006400740057006900640065
      004D0065006D006F00100042006C006F00620044006100740061001C0043006F
      006E00730074007200610069006E0074004C0069007300740010005600690065
      0077004C006900730074000E0052006F0077004C00690073007400060052006F
      0077000A0052006F0077004900440010004F0072006900670069006E0061006C
      001800520065006C006100740069006F006E004C006900730074001C00550070
      00640061007400650073004A006F00750072006E0061006C0012005300610076
      00650050006F0069006E0074000E004300680061006E00670065007300}
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
