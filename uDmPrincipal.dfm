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
    Left = 128
    Top = 80
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 168
    Top = 136
  end
  object cxLocalizer1: TcxLocalizer
    Left = 204
    Top = 79
  end
end
