object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 306
  Width = 474
  object KinveyProvider: TKinveyProvider
    ApiVersion = '3'
    Left = 96
    Top = 96
  end
  object BackendStorage: TBackendStorage
    Provider = ParseProvider
    Left = 280
    Top = 136
  end
  object ParseProvider: TParseProvider
    ApiVersion = '1'
    Left = 96
    Top = 176
  end
end
