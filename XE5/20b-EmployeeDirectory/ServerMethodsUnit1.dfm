object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 339
  Width = 550
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data\' +
        'EMPLOYEE.GDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Protocol=TCPIP'
      'DriverID=IB')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 224
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 56
  end
  object qryEmployee: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from employee order by FULL_NAME')
    Left = 320
    Top = 144
  end
  object dspEmployee: TDataSetProvider
    DataSet = qryEmployee
    Left = 320
    Top = 208
  end
  object qryProjects: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'Select P.*, E.FULL_NAME from Project P LEFT OUTER JOIN EMPLOYEE ' +
        'E ON E.EMP_NO = P.TEAM_LEADER'
      'order by PROJ_NAME')
    Left = 96
    Top = 136
  end
  object dspProjects: TDataSetProvider
    DataSet = qryProjects
    Left = 96
    Top = 200
  end
  object dsEmployee: TDataSource
    DataSet = qryEmployee
    Left = 440
    Top = 184
  end
  object qryEmployeeProjects: TFDQuery
    MasterSource = dsEmployee
    MasterFields = 'EMP_NO'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'Select * from EMPLOYEE_PROJECT WHERE EMP_NO = :EMP_NO')
    Left = 440
    Top = 248
    ParamData = <
      item
        Name = 'EMP_NO'
        DataType = ftSmallint
        ParamType = ptInput
        Size = 2
        Value = 34
      end>
  end
  object qryProjectEmployees: TFDQuery
    MasterSource = dsProjects
    MasterFields = 'PROJ_ID'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'Select EP.*, E.FULL_NAME from EMPLOYEE_PROJECT EP INNER JOIN EMP' +
        'LOYEE E ON E.EMP_NO = EP.EMP_NO'
      'WHERE EP.PROJ_ID = :PROJ_ID'
      'order by E.FULL_NAME'
      '')
    Left = 184
    Top = 240
    ParamData = <
      item
        Name = 'PROJ_ID'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 6
        Value = 'GUIDE'
      end>
  end
  object dsProjects: TDataSource
    DataSet = qryProjects
    Left = 184
    Top = 176
  end
end
