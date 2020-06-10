inherited RoomForm: TRoomForm
  Caption = 'Room'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited tabEdit: TTabSheet
      object Label1: TLabel
        Left = 8
        Top = 53
        Width = 42
        Height = 13
        Caption = 'Capacity'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 97
        Width = 40
        Height = 13
        Caption = 'Location'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 141
        Width = 27
        Height = 13
        Caption = 'Name'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Room ID'
        FocusControl = DBEdit4
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 69
        Width = 134
        Height = 21
        DataField = 'CAPACITY'
        DataSource = datControl
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 113
        Width = 394
        Height = 21
        DataField = 'LOCATION'
        DataSource = datControl
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 157
        Width = 394
        Height = 21
        DataField = 'NAME'
        DataSource = datControl
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 24
        Width = 134
        Height = 21
        Color = clSkyBlue
        DataField = 'ROOM_ID'
        DataSource = datControl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    inherited tabSearch: TTabSheet
      inherited DBGridSearch: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ROOM_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAPACITY'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCATION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Visible = True
          end>
      end
    end
  end
  inherited ActionList: TActionList
    inherited DataSetFirst1: TDataSetFirst
      Enabled = False
    end
    inherited DataSetPrior1: TDataSetPrior
      Enabled = False
    end
    inherited DataSetNext1: TDataSetNext
      Enabled = False
    end
    inherited DataSetLast1: TDataSetLast
      Enabled = False
    end
    inherited DataSetInsert1: TDataSetInsert
      Enabled = False
    end
    inherited DataSetDelete1: TDataSetDelete
      Enabled = False
    end
    inherited DataSetEdit1: TDataSetEdit
      Enabled = False
    end
    inherited DataSetPost1: TDataSetPost
      Enabled = False
    end
    inherited DataSetCancel1: TDataSetCancel
      Enabled = False
    end
    inherited DataSetRefresh1: TDataSetRefresh
      Enabled = False
    end
  end
  inherited datControl: TDataSource
    DataSet = RoomDM.cdsControl
  end
end
