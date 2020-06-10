object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FireDAC Cross-Plataform Database Access'
  ClientHeight = 396
  ClientWidth = 586
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
    Top = 57
    Width = 586
    Height = 320
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CUSTNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPANY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDR2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXRATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTINVOICEDATE'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      586
      57)
    object SpeedButton1: TSpeedButton
      Tag = 1
      Left = 16
      Top = 17
      Width = 65
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'IB'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Tag = 2
      Left = 87
      Top = 17
      Width = 65
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'MSSQL'
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Tag = 3
      Left = 158
      Top = 17
      Width = 65
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'ORA'
      OnClick = SpeedButton1Click
    end
    object Button1: TButton
      Left = 496
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Update >>'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 377
    Width = 586
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Panels = <>
    SimplePanel = True
    UseSystemFont = False
  end
  object ADConnection1: TFDConnection
    ConnectionName = 'UniversalCnn'
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end>
    LoginPrompt = False
    Left = 48
    Top = 88
  end
  object ADQuery1: TFDQuery
    CachedUpdates = True
    Connection = ADConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.KeyFields = 'CUSTNO'
    SQL.Strings = (
      'SELECT * FROM CUSTOMER')
    Left = 48
    Top = 144
    object ADQuery1CUSTNO: TFloatField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ADQuery1COMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Required = True
      Size = 30
    end
    object ADQuery1ADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 30
    end
    object ADQuery1ADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 30
    end
    object ADQuery1CITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 15
    end
    object ADQuery1STATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object ADQuery1ZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object ADQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
    end
    object ADQuery1PHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 15
    end
    object ADQuery1FAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 15
    end
    object ADQuery1TAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Origin = 'TAXRATE'
    end
    object ADQuery1CONTACT: TStringField
      FieldName = 'CONTACT'
      Origin = 'CONTACT'
    end
    object ADQuery1LASTINVOICEDATE: TSQLTimeStampField
      FieldName = 'LASTINVOICEDATE'
      Origin = 'LASTINVOICEDATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 48
    Top = 200
  end
  object ADPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 456
    Top = 104
  end
  object ADGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 456
    Top = 272
  end
  object ADPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 456
    Top = 216
  end
  object ADPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 456
    Top = 160
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 248
    Top = 96
  end
end
