object dmPrincipal: TdmPrincipal
  OldCreateOrder = True
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
    Left = 30
    Top = 95
  end
  object qryPrincipal: TFDQuery
    Connection = FDConnection
    Left = 138
    Top = 103
  end
  object dsPrincipal: TDataSource
    DataSet = qryPrincipal
    Left = 16
    Top = 15
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    Left = 132
    Top = 15
  end
end
