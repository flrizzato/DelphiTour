object AsyncFrm: TAsyncFrm
  Left = 0
  Top = 0
  Caption = 'Async Query Execution'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Tag = 1
    Left = 314
    Top = 13
    Width = 104
    Height = 13
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'More about that ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 410
    Height = 239
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 89
    Top = 12
    Width = 109
    Height = 17
    Caption = 'Use async dialog'
    TabOrder = 2
  end
  object ADQuery1: TADQuery
    BeforeOpen = ADQuery1BeforeOpen
    AfterOpen = ADQuery1AfterOpen
    Connection = MainFrm.ADConnection1
    ResourceOptions.AssignedValues = [rvCmdExecMode, rvCmdExecTimeout]
    ResourceOptions.CmdExecMode = amCancelDialog
    ResourceOptions.CmdExecTimeout = 30000
    SQL.Strings = (
      'SELECT a.CustomerID, b.EmployeeID, Count(*)'
      'FROM {id Orders} a, {id Orders} b'
      'GROUP BY a.CustomerID, b.EmployeeID'
      '')
    Left = 80
    Top = 128
  end
  object DataSource1: TDataSource
    Left = 120
    Top = 128
  end
end
