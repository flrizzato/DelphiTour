object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 304
  Width = 233
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxDatasnap'
      'Port=8080'
      'CommunicationProtocol=http'
      'DatasnapContext=datasnap/'
      'Filters={}'
      'HostName=172.16.121.221')
    Left = 56
    Top = 64
    UniqueId = '{7BC09639-DFCF-401F-B73E-2387D108CF09}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = SQLConnection1
    Left = 56
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Country'
    Params = <>
    ProviderName = 'provEmployee'
    RemoteServer = DSProviderConnection1
    Left = 56
    Top = 208
  end
end
