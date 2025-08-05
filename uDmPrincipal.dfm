object dmPrincipal: TdmPrincipal
  Height = 279
  Width = 364
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=postgres'
      'Database=escales'
      'Server=127.0.0.1'
      'DriverID=PG')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object qryPrincipal: TFDQuery
    Connection = FDConnection
    Left = 72
    Top = 96
  end
  object dsPrincipal: TDataSource
    DataSet = qryPrincipal
    Left = 168
    Top = 120
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    Left = 232
    Top = 64
  end
end
