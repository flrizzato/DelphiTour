object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 168
  Width = 257
  object cdsEmployee: TClientDataSet
    Aggregates = <>
    FileName = 
      'C:\Users\Public\Documents\RAD Studio\12.0\Samples\Data\customer.' +
      'cds'
    Params = <>
    Left = 56
    Top = 32
  end
  object provEmployee: TDataSetProvider
    DataSet = cdsEmployee
    Left = 56
    Top = 96
  end
end
