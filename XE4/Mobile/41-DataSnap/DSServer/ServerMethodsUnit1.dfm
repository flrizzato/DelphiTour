object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 269
  Width = 385
  object ADConnection1: TADConnection
    ConnectionName = 'MyEmployeeIB'
    Params.Strings = (
      'ConnectionDef=EMPLOYEE_IB')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object ADQuery1: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'SELECT * FROM CUSTOMER')
    Left = 48
    Top = 88
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADQuery1
    Left = 48
    Top = 152
  end
  object ADPhysIBDriverLink1: TADPhysIBDriverLink
    Left = 144
    Top = 24
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 144
    Top = 88
  end
end
