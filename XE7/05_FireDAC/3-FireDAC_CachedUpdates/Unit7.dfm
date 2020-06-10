object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 336
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
    Left = 12
    Top = 56
    Width = 555
    Height = 163
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 106
      Top = 8
      Width = 240
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
    object Button1: TButton
      Left = 368
      Top = 9
      Width = 105
      Height = 25
      Caption = 'Commit Updates'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 490
      Top = 9
      Width = 111
      Height = 25
      Caption = 'Cancel Updates'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'MonitorBy=Remote'
      'ConnectionDef=EMPLOYEE'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 68
    Top = 232
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 3
    SQL.Strings = (
      'SELECT * FROM customer')
    Left = 192
    Top = 236
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 318
    Top = 240
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 440
    Top = 234
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 582
    Top = 230
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Left = 628
    Top = 116
  end
end
