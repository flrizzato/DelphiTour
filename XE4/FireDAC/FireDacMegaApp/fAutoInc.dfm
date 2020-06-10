object AutoIncFrm: TAutoIncFrm
  Left = 0
  Top = 0
  Caption = 'Auto-Incrementing Fields'
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
    Width = 411
    Height = 239
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADQuery1: TADQuery
    Active = True
    BeforeOpen = ADQuery1BeforeOpen
    Connection = MainFrm.ADConnection1
    SQL.Strings = (
      'SELECT * FROM {id ADQA_Identity_tab}')
    Left = 120
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 168
    Top = 104
  end
end
