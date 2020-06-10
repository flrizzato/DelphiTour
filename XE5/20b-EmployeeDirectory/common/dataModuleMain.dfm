object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 355
  Width = 570
  object cdsEmployeeProjects: TClientDataSet
    Aggregates = <>
    DataSetField = cdsEmployeeqryEmployeeProjects
    Params = <>
    Left = 376
    Top = 248
    object cdsEmployeeProjectsEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEmployeeProjectsPROJ_ID: TStringField
      FieldName = 'PROJ_ID'
      Origin = 'PROJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsEmployeeProjectsProject_name: TStringField
      FieldKind = fkLookup
      FieldName = 'Project_name'
      LookupDataSet = cdsProjects
      LookupKeyFields = 'PROJ_ID'
      LookupResultField = 'PROJ_NAME'
      KeyFields = 'PROJ_ID'
      Size = 100
      Lookup = True
    end
    object cdsEmployeeProjectsProduct: TStringField
      FieldKind = fkLookup
      FieldName = 'Product'
      LookupDataSet = cdsProjects
      LookupKeyFields = 'PROJ_ID'
      LookupResultField = 'PRODUCT'
      KeyFields = 'PROJ_ID'
      Size = 100
      Lookup = True
    end
    object cdsEmployeeProjectsLeadEmployee: TStringField
      FieldKind = fkLookup
      FieldName = 'LeadEmployee'
      LookupDataSet = cdsProjects
      LookupKeyFields = 'PROJ_ID'
      LookupResultField = 'FULL_NAME'
      KeyFields = 'PROJ_ID'
      Size = 100
      Lookup = True
    end
  end
  object cdsProjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProjects'
    RemoteServer = DSProviderConnection1
    Left = 200
    Top = 184
    object cdsProjectsPROJ_ID: TStringField
      FieldName = 'PROJ_ID'
      Origin = 'PROJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsProjectsPROJ_NAME: TStringField
      FieldName = 'PROJ_NAME'
      Origin = 'PROJ_NAME'
      Required = True
    end
    object cdsProjectsPROJ_DESC: TMemoField
      FieldName = 'PROJ_DESC'
      Origin = 'PROJ_DESC'
      BlobType = ftMemo
    end
    object cdsProjectsTEAM_LEADER: TSmallintField
      FieldName = 'TEAM_LEADER'
      Origin = 'TEAM_LEADER'
    end
    object cdsProjectsPRODUCT: TStringField
      FieldName = 'PRODUCT'
      Origin = 'PRODUCT'
      Required = True
      Size = 12
    end
    object cdsProjectsFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 37
    end
    object cdsProjectsqryProjectEmployees: TDataSetField
      FieldName = 'qryProjectEmployees'
    end
  end
  object cdsEmployee: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmployee'
    RemoteServer = DSProviderConnection1
    Left = 376
    Top = 184
    object cdsEmployeeEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEmployeeFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object cdsEmployeeLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Required = True
    end
    object cdsEmployeePHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Origin = 'PHONE_EXT'
      Size = 4
    end
    object cdsEmployeeHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Origin = 'HIRE_DATE'
      Required = True
    end
    object cdsEmployeeDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Origin = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsEmployeeJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object cdsEmployeeJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Origin = 'JOB_GRADE'
      Required = True
    end
    object cdsEmployeeJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Origin = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object cdsEmployeeSALARY: TBCDField
      FieldName = 'SALARY'
      Origin = 'SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEmployeeFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 37
    end
    object cdsEmployeeqryEmployeeProjects: TDataSetField
      FieldName = 'qryEmployeeProjects'
    end
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 274
    Top = 96
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=8080'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    AfterConnect = SQLConnection1AfterConnect
    BeforeConnect = SQLConnection1BeforeConnect
    Left = 274
    Top = 32
  end
  object cdsProjectEmployess: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProjectsqryProjectEmployees
    Params = <>
    Left = 200
    Top = 248
    object cdsProjectEmployessEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjectEmployessPROJ_ID: TStringField
      FieldName = 'PROJ_ID'
      Origin = 'PROJ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsProjectEmployessFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 37
    end
  end
  object pbsServerSettings: TPrototypeBindSource
    AutoActivate = False
    AutoPost = True
    RecordCount = 1
    FieldDefs = <
      item
        Name = 'Port'
        Generator = 'Integers'
        ReadOnly = False
      end
      item
        Name = 'Server'
        Generator = 'LoremIpsum'
        ReadOnly = False
      end
      item
        Name = 'URLPath'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'UserName'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'Password'
        Generator = 'ContactNames'
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = pbsServerSettingsCreateAdapter
    Left = 376
    Top = 32
  end
end
