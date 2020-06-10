object ConDefFrm: TConDefFrm
  Left = 0
  Top = 0
  Caption = 'Connection Definition'
  ClientHeight = 286
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    426
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 43
    Height = 13
    Caption = 'Driver ID'
  end
  object Label3: TLabel
    Left = 8
    Top = 124
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label4: TLabel
    Left = 8
    Top = 70
    Width = 32
    Height = 13
    Caption = 'Server'
  end
  object Label5: TLabel
    Left = 8
    Top = 97
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Label6: TLabel
    Left = 8
    Top = 151
    Width = 51
    Height = 13
    Caption = 'User name'
  end
  object Label7: TLabel
    Left = 8
    Top = 178
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label8: TLabel
    Tag = 1
    Left = 306
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
  end
  object edtName: TEdit
    Left = 65
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'TestCon'
  end
  object edtDatabase: TEdit
    Left = 65
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'XE'
  end
  object Button1: TButton
    Left = 65
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 7
    OnClick = Button1Click
  end
  object edtServer: TEdit
    Left = 65
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtPort: TEdit
    Left = 65
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtUserName: TEdit
    Left = 65
    Top = 148
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'addemo'
  end
  object edtPassword: TEdit
    Left = 65
    Top = 175
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'a'
  end
  object edtDriverID: TComboBox
    Left = 65
    Top = 40
    Width = 137
    Height = 21
    TabOrder = 1
    Text = 'Ora'
  end
  object ADConnection1: TADConnection
    LoginPrompt = False
    Left = 304
    Top = 144
  end
end
