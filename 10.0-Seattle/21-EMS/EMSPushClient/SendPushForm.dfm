object Form17: TForm17
  Left = 0
  Top = 0
  Caption = 'Form17'
  ClientHeight = 211
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 184
    Top = 106
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Test from VCL!!!'
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '1'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 72
    Top = 24
  end
  object BackendPush1: TBackendPush
    Provider = EMSProvider1
    Extras = <>
    Left = 152
    Top = 24
  end
end
