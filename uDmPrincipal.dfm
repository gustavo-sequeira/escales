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
    Left = 46
    Top = 15
  end
  object qryPrincipal: TFDQuery
    Connection = FDConnection
    Left = 106
    Top = 15
  end
  object dsPrincipal: TDataSource
    DataSet = qryPrincipal
    Left = 16
    Top = 15
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    Left = 76
    Top = 15
  end
end
