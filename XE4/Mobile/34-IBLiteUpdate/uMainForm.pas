unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.Layouts,
  FMX.ListBox, Data.DB, uADCompDataSet, uADCompClient, FMX.StdCtrls,
  uADGUIxFMXWait, uADCompGUIx, uADPhysIB, FMX.Edit, FMX.Memo;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Employee: TADConnection;
    qryProjects: TADQuery;
    qryProjectsPROJ_ID: TStringField;
    qryProjectsPROJ_NAME: TStringField;
    qryProjectsPROJ_DESC: TMemoField;
    qryProjectsTEAM_LEADER: TSmallintField;
    qryProjectsPRODUCT: TStringField;
    ListBox1: TListBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Button1: TButton;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    qryBudget: TADQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    qryBudgetFISCAL_YEAR: TIntegerField;
    qryBudgetPROJ_ID: TStringField;
    qryBudgetDEPT_NO: TStringField;
    qryBudgetPROJECTED_BUDGET: TBCDField;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkListControlToField1: TLinkListControlToField;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    LinkControlToField3: TLinkControlToField;
    procedure EmployeeBeforeConnect(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  qryBudget.Edit;
  qryBudgetPROJECTED_BUDGET.AsString := Edit2.Text;
  qryBudget.Post;
  qryBudget.ApplyUpdates(-1);
end;

procedure TForm1.EmployeeBeforeConnect(Sender: TObject);
begin
  Employee.Params.Values['Database'] := GetHomePath + PathDelim +
    'Documents' + PathDelim + 'EMPLOYEE.GDB';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Employee.Open();
  qryProjects.Open();
  ListBox1ItemClick(TCustomListBox(Self), ListBox1.Selected);
end;

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  qryBudget.Close;
  qryBudget.Params[0].AsString := qryProjectsPROJ_ID.AsString;
  qryBudget.Open();
end;

end.
