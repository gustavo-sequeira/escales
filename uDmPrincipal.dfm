object dmPrincipal: TdmPrincipal
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 279
  Width = 364
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Database=escales'
      'Password=postgres'
      'Server=127.0.0.1'
      'DriverID=PG')
    LoginPrompt = False
    Left = 88
    Top = 64
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\projetos\repositorios\escales\Win32\Debug\libpq.dll'
    Left = 120
    Top = 128
  end
  object cxLocalizer1: TcxLocalizer
    Left = 204
    Top = 79
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    Left = 64
    Top = 136
  end
  object FDConnectionNeon: TFDConnection
    Params.Strings = (
      'Database=Escalas'
      'User_Name=neondb_owner'
      'Password=npg_Dcq7WSC8mBvY'
      'Server=ep-fragrant-mountain-acrj8k8z.sa-east-1.aws.neon.tech'
      'DriverID=PG')
    LoginPrompt = False
    Left = 216
    Top = 144
  end
end
