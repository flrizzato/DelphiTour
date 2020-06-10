object ScriptFrm: TScriptFrm
  Left = 0
  Top = 0
  Caption = 'SQL Scripts'
  ClientHeight = 400
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    426
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Tag = 1
    Left = 314
    Top = 13
    Width = 104
    Height = 13
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = 'More about that ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label2Click
  end
  object Label1: TLabel
    Left = 94
    Top = 13
    Width = 205
    Height = 13
    Caption = 'For Firebird only ! First, adjust paths.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 410
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'SET TERM ;'
      ''
      'SET SQL DIALECT 3;'
      'SET NAMES UTF8;'
      'SET CLIENTLIB '#39'D:\IB\fb25\bin\fbclient.dll'#39';'
      'CREATE DATABASE '#39'D:\IB\TestDD2011.fb'#39
      '  USER '#39'sysdba'#39' PASSWORD '#39'masterkey'#39
      '  PAGE_SIZE 16384'
      '  DEFAULT CHARACTER SET NONE;'
      ''
      'SET TERM ^ ;'
      ''
      'CREATE PROCEDURE MY_PROC RETURNS (aParam INTEGER) AS'
      'BEGIN'
      '  aParam = 10;'
      'END^'
      ''
      'SET TERM ;^'
      ''
      'CREATE TABLE MY_TAB (f1 INTEGER, F2 VARCHAR(10));'
      'INSERT INTO MY_TAB VALUES (1, '#39'qqq'#39');'
      'INSERT INTO MY_TAB VALUES (2, '#39'www'#39');'
      'INSERT INTO MY_TAB VALUES (3, '#39'eee'#39');'
      'SELECT * FROM MY_TAB;')
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADScript1: TADScript
    SQLScripts = <>
    Connection = ADConnection1
    Params = <>
    Macros = <>
    Left = 296
    Top = 48
  end
  object ADConnection1: TADConnection
    Params.Strings = (
      'DriverID=IB')
    Left = 232
    Top = 32
  end
  object ADGUIxScriptDialog1: TADGUIxScriptDialog
    Left = 248
    Top = 96
  end
end
