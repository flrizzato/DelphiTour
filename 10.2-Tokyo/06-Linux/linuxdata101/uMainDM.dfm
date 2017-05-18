object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 291
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 40
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 160
    Top = 40
  end
end
