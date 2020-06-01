object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'FireDAC Monitoring'
  ClientHeight = 306
  ClientWidth = 754
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
    Left = 0
    Top = 41
    Width = 754
    Height = 265
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 128
      Top = 10
      Width = 600
      Height = 25
      DataSource = DataSource1
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 12
      Top = 13
      Width = 97
      Height = 17
      Caption = 'Connected'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'MonitorBy=Remote+'
      'Database=C:\DTOURXE7\data\MASTSQL2.IB'
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 72
    Top = 224
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 3
    SQL.Strings = (
      'SELECT * FROM customer')
    Left = 152
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 232
    Top = 224
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 320
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 432
    Top = 224
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 552
    Top = 224
  end
end
