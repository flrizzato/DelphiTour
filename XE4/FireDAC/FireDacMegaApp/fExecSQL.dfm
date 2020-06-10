object ExecSQLFrm: TExecSQLFrm
  Left = 0
  Top = 0
  Caption = 'Array DML vs ExecSQL'
  ClientHeight = 286
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
    286)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 17
    Width = 43
    Height = 13
    Caption = 'Records:'
  end
  object Label8: TLabel
    Tag = 1
    Left = 314
    Top = 17
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
    OnClick = Label8Click
  end
  object Edit1: TEdit
    Left = 57
    Top = 13
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '10000'
  end
  object CheckBox1: TCheckBox
    Left = 114
    Top = 16
    Width = 91
    Height = 17
    Caption = 'Use Array DML'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 211
    Top = 11
    Width = 75
    Height = 25
    Caption = 'Execute'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 48
    Width = 410
    Height = 230
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
  object ADQuery1: TADQuery
    Connection = MainFrm.ADConnection1
    SQL.Strings = (
      'insert into {id ADQA_TransTable} (id, name) values (:id, :name)')
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end
      item
        Name = 'NAME'
        ParamType = ptInput
      end>
  end
end
