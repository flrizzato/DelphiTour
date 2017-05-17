object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 186
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 56
    Width = 121
    Height = 25
    Action = Action1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object ListBox1: TListBox
    Left = 168
    Top = 24
    Width = 209
    Height = 154
    ItemHeight = 13
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 56
    Top = 120
    object Action1: TAction
      Caption = 'Press'
      OnExecute = Action1Execute
    end
  end
  object TetheringManager1: TTetheringManager
    Text = 'TetheringManager1'
    Left = 240
    Top = 40
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Group = 'PressButtonProfile'
    Actions = <
      item
        Name = 'Action1'
        IsPublic = True
        Action = Action1
        NotifyUpdates = False
      end>
    Resources = <>
    Left = 240
    Top = 96
  end
end
