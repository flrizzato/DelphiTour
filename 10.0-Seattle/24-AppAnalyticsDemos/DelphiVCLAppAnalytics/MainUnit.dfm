object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 381
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 64
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 120
    Top = 120
    Width = 257
    Height = 145
    ItemHeight = 13
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 104
    Top = 24
    Width = 273
    Height = 17
    Caption = 'AppAnalytics Enablement'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Button2: TButton
    Left = 120
    Top = 291
    Width = 257
    Height = 25
    Caption = 'Track Custom Event'
    TabOrder = 4
    OnClick = Button2Click
  end
  object AppAnalytics1: TAppAnalytics
    ApplicationID = '{3fe2840e-2377-4055-94f3-22c17f27384c}'
    Active = True
    CacheSize = 500
    UpdateInterval = 600
    Options = [aoTrackStartup, aoTrackFormActivate, aoTrackControlFocus, aoTrackExceptions]
    PrivacyMessage.Strings = (
      'Privacy Notice:'
      ''
      
        'This application anonymously tracks your usage and sends it to u' +
        's for analysis. We use this analysis to make the software work b' +
        'etter for you.'
      ''
      
        'This tracking is completely anonymous. No personally identifying' +
        ' information is tracked, and nothing about your usage can be tra' +
        'cked back to you.'
      ''
      'Thank you for helping us to improve this software.')
    Left = 56
    Top = 136
  end
end
