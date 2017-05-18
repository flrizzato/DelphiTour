object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 302
  Width = 526
  object KinveyProvider1: TKinveyProvider
    ApiVersion = '3'
    AppKey = 'kid_TVzaJP_2nq'
    AppSecret = '98e0e8d378ff4f558f4b39b1176a86f5'
    MasterSecret = '5273d85aa89b4099a953fbf47142460a'
    UserName = 'fernando.rizzato@gmail.com'
    Password = 'Tokyo123'
    Left = 55
    Top = 24
  end
  object BackendStorage1: TBackendStorage
    Provider = KinveyProvider1
    Left = 144
    Top = 24
  end
end
