object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FireDAC - Connection Recovery'
  ClientHeight = 313
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
  object DBGrid1: TDBGrid
    Left = 14
    Top = 40
    Width = 401
    Height = 261
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object CheckBox1: TCheckBox
    Left = 14
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Table Active'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    OnRecover = FDConnection1Recover
    Left = 90
    Top = 96
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 484
    Top = 102
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 550
    Top = 28
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'ORDERNO'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'ORDERS'
    TableName = 'ORDERS'
    Left = 212
    Top = 122
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 318
    Top = 134
  end
end
