object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 415
  ClientWidth = 559
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
    Left = 409
    Top = 0
    Width = 150
    Height = 415
    Align = alClient
    Caption = 
      'This demo shows 30 objects representing employees from different' +
      ' offices. With LiveBindings we can easily group this data and sh' +
      'ow a great summary of the data'
    WordWrap = True
    ExplicitWidth = 143
    ExplicitHeight = 78
  end
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 409
    Height = 415
    Align = alLeft
    Columns = <
      item
        Caption = 'First Name'
        Width = 100
      end
      item
        Caption = 'Last Name'
        Width = 100
      end
      item
        Caption = 'Office'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Salary'
        Width = 80
      end>
    Groups = <
      item
        Header = 'Software Engineer'
        GroupID = 0
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 1
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 2
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 3
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 4
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 5
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 6
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 7
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 8
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 9
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 10
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 11
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 12
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 13
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 14
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 15
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 16
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 17
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 18
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 19
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 20
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 21
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 22
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 23
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 24
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 25
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 26
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 27
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 28
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 29
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 30
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 31
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 32
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 33
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 34
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 35
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 36
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 37
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 38
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 39
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 40
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 41
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 42
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 43
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 44
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 45
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 46
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 47
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 48
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 49
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 50
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 51
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 52
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 53
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 54
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 55
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 56
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 57
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 58
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 59
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 60
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 61
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 62
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 63
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 64
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 65
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 66
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 67
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 68
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 69
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 70
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 71
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 72
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 73
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 74
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 75
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 76
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 77
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 78
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 79
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 80
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 81
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 82
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 83
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 84
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 85
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 86
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 87
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 88
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 89
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 90
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 91
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 92
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 93
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 94
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 95
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 96
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 97
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 98
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 99
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 100
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 101
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 102
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 103
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 104
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 105
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 106
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 107
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 108
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 109
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 110
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 111
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 112
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 113
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 114
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 115
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 116
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 117
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 118
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 119
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 120
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 121
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 122
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 123
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 124
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 125
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 126
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 127
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 128
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 129
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 130
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 131
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 132
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 133
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 134
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 135
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 136
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 137
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 138
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 139
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 140
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 141
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 142
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 143
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 144
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 145
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 146
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 147
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 148
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 149
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 150
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 151
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 152
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 153
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 154
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 155
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 156
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 157
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 158
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 159
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 160
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 161
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Software Engineer'
        GroupID = 162
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 163
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 164
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 165
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 166
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Vice President'
        GroupID = 167
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Sales Manager'
        GroupID = 168
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 169
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 170
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 171
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Accountant'
        GroupID = 172
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Product Specialist'
        GroupID = 173
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 174
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'IT Manager'
        GroupID = 175
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Account Manager'
        GroupID = 176
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Receptionist'
        GroupID = 177
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Staffing Manager'
        GroupID = 178
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end
      item
        Header = 'Marketing Director'
        GroupID = 179
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
      end>
    Items.ItemData = {
      0510590000C800000000000000FFFFFFFFFFFFFFFF040000000B0000000E0000
      00074200690074006D00610070003100074200690074006D0061007000310000
      000000064C007400470072006100790000000000063100390035002E00390034
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000380000004000
      0000074200690074006D00610070003100074200690074006D00610070003100
      000000000949006E006400690061006E00720065006400000000000438002E00
      3000380000000000000000000000000000FFFFFFFFFFFFFFFF04000000650000
      0072000000074200690074006D00610070003100074200690074006D00610070
      0031000000000006560069006F006C006500740000000000063100330038002E
      003300370000000000000000000000000000FFFFFFFFFFFFFFFF040000009200
      0000A4000000074200690074006D00610070003100074200690074006D006100
      70003100000000000947006F006C00640065006E0072006F0064000000000006
      3100360032002E003600310000000000000000000000000000FFFFFFFFFFFFFF
      FF040000000F00000012000000084200690074006D0061007000310030000842
      00690074006D006100700031003000000000000F4D0065006400690075006D00
      73006C0061007400650062006C007500650000000000063100380033002E0038
      00320000000000000000000000000000FFFFFFFFFFFFFFFF040000003B000000
      44000000084200690074006D006100700031003000084200690074006D006100
      70003100300000000000094C0069006D00650067007200650065006E00000000
      00063100310030002E003000390000000000000000000000000000FFFFFFFFFF
      FFFFFF040000006900000076000000084200690074006D006100700031003000
      084200690074006D006100700031003000000000000557006800690074006500
      000000000331003000310000000000000000000000000000FFFFFFFFFFFFFFFF
      0400000095000000A8000000084200690074006D006100700031003000084200
      690074006D00610070003100300000000000094C00610077006E006700720065
      0065006E0000000000063100390038002E003900370000000000000000000000
      000000FFFFFFFFFFFFFFFF040000001A0000001F000000084200690074006D00
      6100700031003100084200690074006D00610070003100310000000000085300
      6500610067007200650065006E000000000005350034002E0035003400000000
      00000000000000000000FFFFFFFFFFFFFFFF0400000048000000510000000842
      00690074006D006100700031003100084200690074006D006100700031003100
      00000000085300650061007300680065006C006C000000000006310036003000
      2E003500390000000000000000000000000000FFFFFFFFFFFFFFFF0400000074
      00000083000000084200690074006D006100700031003100084200690074006D
      006100700031003100000000000B53007000720069006E006700670072006500
      65006E0000000000063100350036002E00350035000000000000000000000000
      0000FFFFFFFFFFFFFFFF04000000A2000000B5000000084200690074006D0061
      00700031003100084200690074006D006100700031003100000000000C4D0065
      006400690075006D006F00720063006800690064000000000005340035002E00
      3400350000000000000000000000000000FFFFFFFFFFFFFFFF04000000290000
      002F000000084200690074006D006100700031003200084200690074006D0061
      0070003100320000000000044C0069006D00650000000000063100310039002E
      003100380000000000000000000000000000FFFFFFFFFFFFFFFF040000005600
      000061000000084200690074006D006100700031003200084200690074006D00
      610070003100320000000000054B00680061006B006900000000000535003100
      2E003500310000000000000000000000000000FFFFFFFFFFFFFFFF0400000083
      00000093000000084200690074006D006100700031003200084200690074006D
      006100700031003200000000000A530061006E0064007900620072006F007700
      6E0000000000063200300030002E003900390000000000000000000000000000
      FFFFFFFFFFFFFFFF04000000B0000000C5000000084200690074006D00610070
      0031003200084200690074006D0061007000310032000000000007440069006D
      0067007200650079000000000005370037002E00370037000000000000000000
      0000000000FFFFFFFFFFFFFFFF040000001C0000002100000008420069007400
      6D006100700031003300084200690074006D0061007000310033000000000008
      4400610072006B006300790061006E000000000005320031002E003200310000
      000000000000000000000000FFFFFFFFFFFFFFFF040000004900000053000000
      084200690074006D006100700031003300084200690074006D00610070003100
      3300000000000A41007100750061006D006100720069006E0065000000000006
      3100340039002E003400380000000000000000000000000000FFFFFFFFFFFFFF
      FF040000007600000085000000084200690074006D0061007000310033000842
      00690074006D00610070003100330000000000074D0065006400470072006100
      79000000000005330031002E003300310000000000000000000000000000FFFF
      FFFFFFFFFFFF04000000A3000000B7000000084200690074006D006100700031
      003300084200690074006D006100700031003300000000000A4C006900670068
      00740063006F00720061006C0000000000063100350038002E00350037000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000020000000400000008
      4200690074006D006100700031003400084200690074006D0061007000310034
      00000000000F4D0065006400690075006D00760069006F006C00650074007200
      650064000000000005380031002E003800310000000000000000000000000000
      FFFFFFFFFFFFFFFF040000002F00000036000000084200690074006D00610070
      0031003400084200690074006D00610070003100340000000000055700680065
      00610074000000000004320030002E00320000000000000000000000000000FF
      FFFFFFFFFFFFFF040000005C00000068000000084200690074006D0061007000
      31003400084200690074006D006100700031003400000000000848006F006E00
      6500790064006500770000000000063100380032002E00380031000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000890000009A00000008420069
      0074006D006100700031003400084200690074006D0061007000310034000000
      00000E4D0065006400690075006D0073006500610067007200650065006E0000
      0000000432002E003000320000000000000000000000000000FFFFFFFFFFFFFF
      FF04000000180000001D000000084200690074006D0061007000310035000842
      00690074006D006100700031003500000000000A44006F006400670065007200
      62006C007500650000000000063100350037002E003500360000000000000000
      000000000000FFFFFFFFFFFFFFFF04000000460000004F000000084200690074
      006D006100700031003500084200690074006D00610070003100350000000000
      09430068006F0063006F006C0061007400650000000000063100310033002E00
      3100320000000000000000000000000000FFFFFFFFFFFFFFFF04000000720000
      0081000000084200690074006D006100700031003500084200690074006D0061
      007000310035000000000005420072006F0077006E0000000000063100310034
      002E003100330000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      A0000000B3000000084200690074006D00610070003100350008420069007400
      6D00610070003100350000000000064200690073007100750065000000000006
      3100350033002E003500320000000000000000000000000000FFFFFFFFFFFFFF
      FF040000000100000003000000084200690074006D0061007000310036000842
      00690074006D00610070003100360000000000104D0065006400690075006D00
      61007100750061006D006100720069006E0065000000000005370038002E0037
      00380000000000000000000000000000FFFFFFFFFFFFFFFF040000002E000000
      35000000084200690074006D006100700031003600084200690074006D006100
      70003100360000000000094300610064006500740062006C0075006500000000
      0005350035002E003500350000000000000000000000000000FFFFFFFFFFFFFF
      FF040000005B00000067000000084200690074006D0061007000310036000842
      00690074006D006100700031003600000000000A4400610072006B006F007200
      63006800690064000000000005320036002E0032003600000000000000000000
      00000000FFFFFFFFFFFFFFFF040000008800000099000000084200690074006D
      006100700031003600084200690074006D006100700031003600000000000E4C
      00690067006800740073007400650065006C0062006C00750065000000000005
      3100340031002E00340000000000000000000000000000FFFFFFFFFFFFFFFF04
      0000001000000013000000084200690074006D00610070003100370008420069
      0074006D006100700031003700000000000B4E006100760061006A006F007700
      68006900740065000000000005380036002E0038003600000000000000000000
      00000000FFFFFFFFFFFFFFFF040000003C00000045000000084200690074006D
      006100700031003700084200690074006D006100700031003700000000000354
      0061006E000000000005380034002E0038003400000000000000000000000000
      00FFFFFFFFFFFFFFFF040000006A00000077000000084200690074006D006100
      700031003700084200690074006D006100700031003700000000000D44006100
      72006B00740075007200710075006F0069007300650000000000063100330036
      002E003300350000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      96000000A9000000084200690074006D00610070003100370008420069007400
      6D00610070003100370000000000094F00720061006E00670065007200650064
      0000000000063100340035002E003400340000000000000000000000000000FF
      FFFFFFFFFFFFFF040000002900000030000000084200690074006D0061007000
      31003800084200690074006D00610070003100380000000000094C0069006700
      68007400670072006500790000000000063100390037002E0039003600000000
      00000000000000000000FFFFFFFFFFFFFFFF0400000057000000620000000842
      00690074006D006100700031003800084200690074006D006100700031003800
      000000000543006F00720061006C0000000000053100330031002E0033000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000830000009400000008
      4200690074006D006100700031003800084200690074006D0061007000310038
      00000000000E43006F0072006E0066006C006F0077006500720062006C007500
      650000000000063100310032002E003100310000000000000000000000000000
      FFFFFFFFFFFFFFFF04000000B1000000C6000000084200690074006D00610070
      0031003800084200690074006D00610070003100380000000000074F006C0064
      006C006100630065000000000005350033002E00350033000000000000000000
      0000000000FFFFFFFFFFFFFFFF04000000050000000800000008420069007400
      6D006100700031003900084200690074006D0061007000310039000000000004
      42006C00750065000000000004360030002E0036000000000000000000000000
      0000FFFFFFFFFFFFFFFF04000000330000003A000000084200690074006D0061
      00700031003900084200690074006D006100700031003900000000000B440065
      006500700073006B00790062006C00750065000000000005380037002E003800
      370000000000000000000000000000FFFFFFFFFFFFFFFF040000005F0000006C
      000000084200690074006D006100700031003900084200690074006D00610070
      00310039000000000009500061006C00650067007200650065006E0000000000
      05370034002E003700340000000000000000000000000000FFFFFFFFFFFFFFFF
      040000008D0000009E000000084200690074006D006100700031003900084200
      690074006D00610070003100390000000000044E006100760079000000000006
      3100320035002E003200340000000000000000000000000000FFFFFFFFFFFFFF
      FF040000001E00000023000000074200690074006D0061007000320007420069
      0074006D0061007000320000000000074400610072006B007200650064000000
      0000063100370034002E003700330000000000000000000000000000FFFFFFFF
      FFFFFFFF040000004B00000055000000074200690074006D0061007000320007
      4200690074006D00610070003200000000000E4400610072006B006F006C0069
      007600650067007200650065006E000000000005340039002E00340039000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000780000008700000007
      4200690074006D00610070003200074200690074006D00610070003200000000
      000B53006100640064006C006500620072006F0077006E000000000005330033
      002E003300330000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      A5000000B9000000074200690074006D00610070003200074200690074006D00
      610070003200000000000650007500720070006C006500000000000538003300
      2E003800330000000000000000000000000000FFFFFFFFFFFFFFFF0400000017
      0000001C000000084200690074006D006100700032003000084200690074006D
      00610070003200300000000000094F00720061006E0067006500720065006400
      00000000063100340030002E003300390000000000000000000000000000FFFF
      FFFFFFFFFFFF04000000450000004E000000084200690074006D006100700032
      003000084200690074006D006100700032003000000000000C4D006500640069
      0075006D0070007500720070006C0065000000000004370030002E0037000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000710000008000000008
      4200690074006D006100700032003000084200690074006D0061007000320030
      0000000000054C0069006E0065006E0000000000063100320038002E00320037
      0000000000000000000000000000FFFFFFFFFFFFFFFF040000009F000000B200
      0000084200690074006D006100700032003000084200690074006D0061007000
      32003000000000000541007A0075007200650000000000063100330034002E00
      3300330000000000000000000000000000FFFFFFFFFFFFFFFF04000000260000
      002C000000084200690074006D006100700032003100084200690074006D0061
      00700032003100000000000650007500720070006C0065000000000006310038
      0036002E003800350000000000000000000000000000FFFFFFFFFFFFFFFF0400
      0000530000005E000000084200690074006D0061007000320031000842006900
      74006D0061007000320031000000000003520065006400000000000631003600
      35002E003600340000000000000000000000000000FFFFFFFFFFFFFFFF040000
      008000000090000000084200690074006D006100700032003100084200690074
      006D00610070003200310000000000104D0065006400690075006D0061007100
      750061006D006100720069006E00650000000000063100380030002E00370039
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000AD000000C200
      0000084200690074006D006100700032003100084200690074006D0061007000
      3200310000000000094300610064006500740062006C00750065000000000005
      340034002E003400340000000000000000000000000000FFFFFFFFFFFFFFFF04
      000000070000000A000000084200690074006D00610070003200320008420069
      0074006D006100700032003200000000000A50006F0077006400650072006200
      6C00750065000000000005310035002E00310035000000000000000000000000
      0000FFFFFFFFFFFFFFFF04000000350000003C000000084200690074006D0061
      00700032003200084200690074006D006100700032003200000000000A42006C
      0075006500760069006F006C006500740000000000063100380039002E003800
      380000000000000000000000000000FFFFFFFFFFFFFFFF04000000610000006E
      000000084200690074006D006100700032003200084200690074006D00610070
      0032003200000000000D500061006C006500740075007200710075006F006900
      730065000000000004390030002E00390000000000000000000000000000FFFF
      FFFFFFFFFFFF040000008F000000A0000000084200690074006D006100700032
      003200084200690074006D006100700032003200000000000B4E006100760061
      006A006F00770068006900740065000000000005370035002E00370035000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000250000002B00000008
      4200690074006D006100700032003300084200690074006D0061007000320033
      00000000000748006F007400700069006E006B0000000000063100360038002E
      003600370000000000000000000000000000FFFFFFFFFFFFFFFF040000005200
      00005D000000084200690074006D006100700032003300084200690074006D00
      6100700032003300000000000A4C00690067006800740067007200650065006E
      000000000005310038002E003100380000000000000000000000000000FFFFFF
      FFFFFFFFFF040000007F0000008F000000084200690074006D00610070003200
      3300084200690074006D0061007000320033000000000005490076006F007200
      790000000000063100360033002E003600320000000000000000000000000000
      FFFFFFFFFFFFFFFF04000000AC000000C1000000084200690074006D00610070
      0032003300084200690074006D00610070003200330000000000094200750072
      006C00790077006F006F00640000000000063100340033002E00340032000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000240000002A00000008
      4200690074006D006100700032003400084200690074006D0061007000320034
      00000000000A4C00690067006800740063006F00720061006C00000000000631
      00310037002E003100360000000000000000000000000000FFFFFFFFFFFFFFFF
      04000000510000005C000000084200690074006D006100700032003400084200
      690074006D00610070003200340000000000094D00690073007400790072006F
      007300650000000000063100380038002E003800370000000000000000000000
      000000FFFFFFFFFFFFFFFF040000007E0000008E000000084200690074006D00
      6100700032003400084200690074006D006100700032003400000000000D4400
      610072006B0067006F006C00640065006E0072006F0064000000000005340037
      002E003400370000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      AB000000C0000000084200690074006D00610070003200340008420069007400
      6D006100700032003400000000000447006F006C006400000000000631003800
      35002E003800340000000000000000000000000000FFFFFFFFFFFFFFFF040000
      000600000009000000084200690074006D006100700032003500084200690074
      006D006100700032003500000000000B47007200650065006E00790065006C00
      6C006F0077000000000005370031002E00370031000000000000000000000000
      0000FFFFFFFFFFFFFFFF04000000340000003B000000084200690074006D0061
      00700032003500084200690074006D0061007000320035000000000009470061
      0069006E00730062006F0072006F0000000000063100390034002E0039003300
      00000000000000000000000000FFFFFFFFFFFFFFFF04000000600000006D0000
      00084200690074006D006100700032003500084200690074006D006100700032
      003500000000000A4400610072006B00760069006F006C006500740000000000
      053100350031002E00350000000000000000000000000000FFFFFFFFFFFFFFFF
      040000008E0000009F000000084200690074006D006100700032003500084200
      690074006D006100700032003500000000000F4D0065006400690075006D0073
      006C0061007400650062006C00750065000000000005330032002E0033003200
      00000000000000000000000000FFFFFFFFFFFFFFFF04000000280000002E0000
      00084200690074006D006100700032003600084200690074006D006100700032
      003600000000000B46006F00720065007300740067007200650065006E000000
      000005370036002E003700360000000000000000000000000000FFFFFFFFFFFF
      FFFF040000005500000060000000084200690074006D00610070003200360008
      4200690074006D0061007000320036000000000009540075007200710075006F
      006900730065000000000005390037002E003900370000000000000000000000
      000000FFFFFFFFFFFFFFFF040000008200000092000000084200690074006D00
      6100700032003600084200690074006D006100700032003600000000000A4700
      68006F00730074007700680069007400650000000000063100340037002E0034
      00360000000000000000000000000000FFFFFFFFFFFFFFFF04000000AF000000
      C4000000084200690074006D006100700032003600084200690074006D006100
      700032003600000000000447007200650079000000000005330039002E003300
      390000000000000000000000000000FFFFFFFFFFFFFFFF040000002300000028
      000000084200690074006D006100700032003700084200690074006D00610070
      0032003700000000000C4D0065006400690075006D006F007200630068006900
      640000000000063100300033002E003000320000000000000000000000000000
      FFFFFFFFFFFFFFFF040000004F0000005A000000084200690074006D00610070
      0032003700084200690074006D006100700032003700000000000453006E006F
      00770000000000063100310035002E0031003400000000000000000000000000
      00FFFFFFFFFFFFFFFF040000007D0000008C000000084200690074006D006100
      700032003700084200690074006D006100700032003700000000000649006E00
      6400690067006F000000000005310039002E0031003900000000000000000000
      00000000FFFFFFFFFFFFFFFF04000000A9000000BE000000084200690074006D
      006100700032003700084200690074006D00610070003200370000000000084C
      006100760065006E006400650072000000000005370032002E00370032000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000000000000100000008
      4200690074006D006100700032003800084200690074006D0061007000320038
      00000000000D4400610072006B0067006F006C00640065006E0072006F006400
      0000000005360037002E003600370000000000000000000000000000FFFFFFFF
      FFFFFFFF040000002C00000033000000084200690074006D0061007000320038
      00084200690074006D006100700032003800000000000447006F006C00640000
      000000063100360036002E003600350000000000000000000000000000FFFFFF
      FFFFFFFFFF040000005A00000065000000084200690074006D00610070003200
      3800084200690074006D006100700032003800000000000E4C00690067006800
      740073006C0061007400650067007200650079000000000005330036002E0033
      00360000000000000000000000000000FFFFFFFFFFFFFFFF0400000086000000
      97000000084200690074006D006100700032003800084200690074006D006100
      700032003800000000000A50006F00770064006500720062006C007500650000
      00000004310030002E00310000000000000000000000000000FFFFFFFFFFFFFF
      FF040000000A0000000D000000084200690074006D0061007000320039000842
      00690074006D006100700032003900000000000E4D0065006400690075006D00
      73006500610067007200650065006E0000000000063100340032002E00340031
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000370000003F00
      0000084200690074006D006100700032003900084200690074006D0061007000
      320039000000000004500069006E006B000000000005360034002E0036003400
      00000000000000000000000000FFFFFFFFFFFFFFFF0400000064000000710000
      00084200690074006D006100700032003900084200690074006D006100700032
      003900000000000A4400610072006B00730061006C006D006F006E0000000000
      063100330039002E003300380000000000000000000000000000FFFFFFFFFFFF
      FFFF0400000091000000A3000000084200690074006D00610070003200390008
      4200690074006D006100700032003900000000000C4400610072006B00730065
      00610067007200650065006E0000000000063100320033002E00320032000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000120000001600000007
      4200690074006D00610070003300074200690074006D00610070003300000000
      000C4400610072006B0073006500610067007200650065006E00000000000531
      0032002E003100320000000000000000000000000000FFFFFFFFFFFFFFFF0400
      00003F00000048000000074200690074006D0061007000330007420069007400
      6D00610070003300000000000A5700680069007400650073006D006F006B0065
      0000000000063100370037002E003700360000000000000000000000000000FF
      FFFFFFFFFFFFFF040000006C0000007A000000074200690074006D0061007000
      3300074200690074006D0061007000330000000000044300790061006E000000
      0000063100370036002E003700350000000000000000000000000000FFFFFFFF
      FFFFFFFF0400000099000000AC000000074200690074006D0061007000330007
      4200690074006D00610070003300000000000853006500610067007200650065
      006E0000000000063100370033002E0037003200000000000000000000000000
      00FFFFFFFFFFFFFFFF040000002000000025000000084200690074006D006100
      700033003000084200690074006D006100700033003000000000000541007A00
      75007200650000000000063100320036002E0032003500000000000000000000
      00000000FFFFFFFFFFFFFFFF040000004D00000057000000084200690074006D
      006100700033003000084200690074006D00610070003300300000000000054F
      006C0069007600650000000000063100360034002E0036003300000000000000
      00000000000000FFFFFFFFFFFFFFFF040000007A000000890000000842006900
      74006D006100700033003000084200690074006D006100700033003000000000
      000B4C006900670068007400790065006C006C006F0077000000000005390031
      002E003900310000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      A7000000BB000000084200690074006D00610070003300300008420069007400
      6D006100700033003000000000000B46006F0072006500730074006700720065
      0065006E000000000004340030002E00340000000000000000000000000000FF
      FFFFFFFFFFFFFF040000002400000029000000084200690074006D0061007000
      33003100084200690074006D0061007000330031000000000009440061007200
      6B006B00680061006B00690000000000053100360031002E0036000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000500000005B00000008420069
      0074006D006100700033003100084200690074006D0061007000330031000000
      0000064F00720063006800690064000000000005360035002E00360035000000
      0000000000000000000000FFFFFFFFFFFFFFFF040000007E0000008D00000008
      4200690074006D006100700033003100084200690074006D0061007000330031
      0000000000094400610072006B0067007200650065006E00000000000436002E
      003000360000000000000000000000000000FFFFFFFFFFFFFFFF04000000AA00
      0000BF000000084200690074006D006100700033003100084200690074006D00
      610070003300310000000000065300690065006E006E00610000000000043900
      2E003000390000000000000000000000000000FFFFFFFFFFFFFFFF0400000012
      00000015000000084200690074006D006100700033003200084200690074006D
      006100700033003200000000000753006B00790062006C007500650000000000
      063100370038002E003700370000000000000000000000000000FFFFFFFFFFFF
      FFFF040000003E00000047000000084200690074006D00610070003300320008
      4200690074006D00610070003300320000000000094C00690067006800740063
      00790061006E0000000000053100390031002E00390000000000000000000000
      000000FFFFFFFFFFFFFFFF040000006C00000079000000084200690074006D00
      6100700033003200084200690074006D006100700033003200000000000A4400
      610072006B006F00720061006E006700650000000000053100310031002E0031
      0000000000000000000000000000FFFFFFFFFFFFFFFF0400000098000000AB00
      0000084200690074006D006100700033003200084200690074006D0061007000
      33003200000000000F4D0065006400690075006D00740075007200710075006F
      0069007300650000000000063100390030002E00380039000000000000000000
      0000000000FFFFFFFFFFFFFFFF04000000110000001400000008420069007400
      6D006100700033003300084200690074006D006100700033003300000000000A
      430068006100720074007200650075007300650000000000063100390033002E
      003900320000000000000000000000000000FFFFFFFFFFFFFFFF040000003D00
      000046000000084200690074006D006100700033003300084200690074006D00
      6100700033003300000000000D4C006900670068007400730065006100670072
      00650065006E000000000005390039002E003900390000000000000000000000
      000000FFFFFFFFFFFFFFFF040000006B00000078000000084200690074006D00
      6100700033003300084200690074006D006100700033003300000000000C4C00
      65006D006F006E00630068006900660066006F006E0000000000063100330033
      002E003300320000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      97000000AA000000084200690074006D00610070003300330008420069007400
      6D006100700033003300000000000A44006F00640067006500720062006C0075
      006500000000000433002E003000330000000000000000000000000000FFFFFF
      FFFFFFFFFF040000001D00000022000000084200690074006D00610070003300
      3400084200690074006D006100700033003400000000000A4D006F006E006500
      790047007200650065006E0000000000063100330037002E0033003600000000
      00000000000000000000FFFFFFFFFFFFFFFF040000004A000000540000000842
      00690074006D006100700033003400084200690074006D006100700033003400
      000000000953006C006100740065006700720065007900000000000532003800
      2E003200380000000000000000000000000000FFFFFFFFFFFFFFFF0400000077
      00000086000000084200690074006D006100700033003400084200690074006D
      006100700033003400000000000952006F0073007900620072006F0077006E00
      00000000063100300037002E003000360000000000000000000000000000FFFF
      FFFFFFFFFFFF04000000A4000000B8000000084200690074006D006100700033
      003400084200690074006D006100700033003400000000000748006F00740070
      0069006E006B000000000005380038002E003800380000000000000000000000
      000000FFFFFFFFFFFFFFFF040000000E00000011000000084200690074006D00
      6100700033003500084200690074006D00610070003300350000000000044E00
      6100760079000000000005370033002E00370033000000000000000000000000
      0000FFFFFFFFFFFFFFFF040000003B00000043000000084200690074006D0061
      00700033003500084200690074006D006100700033003500000000000843006F
      0072006E00730069006C006B000000000005350038002E003500380000000000
      000000000000000000FFFFFFFFFFFFFFFF040000006800000075000000084200
      690074006D006100700033003500084200690074006D00610070003300350000
      0000000950006500610063006800700075006600660000000000013000000000
      00000000000000000000FFFFFFFFFFFFFFFF0400000095000000A70000000842
      00690074006D006100700033003500084200690074006D006100700033003500
      000000000953006C0061007400650062006C0075006500000000000533003800
      2E003300380000000000000000000000000000FFFFFFFFFFFFFFFF0400000009
      0000000C000000084200690074006D006100700033003600084200690074006D
      006100700033003600000000000E4C0069006700680074007300740065006500
      6C0062006C007500650000000000063100360039002E00360038000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000360000003E00000008420069
      0074006D006100700033003600084200690074006D0061007000330036000000
      0000094D0069006E00740063007200650061006D000000000006310033003500
      2E003300340000000000000000000000000000FFFFFFFFFFFFFFFF0400000063
      00000070000000084200690074006D006100700033003600084200690074006D
      0061007000330036000000000005420065006900670065000000000006310038
      0034002E003800330000000000000000000000000000FFFFFFFFFFFFFFFF0400
      000090000000A2000000084200690074006D0061007000330036000842006900
      74006D006100700033003600000000000753006B00790062006C007500650000
      000000063100370030002E003600390000000000000000000000000000FFFFFF
      FFFFFFFFFF04000000190000001E000000084200690074006D00610070003300
      3700084200690074006D006100700033003700000000000F4D00650064006900
      75006D00740075007200710075006F00690073006500000000000435002E0030
      00350000000000000000000000000000FFFFFFFFFFFFFFFF0400000047000000
      50000000084200690074006D006100700033003700084200690074006D006100
      70003300370000000000074D006100670065006E007400610000000000063100
      390036002E003900350000000000000000000000000000FFFFFFFFFFFFFFFF04
      0000007300000082000000084200690074006D00610070003300370008420069
      0074006D0061007000330037000000000006590065006C006C006F0077000000
      0000063100390039002E003900380000000000000000000000000000FFFFFFFF
      FFFFFFFF04000000A1000000B4000000084200690074006D0061007000330037
      00084200690074006D00610070003300370000000000084400610072006B0062
      006C007500650000000000063100300038002E00300037000000000000000000
      0000000000FFFFFFFFFFFFFFFF040000002B0000003200000008420069007400
      6D006100700033003800084200690074006D0061007000330038000000000006
      5300690065006E006E00610000000000063100320032002E0032003100000000
      00000000000000000000FFFFFFFFFFFFFFFF0400000059000000640000000842
      00690074006D006100700033003800084200690074006D006100700033003800
      000000000E42006C0061006E00630068006500640061006C006D006F006E0064
      0000000000063100340034002E003400330000000000000000000000000000FF
      FFFFFFFFFFFFFF040000008500000096000000084200690074006D0061007000
      33003800084200690074006D006100700033003800000000000B470072006500
      65006E00790065006C006C006F0077000000000005360036002E003600360000
      000000000000000000000000FFFFFFFFFFFFFFFF04000000B3000000C8000000
      084200690074006D006100700033003800084200690074006D00610070003300
      380000000000094700610069006E00730062006F0072006F0000000000053400
      36002E003400360000000000000000000000000000FFFFFFFFFFFFFFFF040000
      00170000001B000000084200690074006D006100700033003900084200690074
      006D00610070003300390000000000094C00610077006E006700720065006500
      6E000000000005320032002E003200320000000000000000000000000000FFFF
      FFFFFFFFFFFF04000000440000004D000000084200690074006D006100700033
      003900084200690074006D00610070003300390000000000045400650061006C
      000000000005350032002E003500320000000000000000000000000000FFFFFF
      FFFFFFFFFF04000000710000007F000000084200690074006D00610070003300
      3900084200690074006D00610070003300390000000000045000650072007500
      0000000005360039002E003600390000000000000000000000000000FFFFFFFF
      FFFFFFFF040000009E000000B1000000084200690074006D0061007000330039
      00084200690074006D006100700033003900000000000B46006C006F00720061
      006C007700680069007400650000000000063100350034002E00350033000000
      0000000000000000000000FFFFFFFFFFFFFFFF04000000210000002600000007
      4200690074006D00610070003400074200690074006D00610070003400000000
      00064200690073007100750065000000000005310036002E0031003600000000
      00000000000000000000FFFFFFFFFFFFFFFF040000004D000000580000000742
      00690074006D00610070003400074200690074006D0061007000340000000000
      0547007200650065006E000000000005390038002E0039003800000000000000
      00000000000000FFFFFFFFFFFFFFFF040000007B0000008A0000000742006900
      74006D00610070003400074200690074006D0061007000340000000000095200
      6F00790061006C0062006C007500650000000000063100310038002E00310037
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000A7000000BC00
      0000074200690074006D00610070003400074200690074006D00610070003400
      00000000044C0069006D00650000000000063100300034002E00300033000000
      0000000000000000000000FFFFFFFFFFFFFFFF040000000C0000000F00000008
      4200690074006D006100700034003000084200690074006D0061007000340030
      00000000000450006C0075006D000000000004380030002E0038000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000390000004100000008420069
      0074006D006100700034003000084200690074006D0061007000340030000000
      00000654006F006D00610074006F00000000000431002E003000310000000000
      000000000000000000FFFFFFFFFFFFFFFF040000006600000073000000084200
      690074006D006100700034003000084200690074006D00610070003400300000
      0000000B590065006C006C006F00770067007200650065006E00000000000631
      00350039002E003500380000000000000000000000000000FFFFFFFFFFFFFFFF
      0400000093000000A5000000084200690074006D006100700034003000084200
      690074006D0061007000340030000000000006530061006C006D006F006E0000
      00000005310031002E003100310000000000000000000000000000FFFFFFFFFF
      FFFFFF040000000300000005000000084200690074006D006100700034003100
      084200690074006D006100700034003100000000000A470068006F0073007400
      770068006900740065000000000005330037002E003300370000000000000000
      000000000000FFFFFFFFFFFFFFFF040000003000000037000000084200690074
      006D006100700034003100084200690074006D00610070003400310000000000
      0447007200650079000000000005330034002E00330034000000000000000000
      0000000000FFFFFFFFFFFFFFFF040000005D0000006900000008420069007400
      6D006100700034003100084200690074006D0061007000340031000000000009
      460069007200650062007200690063006B000000000004350030002E00350000
      000000000000000000000000FFFFFFFFFFFFFFFF040000008A0000009B000000
      084200690074006D006100700034003100084200690074006D00610070003400
      310000000000064C00740047007200610079000000000005360032002E003600
      320000000000000000000000000000FFFFFFFFFFFFFFFF040000001300000017
      000000084200690074006D006100700034003200084200690074006D00610070
      0034003200000000000947006F006C00640065006E0072006F00640000000000
      05390036002E003900360000000000000000000000000000FFFFFFFFFFFFFFFF
      040000004000000049000000084200690074006D006100700034003200084200
      690074006D006100700034003200000000000C4C00690067006800740073006B
      00790062006C00750065000000000005350037002E0035003700000000000000
      00000000000000FFFFFFFFFFFFFFFF040000006D0000007B0000000842006900
      74006D006100700034003200084200690074006D006100700034003200000000
      000C41006E007400690071007500650077006800690074006500000000000631
      00380037002E003800360000000000000000000000000000FFFFFFFFFFFFFFFF
      040000009A000000AD000000084200690074006D006100700034003200084200
      690074006D006100700034003200000000000D4C006100760065006E00640065
      00720062006C007500730068000000000005350036002E003500360000000000
      000000000000000000FFFFFFFFFFFFFFFF040000000400000006000000084200
      690074006D006100700034003300084200690074006D00610070003400330000
      0000000A530061006E0064007900620072006F0077006E000000000005340031
      002E003400310000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      3100000038000000084200690074006D00610070003400330008420069007400
      6D0061007000340033000000000007440069006D006700720065007900000000
      0005320035002E003200350000000000000000000000000000FFFFFFFFFFFFFF
      FF040000005E0000006A000000084200690074006D0061007000340033000842
      00690074006D006100700034003300000000000D4C0065006700610063007900
      53006B00790042006C007500650000000000063100300039002E003000380000
      000000000000000000000000FFFFFFFFFFFFFFFF040000008B0000009C000000
      084200690074006D006100700034003300084200690074006D00610070003400
      3300000000000450006C0075006D0000000000063100320039002E0032003800
      00000000000000000000000000FFFFFFFFFFFFFFFF04000000080000000B0000
      00084200690074006D006100700034003400084200690074006D006100700034
      00340000000000144C00690067006800740067006F006C00640065006E007200
      6F006400790065006C006C006F00770000000000063100370035002E00370034
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000360000003D00
      0000084200690074006D006100700034003400084200690074006D0061007000
      34003400000000000A4D0065006400690075006D0062006C0075006500000000
      0005360038002E003600380000000000000000000000000000FFFFFFFFFFFFFF
      FF04000000620000006F000000084200690074006D0061007000340034000842
      00690074006D00610070003400340000000000064F00720061006E0067006500
      00000000063100340036002E003400350000000000000000000000000000FFFF
      FFFFFFFFFFFF0400000090000000A1000000084200690074006D006100700034
      003400084200690074006D006100700034003400000000000A43006800610072
      0074007200650075007300650000000000063100320037002E00320036000000
      0000000000000000000000FFFFFFFFFFFFFFFF040000001B0000002000000008
      4200690074006D006100700034003500084200690074006D0061007000340035
      00000000000D4C006100760065006E0064006500720062006C00750073006800
      00000000063100390032002E003900310000000000000000000000000000FFFF
      FFFFFFFFFFFF040000004800000052000000084200690074006D006100700034
      003500084200690074006D00610070003400350000000000094C006900670068
      007400700069006E006B000000000005380032002E0038003200000000000000
      00000000000000FFFFFFFFFFFFFFFF0400000075000000840000000842006900
      74006D006100700034003500084200690074006D006100700034003500000000
      00084400650065007000700069006E006B0000000000063100340038002E0034
      00370000000000000000000000000000FFFFFFFFFFFFFFFF04000000A2000000
      B6000000084200690074006D006100700034003500084200690074006D006100
      70003400350000000000094400610072006B006B00680061006B006900000000
      00063100300035002E003000340000000000000000000000000000FFFFFFFFFF
      FFFFFF040000000000000002000000084200690074006D006100700034003600
      084200690074006D0061007000340036000000000005490076006F0072007900
      0000000005370039002E003700390000000000000000000000000000FFFFFFFF
      FFFFFFFF040000002D00000034000000084200690074006D0061007000340036
      00084200690074006D00610070003400360000000000094200750072006C0079
      0077006F006F006400000000000437002E003000370000000000000000000000
      000000FFFFFFFFFFFFFFFF040000005A00000066000000084200690074006D00
      6100700034003600084200690074006D006100700034003600000000000D4400
      610072006B0073006C0061007400650062006C00750065000000000006310035
      0035002E003500340000000000000000000000000000FFFFFFFFFFFFFFFF0400
      00008700000098000000084200690074006D0061007000340036000842006900
      74006D00610070003400360000000000144C00690067006800740067006F006C
      00640065006E0072006F006400790065006C006C006F00770000000000053800
      39002E003800390000000000000000000000000000FFFFFFFFFFFFFFFF040000
      000500000007000000084200690074006D006100700034003700084200690074
      006D006100700034003700000000000E43006F0072006E0066006C006F007700
      6500720062006C00750065000000000005340033002E00340033000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000320000003900000008420069
      0074006D006100700034003700084200690074006D0061007000340037000000
      0000074F006C0064006C006100630065000000000005310037002E0031003700
      00000000000000000000000000FFFFFFFFFFFFFFFF040000005F0000006B0000
      00084200690074006D006100700034003700084200690074006D006100700034
      003700000000000542006C00610063006B000000000005390033002E00390033
      0000000000000000000000000000FFFFFFFFFFFFFFFF040000008C0000009D00
      0000084200690074006D006100700034003700084200690074006D0061007000
      34003700000000000953007400650065006C0062006C00750065000000000005
      330035002E003300350000000000000000000000000000FFFFFFFFFFFFFFFF04
      0000001500000019000000084200690074006D00610070003400380008420069
      0074006D0061007000340038000000000007540068006900730074006C006500
      00000000063100350030002E003400390000000000000000000000000000FFFF
      FFFFFFFFFFFF04000000420000004B000000084200690074006D006100700034
      003800084200690074006D006100700034003800000000000C4D00690064006E
      00690067006800740062006C007500650000000000063100330030002E003200
      390000000000000000000000000000FFFFFFFFFFFFFFFF040000006F0000007D
      000000084200690074006D006100700034003800084200690074006D00610070
      003400380000000000084400610072006B006700720065007900000000000536
      0031002E003600310000000000000000000000000000FFFFFFFFFFFFFFFF0400
      00009C000000AF000000084200690074006D0061007000340038000842006900
      74006D006100700034003800000000000A4D006F006E00650079004700720065
      0065006E000000000005320034002E0032003400000000000000000000000000
      00FFFFFFFFFFFFFFFF04000000270000002D000000084200690074006D006100
      700034003900084200690074006D00610070003400390000000000114D006500
      6400690075006D0073007000720069006E00670067007200650065006E000000
      00000332003000320000000000000000000000000000FFFFFFFFFFFFFFFF0400
      0000540000005F000000084200690074006D0061007000340039000842006900
      74006D00610070003400390000000000084D006F00630063006100730069006E
      0000000000063100330032002E003300310000000000000000000000000000FF
      FFFFFFFFFFFFFF040000008100000091000000084200690074006D0061007000
      34003900084200690074006D006100700034003900000000000F4D0065006400
      690075006D00760069006F006C00650074007200650064000000000004330030
      002E00330000000000000000000000000000FFFFFFFFFFFFFFFF04000000AE00
      0000C3000000084200690074006D006100700034003900084200690074006D00
      6100700034003900000000000557006800650061007400000000000539003400
      2E003900340000000000000000000000000000FFFFFFFFFFFFFFFF040000001F
      00000024000000074200690074006D00610070003500074200690074006D0061
      0070003500000000000B46006C006F00720061006C0077006800690074006500
      00000000063100360037002E003600360000000000000000000000000000FFFF
      FFFFFFFFFFFF040000004C00000056000000074200690074006D006100700035
      00074200690074006D00610070003500000000000B4C00690067006800740073
      0061006C006D006F006E000000000005310033002E0031003300000000000000
      00000000000000FFFFFFFFFFFFFFFF0400000079000000880000000742006900
      74006D00610070003500074200690074006D0061007000350000000000094F00
      6C00690076006500640072006100620000000000063100350032002E00350031
      0000000000000000000000000000FFFFFFFFFFFFFFFF04000000A6000000BA00
      0000074200690074006D00610070003500074200690074006D00610070003500
      00000000114D0065006400690075006D0073007000720069006E006700670072
      00650065006E0000000000063100370039002E00370038000000000000000000
      0000000000FFFFFFFFFFFFFFFF040000002A0000003100000008420069007400
      6D006100700035003000084200690074006D0061007000350030000000000008
      4C006100760065006E0064006500720000000000053100380031002E00380000
      000000000000000000000000FFFFFFFFFFFFFFFF040000005800000063000000
      084200690074006D006100700035003000084200690074006D00610070003500
      300000000000094C00690067006800740062006C007500650000000000053100
      34002E003100340000000000000000000000000000FFFFFFFFFFFFFFFF040000
      008400000095000000084200690074006D006100700035003000084200690074
      006D006100700035003000000000000442006C00750065000000000006310032
      0030002E003100390000000000000000000000000000FFFFFFFFFFFFFFFF0400
      0000B2000000C7000000084200690074006D0061007000350030000842006900
      74006D006100700035003000000000000B440065006500700073006B00790062
      006C007500650000000000063100370032002E00370031000000000000000000
      0000000000FFFFFFFFFFFFFFFF04000000140000001800000007420069007400
      6D00610070003600074200690074006D00610070003600000000000653006100
      6C006D006F006E0000000000053100370031002E003700000000000000000000
      00000000FFFFFFFFFFFFFFFF04000000410000004A000000074200690074006D
      00610070003600074200690074006D00610070003600000000000A5000610070
      0061007900610077006800690070000000000005320037002E00320037000000
      0000000000000000000000FFFFFFFFFFFFFFFF040000006E0000007C00000007
      4200690074006D00610070003600074200690074006D00610070003600000000
      000B4400610072006B006D006100670065006E00740061000000000005340032
      002E003400320000000000000000000000000000FFFFFFFFFFFFFFFF04000000
      9B000000AE000000074200690074006D00610070003600074200690074006D00
      61007000360000000000084400610072006B006300790061006E000000000006
      3100300036002E003000350000000000000000000000000000FFFFFFFFFFFFFF
      FF040000002200000027000000074200690074006D0061007000370007420069
      0074006D0061007000370000000000084400610072006B0062006C0075006500
      0000000005350039002E003500390000000000000000000000000000FFFFFFFF
      FFFFFFFF040000004E00000059000000074200690074006D0061007000370007
      4200690074006D0061007000370000000000074300720069006D0073006F006E
      000000000005390032002E003900320000000000000000000000000000FFFFFF
      FFFFFFFFFF040000007C0000008B000000074200690074006D00610070003700
      074200690074006D00610070003700000000000D500061006C00650076006900
      6F006C00650074007200650064000000000005390035002E0039003500000000
      00000000000000000000FFFFFFFFFFFFFFFF04000000A8000000BD0000000742
      00690074006D00610070003700074200690074006D0061007000370000000000
      094C00690067006800740067007200650079000000000005380035002E003800
      350000000000000000000000000000FFFFFFFFFFFFFFFF040000000D00000010
      000000074200690074006D00610070003800074200690074006D006100700038
      00000000000953007400650065006C0062006C0075006500000000000434002E
      003000340000000000000000000000000000FFFFFFFFFFFFFFFF040000003A00
      000042000000074200690074006D00610070003800074200690074006D006100
      7000380000000000064D00610072006F006F006E000000000006310031003600
      2E003100350000000000000000000000000000FFFFFFFFFFFFFFFF0400000067
      00000074000000074200690074006D00610070003800074200690074006D0061
      0070003800000000000D4400610072006B0073006C0061007400650067007200
      650079000000000005340038002E003400380000000000000000000000000000
      FFFFFFFFFFFFFFFF0400000094000000A6000000074200690074006D00610070
      003800074200690074006D006100700038000000000007540068006900730074
      006C00650000000000063100300032002E003000310000000000000000000000
      000000FFFFFFFFFFFFFFFF04000000160000001A000000074200690074006D00
      610070003900074200690074006D00610070003900000000000953006C006100
      7400650062006C00750065000000000005320039002E00320039000000000000
      0000000000000000FFFFFFFFFFFFFFFF04000000430000004C00000007420069
      0074006D00610070003900074200690074006D00610070003900000000000D50
      0061006C00650067006F006C00640065006E0072006F00640000000000053600
      33002E003600330000000000000000000000000000FFFFFFFFFFFFFFFF040000
      00700000007E000000074200690074006D00610070003900074200690074006D
      00610070003900000000000543007200650061006D0000000000053100320031
      002E00320000000000000000000000000000FFFFFFFFFFFFFFFF040000009D00
      0000B0000000074200690074006D00610070003900074200690074006D006100
      7000390000000000074400610072006B00720065006400000000000631003200
      34002E0032003300000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    GroupView = True
    SortType = stBoth
    TabOrder = 0
    ViewStyle = vsReport
    ExplicitLeft = -6
  end
  object PrototypeBindSource1: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'FirstName'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'LastName'
        Generator = 'BitmapNames'
        ReadOnly = False
      end
      item
        Name = 'Office'
        Generator = 'ContactTitles'
        ReadOnly = False
      end
      item
        Name = 'Salary'
        FieldType = ftCurrency
        Generator = 'Currency'
        ReadOnly = False
      end
      item
        Name = 'Team'
        Generator = 'ColorsNames'
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = PrototypeBindSource1CreateAdapter
    Left = 464
    Top = 120
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 468
    Top = 181
    object LinkFillControlToField1: TLinkFillControlToField
      Category = 'Quick Bindings'
      Control = ListView1
      Track = True
      FillDataSource = PrototypeBindSource1
      FillDisplayFieldName = 'FirstName'
      AutoFill = True
      FillExpressions = <
        item
          SourceMemberName = 'LastName'
          ControlMemberName = 'SubItems[0]'
        end
        item
          SourceMemberName = 'Team'
          ControlMemberName = 'SubItems[1]'
        end
        item
          SourceMemberName = 'Salary'
          ControlMemberName = 'SubItems[2]'
        end>
      FillHeaderExpressions = <>
      FillHeaderFieldName = 'Office'
      FillBreakGroups = <>
    end
  end
end
