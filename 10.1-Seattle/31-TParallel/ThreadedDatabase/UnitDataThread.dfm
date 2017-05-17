object DataModuleThread: TDataModuleThread
  OldCreateOrder = False
  Height = 287
  Width = 507
  object FDConnectionThread: TFDConnection
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
  object FDQueryDetail: TFDQuery
    Connection = FDConnectionThread
    SQL.Strings = (
      'select Content from Detail where ID = :ID')
    Left = 168
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
