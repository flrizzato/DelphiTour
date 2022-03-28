object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MongoDB 101'
  ClientHeight = 596
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 863
    Height = 44
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 859
    object btnCnn: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Connect'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      StyleName = 'Iceberg Classico'
      OnClick = btnCnnClick
    end
    object btnFind: TButton
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Find'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      StyleName = 'Iceberg Classico'
      OnClick = btnFindClick
    end
    object btnQuery: TButton
      AlignWithMargins = True
      Left = 215
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Query'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      StyleName = 'Iceberg Classico'
      OnClick = btnQueryClick
    end
    object btnStart: TButton
      AlignWithMargins = True
      Left = 321
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Start Trans'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      StyleName = 'Ruby Graphite'
      OnClick = btnStartClick
    end
    object btnCommit: TButton
      AlignWithMargins = True
      Left = 427
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Commit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      StyleName = 'Aqua Graphite'
      OnClick = btnCommitClick
    end
    object btnRollback: TButton
      AlignWithMargins = True
      Left = 533
      Top = 3
      Width = 100
      Height = 38
      Align = alLeft
      Caption = 'Rollback'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      StyleName = 'Golden Graphite'
      OnClick = btnRollbackClick
    end
  end
  object memResult: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 857
    Height = 188
    Align = alClient
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    StyleName = 'Windows11 Modern Light'
    ExplicitWidth = 853
    ExplicitHeight = 187
  end
  object memStatus: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 553
    Width = 857
    Height = 40
    Align = alBottom
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = 16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 552
    ExplicitWidth = 853
  end
  object dbgQuery: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 241
    Width = 857
    Height = 150
    Align = alBottom
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
  end
  object dbgDataSet: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 397
    Width = 857
    Height = 150
    Align = alBottom
    DataSource = DataSource2
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
  end
  object FDPhysMongoDriverLink1: TFDPhysMongoDriverLink
    Left = 120
    Top = 320
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 120
    Top = 376
  end
  object Mongodb_demo: TFDConnection
    Params.Strings = (
      'User_Name=flrizzato'
      'Password=ZWadkSBsVpwOPcEJ'
      'Server=cluster0-shard-00-02.brkpz.gcp.mongodb.net'
      'LoginTimeout=1000'
      'ReadTimeout=1000'
      'UseSSL=True'
      'SSL_PEMFile=client.fd-test.pem'
      'SSL_CAFile=root.crt'
      'SSL_WeakValidation=False'
      'SSL_AllowInvHost=False'
      'DriverID=Mongo')
    FetchOptions.AssignedValues = [evLiveWindowParanoic]
    FetchOptions.LiveWindowParanoic = False
    FormatOptions.AssignedValues = [fvMapRules, fvSE2Null, fvStrsTrim, fvStrsTrim2Len, fvADOCompatibility]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    LoginPrompt = False
    Left = 122
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = FDMongoQuery1
    Left = 256
    Top = 328
  end
  object FDMongoQuery1: TFDMongoQuery
    FetchOptions.AssignedValues = [evItems]
    FormatOptions.AssignedValues = [fvInlineDataSize, fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    Connection = Mongodb_demo
    DatabaseName = 'sample_restaurants'
    CollectionName = 'restaurants'
    Left = 256
    Top = 264
  end
  object FDMongoDataSet1: TFDMongoDataSet
    FormatOptions.AssignedValues = [fvInlineDataSize, fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    Connection = Mongodb_demo
    DatabaseName = 'sample_restaurants'
    CollectionName = 'restaurants'
    Left = 368
    Top = 264
  end
  object DataSource2: TDataSource
    DataSet = FDMongoDataSet1
    Left = 368
    Top = 328
  end
end
