object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DataSnap Client'
  ClientHeight = 402
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 352
    Width = 658
    Height = 50
    Align = alBottom
    TabOrder = 0
    object NavigatorBindSourceDB1: TBindNavigator
      Left = 181
      Top = 1
      Width = 476
      Height = 48
      DataSource = BindSourceDB1
      Align = alClient
      Orientation = orHorizontal
      TabOrder = 0
      ExplicitLeft = 272
      ExplicitWidth = 385
    end
    object butOpen: TButton
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 75
      Height = 28
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Open'
      TabOrder = 1
      OnClick = butOpenClick
    end
    object butApply: TButton
      AlignWithMargins = True
      Left = 96
      Top = 11
      Width = 75
      Height = 28
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Apply'
      TabOrder = 2
      OnClick = butApplyClick
      ExplicitLeft = 201
      ExplicitTop = 13
    end
  end
  object StringGrid1: TStringGrid
    Tag = 13
    Left = 0
    Top = 0
    Width = 658
    Height = 352
    Align = alClient
    ColCount = 13
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goEditing, goAlwaysShowEditor]
    TabOrder = 1
    ColWidths = (
      85
      155
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <
      item
        Name = 'CUSTNO'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'COMPANY'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ADDR2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CITY'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZIP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'COUNTRY'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TAXRATE'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'CONTACT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LASTINVOICEDATE'
        DataType = ftTimeStamp
      end>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 32
    Top = 160
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDMemTable1
    ScopeMappings = <>
    Left = 32
    Top = 272
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 36
    Top = 213
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'CUSTNO'
          Width = 85
        end
        item
          MemberName = 'COMPANY'
          Width = 155
        end
        item
          MemberName = 'ADDR1'
        end
        item
          MemberName = 'ADDR2'
        end
        item
          MemberName = 'CITY'
        end
        item
          MemberName = 'STATE'
        end
        item
          MemberName = 'ZIP'
        end
        item
          MemberName = 'COUNTRY'
        end
        item
          MemberName = 'PHONE'
        end
        item
          MemberName = 'FAX'
        end
        item
          MemberName = 'TAXRATE'
        end
        item
          MemberName = 'CONTACT'
        end
        item
          MemberName = 'LASTINVOICEDATE'
        end>
    end
  end
end
