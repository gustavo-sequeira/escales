object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 279
  Width = 364
  object FDConnection: TFDConnection
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
end
