object Form259: TForm259
  Left = 0
  Top = 0
  Caption = 'Form259'
  ClientHeight = 539
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    811
    539)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 86
    Top = 39
    Width = 47
    Height = 13
    Caption = 'FileName:'
  end
  object LabelFileName: TLabel
    Left = 152
    Top = 39
    Width = 68
    Height = 13
    Caption = 'LabelFileName'
  end
  object NavigatorAdapterBindSource1: TBindNavigator
    Left = 8
    Top = 222
    Width = 240
    Height = 25
    DataSource = AdapterBindSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
    Orientation = orHorizontal
    TabOrder = 0
  end
  object LabeledEditFirstName: TLabeledEdit
    Left = 13
    Top = 107
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'FirstName'
    TabOrder = 1
  end
  object LabeledEditLastName: TLabeledEdit
    Left = 13
    Top = 155
    Width = 121
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'LastName'
    TabOrder = 2
  end
  object LabeledEditAddress1: TLabeledEdit
    Left = 13
    Top = 195
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Address1'
    TabOrder = 3
  end
  object LabeledEditAddress2: TLabeledEdit
    Left = 197
    Top = 107
    Width = 121
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Address2'
    TabOrder = 4
  end
  object LabeledEditState: TLabeledEdit
    Left = 197
    Top = 155
    Width = 121
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'State'
    TabOrder = 5
  end
  object LabeledEditZip: TLabeledEdit
    Left = 197
    Top = 195
    Width = 121
    Height = 21
    EditLabel.Width = 14
    EditLabel.Height = 13
    EditLabel.Caption = 'Zip'
    TabOrder = 6
  end
  object LabeledEditID: TLabeledEdit
    Left = 371
    Top = 195
    Width = 121
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 7
  end
  object StringGridAdapterBindSource1: TStringGrid
    Tag = 7
    Left = 8
    Top = 253
    Width = 784
    Height = 196
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 8
    ColWidths = (
      100
      100
      100
      100
      100
      100
      100)
  end
  object ButtonLoad: TButton
    Left = 86
    Top = 8
    Width = 91
    Height = 25
    Caption = 'ButtonLoad'
    TabOrder = 9
    OnClick = ButtonLoadClick
  end
  object Button1: TButton
    Left = 279
    Top = 8
    Width = 91
    Height = 25
    Caption = 'ButtonSave'
    TabOrder = 10
    OnClick = Button1Click
  end
  object ButtonSaveAs: TButton
    Left = 376
    Top = 8
    Width = 91
    Height = 25
    Caption = 'ButtonSaveAs'
    TabOrder = 11
    OnClick = ButtonSaveAsClick
  end
  object ButtonLoadFrom: TButton
    Left = 183
    Top = 8
    Width = 91
    Height = 25
    Caption = 'ButtonLoadFrom'
    TabOrder = 12
    OnClick = ButtonLoadFromClick
  end
  object CheckBoxActive: TCheckBox
    Left = 241
    Top = 60
    Width = 97
    Height = 17
    Caption = 'CheckBoxActive'
    TabOrder = 13
    OnClick = CheckBoxActiveClick
  end
  object CheckBoxAutoLoad: TCheckBox
    Left = 371
    Top = 60
    Width = 136
    Height = 17
    Caption = 'CheckBoxAutoLoad'
    TabOrder = 14
    OnClick = CheckBoxAutoLoadClick
  end
  object ButtonClear: TButton
    Left = 472
    Top = 8
    Width = 91
    Height = 25
    Caption = 'ButtonClear'
    TabOrder = 15
    OnClick = ButtonClearClick
  end
  object CheckBoxAutoEdit: TCheckBox
    Left = 371
    Top = 93
    Width = 155
    Height = 17
    Caption = 'CheckBoxAutoEdit'
    TabOrder = 16
    OnClick = CheckBoxAutoEditClick
  end
  object ButtonChangeName: TButton
    Left = 8
    Top = 472
    Width = 169
    Height = 25
    Caption = 'ButtonChangeNamesInList'
    TabOrder = 17
    OnClick = ButtonChangeNameClick
  end
  object ButtonChangeNamesInFields: TButton
    Left = 208
    Top = 472
    Width = 162
    Height = 25
    Caption = 'ButtonChangeNamesInFields'
    TabOrder = 18
    OnClick = ButtonChangeNamesInFieldsClick
  end
  object ContactsAdapter1: TContactsAdapter
    Options = [loptAllowInsert, loptAllowDelete, loptAllowModify]
    FileName = 'c:\temp\customers.xml'
    AutoLoad = True
    Active = False
    BeforeOpen = ContactsAdapter1BeforeOpen
    Left = 688
    Top = 144
  end
  object AdapterBindSource1: TAdapterBindSource
    AutoActivate = True
    Adapter = ContactsAdapter1
    ScopeMappings = <>
    Left = 573
    Top = 147
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 20
    Top = 5
    object LinkControlToField2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'FirstName'
      Control = LabeledEditFirstName
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'LastName'
      Control = LabeledEditLastName
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'Address1'
      Control = LabeledEditAddress1
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'Address2'
      Control = LabeledEditAddress2
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'State'
      Control = LabeledEditState
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'Zip'
      Control = LabeledEditZip
      Direction = linkDataToControl
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'ID'
      Control = LabeledEditID
      Direction = linkDataToControl
      Track = True
    end
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      GridControl = StringGridAdapterBindSource1
      AutoBufferCount = False
      Columns = <
        item
          MemberName = 'FirstName'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'LastName'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'Address1'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'Address2'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'State'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'Zip'
          ReadOnly = True
          Visible = True
        end
        item
          MemberName = 'ID'
          ReadOnly = True
          Visible = True
        end>
      DefaultColumnWidth = 100
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'XML (*.xml)|*.xml'
    FilterIndex = 0
    Left = 597
    Top = 75
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Filter = 'XML (*.xml)|*.xml'
    FilterIndex = 0
    Left = 576
    Top = 24
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 701
    Top = 75
  end
end
