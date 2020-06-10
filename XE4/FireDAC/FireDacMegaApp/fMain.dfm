object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 'AnyDAC Mega Demo, (c) 2011 DA-SOFT Technologies'
  ClientHeight = 352
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 9
    Width = 209
    Height = 216
    Stretch = True
    Transparent = True
  end
  object Label1: TLabel
    Tag = 1
    Left = 360
    Top = 8
    Width = 81
    Height = 13
    Cursor = crHandPoint
    Caption = 'AnyDAC Home'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Tag = 2
    Left = 360
    Top = 31
    Width = 126
    Height = 13
    Cursor = crHandPoint
    Caption = 'AnyDAC BDE Migration'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label3: TLabel
    Tag = 3
    Left = 360
    Top = 54
    Width = 135
    Height = 13
    Cursor = crHandPoint
    Caption = 'AnyDAC Documentation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label4: TLabel
    Tag = 4
    Left = 360
    Top = 77
    Width = 73
    Height = 13
    Cursor = crHandPoint
    Caption = 'AnyDAC Trial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label5: TLabel
    Tag = 5
    Left = 360
    Top = 100
    Width = 76
    Height = 13
    Cursor = crHandPoint
    Caption = 'AnyDAC Shop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label1Click
  end
  object Button1: TButton
    Left = 232
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Environment Report'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 39
    Width = 113
    Height = 25
    Caption = 'Connection Def'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 70
    Width = 113
    Height = 25
    Caption = 'Rowset Fetching'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 101
    Width = 113
    Height = 25
    Caption = 'Batch, Next RS'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 232
    Top = 132
    Width = 113
    Height = 25
    Caption = 'Batch, All RS'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 232
    Top = 163
    Width = 113
    Height = 25
    Caption = 'Array DML'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 232
    Top = 194
    Width = 113
    Height = 25
    Caption = 'Async Execute'
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 232
    Top = 225
    Width = 113
    Height = 25
    Caption = 'Escapes and Macros'
    TabOrder = 7
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 232
    Top = 288
    Width = 113
    Height = 25
    Caption = 'SQL Scripts'
    TabOrder = 8
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 232
    Top = 319
    Width = 113
    Height = 25
    Caption = 'Auto-inc Fields'
    TabOrder = 9
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 232
    Top = 256
    Width = 113
    Height = 25
    Caption = 'Macros, QBF'
    TabOrder = 10
    OnClick = Button11Click
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'ConnectionDef=Oracle_Demo')
    LoginPrompt = False
    Left = 80
    Top = 200
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    ScreenCursor = gcrHourGlass
    Left = 408
    Top = 296
  end
  object ADMoniRemoteClientLink1: TADMoniRemoteClientLink
    Tracing = True
    Left = 296
    Top = 296
  end
  object ADMoniFlatFileClientLink1: TADMoniFlatFileClientLink
    Left = 328
    Top = 296
  end
  object ADPhysDB2DriverLink1: TADPhysDB2DriverLink
    Left = 120
    Top = 248
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 160
    Top = 248
  end
  object ADPhysODBCDriverLink1: TADPhysODBCDriverLink
    Left = 200
    Top = 248
  end
  object ADPhysMSAccessDriverLink1: TADPhysMSAccessDriverLink
    Left = 240
    Top = 248
  end
  object ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink
    Left = 280
    Top = 248
  end
  object ADPhysASADriverLink1: TADPhysASADriverLink
    Left = 320
    Top = 248
  end
  object ADPhysADSDriverLink1: TADPhysADSDriverLink
    Left = 80
    Top = 296
  end
  object ADPhysIBDriverLink1: TADPhysIBDriverLink
    Left = 120
    Top = 296
  end
  object ADPhysPgDriverLink1: TADPhysPgDriverLink
    Left = 160
    Top = 296
  end
  object ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink
    Left = 200
    Top = 296
  end
  object ADPhysTDBXDriverLink1: TADPhysTDBXDriverLink
    Left = 240
    Top = 296
  end
  object ADPhysOracleDriverLink1: TADPhysOracleDriverLink
    Left = 80
    Top = 248
  end
end
