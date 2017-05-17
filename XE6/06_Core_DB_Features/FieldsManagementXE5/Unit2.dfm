object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 372
  ClientWidth = 641
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
    Left = 48
    Top = 48
    Width = 505
    Height = 281
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 48
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'Database=C:\DTOURXE6\data\MASTSQL2.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost/3050'
      'DriverID=IB')
    LoginPrompt = False
    Left = 196
    Top = 82
  end
  object EmployeeTable: TFDQuery
    OnCalcFields = EmployeeTableCalcFields
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 196
    Top = 154
    object EmployeeTableEMPNO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EmployeeTablefirstandlast: TStringField
      FieldKind = fkCalculated
      FieldName = 'firstandlast'
      Size = 40
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = EmployeeTable
    Left = 200
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 504
    Top = 40
  end
end
