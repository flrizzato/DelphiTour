object MacroFrm: TMacroFrm
  Left = 0
  Top = 0
  Caption = 'Escape Functions and Macros'
  ClientHeight = 322
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    462
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 45
    Width = 70
    Height = 13
    Caption = 'Table to open:'
  end
  object Label8: TLabel
    Tag = 1
    Left = 350
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
    OnClick = Label8Click
    ExplicitLeft = 425
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Escape functions'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 446
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 120
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Conditionals'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 231
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Macros'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 84
    Top = 42
    Width = 141
    Height = 21
    TabOrder = 4
    Text = 'Orders'
  end
  object ADQuery1: TADQuery
    Connection = MainFrm.ADConnection1
    Left = 224
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 280
    Top = 16
  end
end
