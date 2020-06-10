object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 385
  ClientWidth = 727
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 727
    Height = 385
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 288
    object TabSheet1: TTabSheet
      Caption = 'Staff'
      ExplicitWidth = 627
      ExplicitHeight = 260
      object Panel1: TPanel
        Left = 201
        Top = 0
        Width = 518
        Height = 357
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        ExplicitWidth = 426
        ExplicitHeight = 260
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 516
          Height = 113
          Align = alTop
          TabOrder = 0
          ExplicitWidth = 424
          object LabeledEditFIRST_NAME: TLabeledEdit
            Left = 16
            Top = 47
            Width = 121
            Height = 21
            EditLabel.Width = 63
            EditLabel.Height = 13
            EditLabel.Caption = 'FIRST_NAME'
            TabOrder = 0
            Text = 'Janet'
          end
          object LabeledEditLAST_NAME: TLabeledEdit
            Left = 143
            Top = 47
            Width = 121
            Height = 21
            EditLabel.Width = 58
            EditLabel.Height = 13
            EditLabel.Caption = 'LAST_NAME'
            TabOrder = 1
            Text = 'Baldwin'
          end
          object LabeledEditPHONE_EXT: TLabeledEdit
            Left = 287
            Top = 47
            Width = 121
            Height = 21
            EditLabel.Width = 58
            EditLabel.Height = 13
            EditLabel.Caption = 'PHONE_EXT'
            TabOrder = 2
            Text = '2'
          end
        end
        object StringGrid2: TStringGrid
          Tag = 4
          Left = 1
          Top = 114
          Width = 516
          Height = 242
          Align = alClient
          ColCount = 4
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 1
          ExplicitWidth = 424
          ExplicitHeight = 145
          ColWidths = (
            64
            64
            150
            150)
        end
      end
      object StringGrid1: TStringGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 201
        Height = 357
        Align = alLeft
        ColCount = 1
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
        ExplicitHeight = 260
        ColWidths = (
          175)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Projects'
      ImageIndex = 1
      ExplicitWidth = 627
      ExplicitHeight = 260
      object StringGrid3: TStringGrid
        Tag = 6
        Left = 0
        Top = 0
        Width = 719
        Height = 176
        Align = alClient
        ColCount = 6
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ColWidths = (
          64
          100
          300
          64
          64
          100)
      end
      object StringGrid4: TStringGrid
        Tag = 3
        Left = 0
        Top = 176
        Width = 719
        Height = 181
        Align = alBottom
        ColCount = 3
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 1
        ColWidths = (
          64
          64
          200)
      end
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule1.cdsEmployee
    ScopeMappings = <>
    Left = 560
    Top = 96
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 540
    Top = 189
    object LinkControlToFieldFIRST_NAME2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'FIRST_NAME'
      Control = LabeledEditFIRST_NAME
      Track = True
    end
    object LinkControlToFieldLAST_NAME2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'LAST_NAME'
      Control = LabeledEditLAST_NAME
      Track = True
    end
    object LinkControlToFieldPHONE_EXT2: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'PHONE_EXT'
      Control = LabeledEditPHONE_EXT
      Track = True
    end
    object LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      AutoBufferCount = False
      Columns = <
        item
          MemberName = 'FULL_NAME'
          Width = 175
        end>
    end
    object LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB2
      GridControl = StringGrid2
      AutoBufferCount = False
      Columns = <
        item
          MemberName = 'EMP_NO'
        end
        item
          MemberName = 'PROJ_ID'
        end
        item
          MemberName = 'Project_name'
          Width = 150
        end
        item
          MemberName = 'Product'
          Width = 150
        end>
    end
    object LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB3
      GridControl = StringGrid3
      AutoBufferCount = False
      Columns = <
        item
          MemberName = 'PROJ_ID'
        end
        item
          MemberName = 'PROJ_NAME'
          Header = 'Project Name'
          Width = 100
        end
        item
          MemberName = 'PROJ_DESC'
          Header = 'Project Description'
          Width = 300
        end
        item
          MemberName = 'TEAM_LEADER'
          Visible = False
        end
        item
          MemberName = 'PRODUCT'
          Header = 'Product'
        end
        item
          MemberName = 'FULL_NAME'
          Header = 'Project Lead'
          Width = 100
        end>
    end
    object LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB4
      GridControl = StringGrid4
      AutoBufferCount = False
      Columns = <
        item
          MemberName = 'EMP_NO'
        end
        item
          MemberName = 'PROJ_ID'
          Visible = False
        end
        item
          MemberName = 'FULL_NAME'
          Width = 200
        end>
    end
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = DataModule1.cdsEmployeeProjects
    ScopeMappings = <>
    Left = 272
    Top = 200
  end
  object BindSourceDB3: TBindSourceDB
    DataSet = DataModule1.cdsProjects
    ScopeMappings = <>
    Left = 352
    Top = 200
  end
  object BindSourceDB4: TBindSourceDB
    DataSet = DataModule1.cdsProjectEmployess
    ScopeMappings = <>
    Left = 360
    Top = 200
  end
end
