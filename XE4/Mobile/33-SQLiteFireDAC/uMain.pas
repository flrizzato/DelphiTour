unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.FMTBcd,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, uADGUIxIntf, uADStanDef, uADStanPool,
  uADPhysManager, uADCompClient, uADCompDataSet, uADStanExprFuncs,
  uADGUIxFMXWait, uADCompGUIx, uADPhysSQLite;

type
  TSQLiteForm = class(TForm)
    ToolBar1: TToolBar;
    ListBox1: TListBox;
    Button1: TButton;
    BindingsList1: TBindingsList;
    Button2: TButton;
    BindSourceDB1: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    ADTableTask: TADTable;
    FireTaskList: TADConnection;
    ADQueryDelete: TADQuery;
    ADQueryInsert: TADQuery;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    procedure Button1Click(Sender: TObject);
    procedure TaskListBeforeConnect(Sender: TObject);
    procedure TaskListAfterConnect(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure OnIdle(Sender: TObject; var ADone: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SQLiteForm: TSQLiteForm;

implementation

{$R *.fmx}

procedure TSQLiteForm.Button1Click(Sender: TObject);
var
  TaskName: String;
begin
  try
    if InputQuery('Enter New Task', 'Task', TaskName) and not (TaskName.Trim = '') then
    begin
      ADQueryInsert.ParamByName('TaskName').AsString := TaskName;
      ADQueryInsert.ExecSQL();
      ADTableTask.Refresh;
      LinkFillControlToField1.BindList.FillList;
    end;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TSQLiteForm.Button2Click(Sender: TObject);
var
  TaskName: String;
  LIndex: Integer;
begin
  TaskName := ListBox1.Selected.Text;
  try
    ADQueryDelete.ParamByName('TaskName').AsString := TaskName;
    ADQueryDelete.ExecSQL();
    ADTableTask.Refresh;
    LinkFillControlToField1.BindList.FillList;
    if (ListBox1.Selected = nil) and (ListBox1.Count > 0) then
      // Select last item
      ListBox1.ItemIndex := ListBox1.Count - 1;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TSQLiteForm.FormCreate(Sender: TObject);
begin
  try
    // For unidirectional dataset, don't refill automatically when dataset is activated
    // because dataset is reactivated everytime use DataSet.First.
    LinkFillControlToField1.AutoActivate := False;
    LinkFillControlToField1.AutoFill := False;
    Application.OnIdle := OnIdle;
    FireTaskList.Connected := True;
    ADTableTask.Active := True;
    LinkFillControlToField1.BindList.FillList;
  except
    on e: Exception do
    begin
      SHowMessage(e.Message);
    end;
  end;
end;

procedure TSQLiteForm.OnIdle(Sender: TObject; var ADone: Boolean);
begin
  Button2.Visible := ListBox1.Selected <> nil;
end;

procedure TSQLiteForm.TaskListAfterConnect(Sender: TObject);
begin
  FireTaskList.ExecSQL ('CREATE TABLE IF NOT EXISTS Task (TaskName TEXT NOT NULL)');
end;

procedure TSQLiteForm.TaskListBeforeConnect(Sender: TObject);
begin
  {$IFDEF IOS}
  FireTaskList.Params.Values['Database'] := GetHomePath + PathDelim +
    'Documents' + PathDelim + 'tasks.s3db';
  {$ENDIF}
end;

end.
