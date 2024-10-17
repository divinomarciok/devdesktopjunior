object ServiceConexao: TServiceConexao
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object ConexaoDB: TFDConnection
    Left = 240
    Top = 280
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 384
    Top = 312
  end
  object QRY_migration: TFDQuery
    Connection = ConexaoDB
    Left = 456
    Top = 392
  end
end
