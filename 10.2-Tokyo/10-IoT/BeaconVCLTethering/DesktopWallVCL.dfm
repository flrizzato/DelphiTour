object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'VCL Media Receiver App'
  ClientHeight = 669
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 632
    Width = 153
    Height = 29
    Caption = 'Photo Frame'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 24
    Top = 16
    Width = 481
    Height = 593
    BevelOuter = bvLowered
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 479
      Height = 591
      Align = alClient
      Stretch = True
      ExplicitWidth = 328
      ExplicitHeight = 408
    end
  end
  object VCLMediaReceiver: TTetheringManager
    OnRequestManagerPassword = VCLMediaReceiverRequestManagerPassword
    Password = '1234'
    Text = 'VCLMediaReceiver'
    AllowedAdapters = 'Network'
    Left = 160
    Top = 600
  end
  object VCLMediaReceiverApp: TTetheringAppProfile
    Manager = VCLMediaReceiver
    Text = 'VCLMediaReceiverApp'
    Actions = <>
    Resources = <>
    OnResourceReceived = VCLMediaReceiverAppResourceReceived
    Left = 56
    Top = 600
  end
end
