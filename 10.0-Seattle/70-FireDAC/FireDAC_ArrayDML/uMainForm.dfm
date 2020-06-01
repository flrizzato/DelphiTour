object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'FireDAC - Array DML'
  ClientHeight = 248
  ClientWidth = 635
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
    Left = 32
    Top = 24
    Width = 131
    Height = 25
    Caption = 'Normal Inserts'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 186
    Top = 24
    Width = 131
    Height = 25
    Caption = 'Array DML Inserts'
    TabOrder = 1
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 48
    Top = 86
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 48
    Top = 138
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 140
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 140
    Top = 84
  end
end
