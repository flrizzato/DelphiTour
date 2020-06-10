object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 257
  ClientWidth = 357
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
    Left = 56
    Top = 61
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 56
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Label1'
  end
  object CheckBox1: TCheckBox
    Left = 56
    Top = 120
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToProperty1: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = Edit1
      Track = True
      Component = Label1
      ComponentProperty = 'Caption'
    end
    object LinkControlToProperty2: TLinkControlToProperty
      Category = 'Quick Bindings'
      Control = CheckBox1
      Track = True
      Component = Edit1
      ComponentProperty = 'Enabled'
    end
  end
end
