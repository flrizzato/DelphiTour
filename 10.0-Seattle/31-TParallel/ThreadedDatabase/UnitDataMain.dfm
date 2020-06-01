object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 442
  Width = 698
  object FDConnectionMain: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Delphi\Documents\LocalDB.sdb'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 64
    Top = 80
  end
  object FDQueryCreate: TFDQuery
    Connection = FDConnectionMain
    Left = 168
    Top = 24
  end
  object FDTableMaster: TFDTable
    Connection = FDConnectionMain
    UpdateOptions.UpdateTableName = 'book'
    TableName = 'book'
    Left = 64
    Top = 152
  end
  object cdsDetailCache: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 216
  end
end
