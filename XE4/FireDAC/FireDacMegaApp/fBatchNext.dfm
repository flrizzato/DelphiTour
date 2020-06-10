object BatchNextFrm: TBatchNextFrm
  Left = 0
  Top = 0
  Caption = 'Command Batch - NextResultSet'
  ClientHeight = 304
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    516
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 215
    Top = 13
    Width = 153
    Height = 13
    Caption = 'Not for Oracle and Firebird !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Tag = 1
    Left = 404
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
    ExplicitLeft = 314
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 60
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 74
    Top = 8
    Width = 60
    Height = 25
    Caption = 'Next set'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 500
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 140
    Top = 8
    Width = 60
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ADQuery1: TADQuery
    Connection = MainFrm.ADConnection1
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    SQL.Strings = (
      'select * from {id Region};'
      'select * from {id Territories}')
    Left = 368
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 368
    Top = 72
  end
end
