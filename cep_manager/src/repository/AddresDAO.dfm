object AddresRepoModule: TAddresRepoModule
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object ConnectionDb: TFDConnection
    Left = 216
    Top = 192
  end
  object DBComands: TFDQuery
    Connection = ConnectionDb
    Left = 384
    Top = 312
  end
end
