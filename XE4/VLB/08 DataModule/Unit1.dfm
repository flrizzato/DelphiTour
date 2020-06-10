object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 289
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridBindSourceDB1: TStringGrid
    Tag = 7
    Left = 72
    Top = 32
    Width = 505
    Height = 241
    ColCount = 7
    FixedCols = 0
    RowCount = 29
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64)
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule2.ClientDataSet1
    ScopeMappings = <>
    Left = 312
    Top = 152
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGridBindSourceDB1
      AutoBufferCount = False
      Columns = <>
    end
  end
end
