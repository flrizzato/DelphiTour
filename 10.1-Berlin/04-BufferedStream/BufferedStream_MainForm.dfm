object FormReaderWriter: TFormReaderWriter
  Left = 0
  Top = 0
  Caption = 'BufferedFileStream'
  ClientHeight = 376
  ClientWidth = 577
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
    Left = 32
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Streams'
  end
  object btnWrite: TButton
    Left = 32
    Top = 40
    Width = 129
    Height = 25
    Caption = 'btnWrite'
    TabOrder = 0
    OnClick = btnWriteClick
  end
  object btnRead: TButton
    Left = 184
    Top = 40
    Width = 129
    Height = 25
    Caption = 'btnRead'
    TabOrder = 1
    OnClick = btnReadClick
  end
  object btnReadBuffered: TButton
    Left = 336
    Top = 40
    Width = 121
    Height = 25
    Caption = 'btnReadBuffered'
    TabOrder = 2
    OnClick = btnReadBufferedClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 96
    Width = 441
    Height = 249
    TabOrder = 3
  end
end
