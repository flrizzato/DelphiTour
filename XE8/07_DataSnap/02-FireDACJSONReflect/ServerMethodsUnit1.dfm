object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 335
  Width = 514
  object FDQueryDepartmentEmployees: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select * from employee where dept_no = :DEPT'
      '')
    Left = 200
    Top = 128
    ParamData = <
      item
        Name = 'DEPT'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = '000'
      end>
  end
  object FDQueryDepartment: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select * from department where DEPT_NO = :DEPT')
    Left = 200
    Top = 72
    ParamData = <
      item
        Name = 'DEPT'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = '000'
      end>
  end
  object FDQueryDepartmentNames: TFDQuery
    Connection = FDConnectionEMPLOYEE
    SQL.Strings = (
      'select dept_no, department  from department')
    Left = 200
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 128
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 55
    Top = 72
  end
  object FDConnectionEMPLOYEE: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\14.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'ConnectionDef=EMPLOYEE'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 55
    Top = 16
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 200
    Top = 184
  end
end
