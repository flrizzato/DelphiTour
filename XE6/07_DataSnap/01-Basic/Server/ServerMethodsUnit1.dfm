object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 388
  Width = 359
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'Database=C:\DTOURXE6\data\MASTSQL2.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    FetchOptions.AssignedValues = [evMode, evUnidirectional, evAutoFetchAll]
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object CustomersQuery: TFDQuery
    Connection = EmployeeConnection
    FetchOptions.AssignedValues = [evMode, evUnidirectional]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM CUSTOMER')
    Left = 56
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 208
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 56
    Top = 264
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 56
    Top = 144
  end
end
