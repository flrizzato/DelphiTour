unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, Data.DBXDataSnap, IPPeerClient, Data.DBXCommon,
  Data.DbxHTTPLayer, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Layouts, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.TabControl, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr, FMX.Edit,
  FMX.ListView.Types, FMX.ListView, Fmx.Bind.Navigator, FMX.Memo,
  FMX.DateTimeCtrls, FMX.ListBox;

type
  TFMXDesktopForm = class(TForm)
    tcMain: TTabControl;
    tabEmployees: TTabItem;
    tabProjects: TTabItem;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Grid3: TGrid;
    Layout1: TLayout;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    EditFIRST_NAME: TEdit;
    LabelFIRST_NAME: TLabel;
    LinkControlToFieldFIRST_NAME: TLinkControlToField;
    EditLAST_NAME: TEdit;
    LabelLAST_NAME: TLabel;
    LinkControlToFieldLAST_NAME: TLinkControlToField;
    EditPHONE_EXT: TEdit;
    LabelPHONE_EXT: TLabel;
    LinkControlToFieldPHONE_EXT: TLinkControlToField;
    ListView1: TListView;
    LinkListControlToField1: TLinkListControlToField;
    edtSearch: TClearingEdit;
    Layout2: TLayout;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListView2: TListView;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    MemoPROJ_DESC: TMemo;
    EditHeadEmployee: TEdit;
    LabelHeadEmployee: TLabel;
    EditPRODUCT: TEdit;
    LabelPRODUCT: TLabel;
    EditPROJ_NAME: TEdit;
    LabelPROJ_NAME: TLabel;
    Label1: TLabel;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    GroupBox6: TGroupBox;
    ListView3: TListView;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    CalendarEditHIRE_DATE: TCalendarEdit;
    LabelHIRE_DATE: TLabel;
    LinkControlToField5: TLinkControlToField;
    tabLogin: TTabItem;
    btnLogin: TButton;
    ListBox1: TListBox;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    edtUserName: TEdit;
    ListBoxItem2: TListBoxItem;
    edtPassword: TEdit;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    lbiServer: TListBoxItem;
    edtServer: TEdit;
    lbiPort: TListBoxItem;
    edtPort: TEdit;
    lbiURLPath: TListBoxItem;
    edtURLPath: TEdit;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    procedure edtSearchTyping(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTabsActive(State: Boolean);
  public
    { Public declarations }
  end;

var
  FMXDesktopForm: TFMXDesktopForm;

implementation

{$R *.fmx}
uses DataModuleMain;

procedure TFMXDesktopForm.btnLoginClick(Sender: TObject);
begin
  // Update the details on the screen into the Object
  DataModule1.pbsServerSettings.ApplyUpdates;
  // Reconnect (with the new settings)
  DataModule1.SQLConnection1.Connected := False;
  DataModule1.SQLConnection1.Connected := True;

  SetTabsActive(DataModule1.SQLConnection1.Connected);
end;

procedure TFMXDesktopForm.edtSearchTyping(Sender: TObject);
begin
  DataModule1.FilterEmployees(edtSearch.Text);
end;

procedure TFMXDesktopForm.FormCreate(Sender: TObject);
begin
  tcMain.ActiveTab := tcMain.Tabs[0];
  SetTabsActive(False);
end;

procedure TFMXDesktopForm.SetTabsActive(State: Boolean);
begin
  tabEmployees.Enabled := State;
  tabProjects.Enabled := State;
  if State then
    tcMain.ActiveTab := tabEmployees
  else
    tcMain.ActiveTab := tabLogin;
end;

end.
