object QBFFrm: TQBFFrm
  Left = 0
  Top = 0
  Caption = 'Macros - Query By Form'
  ClientHeight = 338
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    482
    338)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 54
    Height = 13
    Caption = 'First name:'
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 53
    Height = 13
    Caption = 'Last name:'
  end
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 24
    Height = 13
    Caption = 'Title:'
  end
  object Label8: TLabel
    Tag = 1
    Left = 370
    Top = 8
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
  end
  object edtFirstName: TEdit
    Left = 68
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtLastName: TEdit
    Left = 68
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtTitle: TEdit
    Left = 68
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 200
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 89
    Width = 466
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADQuery1: TADQuery
    Connection = MainFrm.ADConnection1
    SQL.Strings = (
      'select * '
      'from {id Employees}'
      '{IF !FirstName !LastName !Title}'
      '  where 1=1'
      
        '    {IF !FirstName} and ({ucase(FirstName)} like {ucase('#39'%!First' +
        'Name%'#39')}) {FI}'
      
        '    {IF !LastName} and ({ucase(LastName)} like {ucase('#39'%!LastNam' +
        'e%'#39')}) {FI}'
      
        '    {IF !Title} and ({ucase(Title)} like {ucase('#39'%!Title%'#39')}) {F' +
        'I}'
      '{FI}    ')
    Left = 376
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'FIRSTNAME'
      end
      item
        Value = Null
        Name = 'LASTNAME'
      end
      item
        Value = Null
        Name = 'TITLE'
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 416
    Top = 16
  end
end
