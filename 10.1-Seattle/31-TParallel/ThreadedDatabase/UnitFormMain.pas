unit UnitFormMain;

{===============================================================================
 CodeRage 9 - Demo for Threaded Database Access

 This code shows how to use database access in such a way that it does not
 block or delay the user interface with waits.
 The query that takes a long time is wrapped in a TTask.Run and executed in
 parallel. The result of this query is then put in a local cache and the
 user interface is updated to indicate the data is now available for viewing.

 Author: Danny Wind
===============================================================================}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Layouts, FMX.Grid, FMX.ListView.Types,
  FMX.ListView, FMX.Memo, FMX.TabControl, FMX.Gestures, System.Actions,
  FMX.ActnList, System.Threading;

type
  TFormMain = class(TForm)
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    TabControlMain: TTabControl;
    TabItemItem: TTabItem;
    TabItemDetail: TTabItem;
    MemoDetail: TMemo;
    ActionList1: TActionList;
    PreviousTabAction: TPreviousTabAction;
    NextTabAction: TNextTabAction;
    GestureManager1: TGestureManager;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldSelectedTag: TLinkPropertyToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LinkListControlToField1FilledListItem(Sender: TObject;
      const AEditor: IBindListEditorItem);
    procedure ListView1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabControlMainChange(Sender: TObject);
  private
    { Private declarations }
    TaskArray: array of ITask;
    procedure UpdateAccessoryObject(aItem: TListViewItem);
  public
    { Public declarations }
    procedure RequestContent(aItem: TListViewItem);
    function CancelRequestContent(aItem: TListViewItem): Boolean;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses System.IOUtils, UnitDataMain, UnitDataThread;

function TFormMain.CancelRequestContent(aItem: TListViewItem): Boolean;
var
  lID: Integer;
begin
  lID := aItem.Tag;
  if (TaskArray[lID] <> nil)
     and (TaskArray[lID].Status = TTaskStatus.WaitingToRun) then
  begin
    TaskArray[lID].Cancel;
    {Store content in cache}
    DataModuleMain.SetContent(lID, 'Loading canceled...');
    Result := true;
  end
  else
    Result := false;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  SetLength(TaskArray, 10);
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to 9 do
  begin
    if (TaskArray[i] <> nil) then
      TaskArray[i].Cancel;
  end;
end;

procedure TFormMain.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControlMain.ActiveTab <> TabControlMain.Tabs[TabControlMain.TabCount-1] then
        TabControlMain.ActiveTab := TabControlMain.Tabs[TabControlMain.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControlMain.ActiveTab <> TabControlMain.Tabs[0] then
        TabControlMain.ActiveTab := TabControlMain.Tabs[TabControlMain.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  Log.Timestamp('SHOW ThreadedDatabase');
end;

procedure TFormMain.LinkListControlToField1FilledListItem(Sender: TObject;
  const AEditor: IBindListEditorItem);
var
  lIndex: Integer;
  lItem: TListViewItem;
begin
  {Fires when ListView Items are loaded or the connected dataset is updated.}
  lIndex := AEditor.CurrentIndex;
  if lIndex >= 0 then
  begin
    lItem := ListView1.Items[lIndex];
    UpdateAccessoryObject(lItem);
  end;
end;

procedure TFormMain.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  lID: Integer;
begin
  {Request or Display Content
   There is a LiveBinding between the ID field and aItem.Tag}
  lID := AItem.Tag;
  case DataModuleMain.GetMark(lID) of
    TAccessoryType.More:
      begin
        {Mark as on its way}
        DataModuleMain.SetMark(lID, TAccessoryType.Checkmark);
        {Update in GUI}
        UpdateAccessoryObject(AItem);
        {Request content for item}
        RequestContent(AItem);
      end;
    TAccessoryType.CheckMark:
      begin {Cancel pending request if possible}
        if CancelRequestContent(AItem) then
        begin
          {Mark as not loaded}
          DataModuleMain.SetMark(lID, TAccessoryType.More);
          {Update indication in GUI}
          UpdateAccessoryObject(AItem);
          {Update content as canceled in detail}
          DataModuleMain.SetContent(lID, 'Loading canceled...');
        end;
      end;
    TAccessoryType.Detail:
      begin {Load content from cache into detail}
        MemoDetail.Lines.Clear;
        MemoDetail.Lines.Add(DataModuleMain.GetContent(lID));
      end;
  end;
end;

procedure TFormMain.ListView1UpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  {ListView Resize or SCreen Rotate}
  UpdateAccessoryObject(AItem);
end;

procedure TFormMain.RequestContent(aItem: TListViewItem);
var
  lID: Integer;
begin
  lID := aItem.Tag;
  {Mark content is loading in cache}
  DataModuleMain.SetContent(lID, 'Loading content....');
  TaskArray[lID] := TTask.Run(
    procedure
    var
      lDataModuleThread: TDataModuleThread;
      lContent: string;
    begin
      {Load content}
      lDataModuleThread := TDataModuleThread.Create(nil);
      try
        lContent := lDataModuleThread.GetContent(lID);
      finally
        lDataModuleThread.Free;
      end;

      TThread.Synchronize(nil,
        procedure
        begin
          {Store content in cache}
          DataModuleMain.SetContent(lID, lContent);
          {Mark as loaded}
          DataModuleMain.SetMark(lID, TAccessoryType.Detail);
          {Update indication in GUI}
          UpdateAccessoryObject(AItem);
        end);
    end)
end;

procedure TFormMain.TabControlMainChange(Sender: TObject);
begin
  if (TabControlMain.ActiveTab = TabItemDetail) then
  begin
    MemoDetail.Lines.Clear;
    MemoDetail.Lines.Add(DataModuleMain.GetContent(ListView1.Selected.Tag));
  end;
end;

procedure TFormMain.UpdateAccessoryObject(aItem: TListViewItem);
var
  lID: Integer;
begin
  {There is a LiveBinding between the ID field and aItem.Tag}
  lID := aItem.Tag;
  if (DataModuleMain.GetMark(lID) = TAccessoryType.More) then
    aItem.Objects.AccessoryObject.Visible := False
  else
  begin
    aItem.Objects.AccessoryObject.AccessoryType := DataModuleMain.GetMark(lID);
    aItem.Objects.AccessoryObject.Visible := True;
  end;
  aItem.Objects.AccessoryObject.Invalidate;
end;

end.
