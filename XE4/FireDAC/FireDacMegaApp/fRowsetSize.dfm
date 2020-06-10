object RowsetSizeFrm: TRowsetSizeFrm
  Left = 0
  Top = 0
  Caption = 'Rowset Fetching'
  ClientHeight = 349
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    510
    349)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 16
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label2: TLabel
    Left = 103
    Top = 16
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object Label3: TLabel
    Left = 188
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Step:'
  end
  object Label8: TLabel
    Tag = 1
    Left = 398
    Top = 16
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
    OnClick = Label8Click
    ExplicitLeft = 437
  end
  object Edit1: TEdit
    Left = 41
    Top = 13
    Width = 56
    Height = 21
    TabOrder = 0
    Text = '1'
  end
  object Edit2: TEdit
    Left = 125
    Top = 13
    Width = 56
    Height = 21
    TabOrder = 1
    Text = '100'
  end
  object Edit3: TEdit
    Left = 222
    Top = 13
    Width = 55
    Height = 21
    TabOrder = 2
    Text = '10'
  end
  object Memo1: TMemo
    Left = 8
    Top = 42
    Width = 494
    Height = 299
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
    ExplicitWidth = 410
    ExplicitHeight = 236
  end
  object Button1: TButton
    Left = 295
    Top = 11
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 4
    OnClick = Button1Click
  end
  object ADQuery1: TADQuery
    Connection = MainFrm.ADConnection1
    SQL.Strings = (
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      'union all'
      'select o.* from {id Order Details} o'
      '')
    Left = 264
    Top = 104
  end
end
