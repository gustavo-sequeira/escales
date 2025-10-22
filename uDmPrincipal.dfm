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
    Left = 168
    Top = 16
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
end
