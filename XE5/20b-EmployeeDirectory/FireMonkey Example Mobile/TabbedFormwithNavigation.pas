unit TabbedFormwithNavigation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  System.Actions, FMX.ActnList, FMX.ListView.Types, FMX.Edit, FMX.ListView,
  FMX.Layouts, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Memo, FMX.ListBox, Fmx.Bind.Navigator;

type
  TTabbedwithNavigationForm = class(TForm)
    tcMain: TTabControl;
    tabEmployees: TTabItem;
    tabProjects: TTabItem;
    ActionList1: TActionList;
    ctaEmployeeDetail: TChangeTabAction;
    ctaEmployeeList: TChangeTabAction;
    tcEmployee: TTabControl;
    tabEmployeesList: TTabItem;
    tabEmployeeDetail: TTabItem;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;
    Layout1: TLayout;
    btnBack_Employees: TSpeedButton;
    ListView1: TListView;
    bsEmployees: TBindSourceDB;
    BindingsList1: TBindingsList;
    bsProjects: TBindSourceDB;
    bsEmployeeProjects: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    ctaProjectDetails: TChangeTabAction;
    ctaProjectList: TChangeTabAction;
    ListBox2: TListBox;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem8: TListBoxItem;
    LinkPropertyToFieldItemDataDetail5: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail6: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail7: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail8: TLinkPropertyToField;
    ScrollBox1: TScrollBox;
    ListBox3: TListBox;
    LinkListControlToField4: TLinkListControlToField;
    Layout2: TLayout;
    Button1: TButton;
    Button2: TButton;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    ctaProjectEmployees: TChangeTabAction;
    ListView2: TListView;
    bsProjectEmployess: TBindSourceDB;
    ToolBar3: TToolBar;
    Label2: TLabel;
    LinkListControlToField1: TLinkListControlToField;
    tcProjects: TTabControl;
    tabProjectList: TTabItem;
    tabProjectDetails: TTabItem;
    lbProjectDetails: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    lbiProjectID: TListBoxItem;
    lbiProjectName: TListBoxItem;
    lbiProjectProduct: TListBoxItem;
    lbiProjectLead: TListBoxItem;
    lvProjects: TListView;
    LinkListControlToField5: TLinkListControlToField;
    MemoPROJ_DESC: TMemo;
    LinkPropertyToFieldItemDataDetail9: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail10: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail11: TLinkPropertyToField;
    LinkPropertyToFieldItemDataDetail12: TLinkPropertyToField;
    ToolBar4: TToolBar;
    Layout3: TLayout;
    btnBack_Projects: TSpeedButton;
    Layout4: TLayout;
    btnProjectStaff: TSpeedButton;
    lblTitle4: TLabel;
    ToolBar5: TToolBar;
    Label3: TLabel;
    tabProjectEmployees: TTabItem;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout5: TLayout;
    btnBack_Project: TSpeedButton;
    Layout6: TLayout;
    Button3: TButton;
    Button4: TButton;
    LiveBindingsBindNavigateNext2: TFMXBindNavigateNext;
    LiveBindingsBindNavigatePrior2: TFMXBindNavigatePrior;
    lblProjectStaffTitle: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    tabLogin: TTabItem;
    ToolBar6: TToolBar;
    Label5: TLabel;
    ListBox1: TListBox;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    lbiServer: TListBoxItem;
    lbiPort: TListBoxItem;
    sbLogin: TScrollBox;
    lbiURLPath: TListBoxItem;
    edtURLPath: TEdit;
    edtPort: TEdit;
    edtServer: TEdit;
    edtUserName: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure OnEmployeeSelected(const Sender: TObject;
      const AItem: TListViewItem);
    procedure OnProjectClick(const Sender: TObject; const AItem: TListViewItem);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTabsActive(State : Boolean);
  public
    { Public declarations }
  end;

var
  TabbedwithNavigationForm: TTabbedwithNavigationForm;

implementation

uses
  BackButtonManager,
  DataModuleMain;

{$R *.fmx}


procedure TTabbedwithNavigationForm.btnLoginClick(Sender: TObject);
begin
  // Update the details on the screen into the Object
  DataModule1.pbsServerSettings.ApplyUpdates;
  // Reconnect (with the new settings)
  DataModule1.SQLConnection1.Connected := False;
  DataModule1.SQLConnection1.Connected := True;

  SetTabsActive(DataModule1.SQLConnection1.Connected);
end;

procedure TTabbedwithNavigationForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  tcMain.ActiveTab := tcMain.Tabs[0];
  tcEmployee.ActiveTab := tabEmployeesList;
  tcProjects.ActiveTab := tabProjectList;

  SetTabsActive(False);

  if TOSVersion.Platform = pfAndroid then
    TBackActionManager.HideBackActionControls(Self);
end;

procedure TTabbedwithNavigationForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  BackAction : TChangeTabAction;
begin
  if {(TOSVersion.Platform = pfAndroid) and} (Key = vkHardwareBack) then begin
    BackAction := TBackActionManager.FindBackAction(tcMain,True);
    if Assigned(BackAction) then begin
      BackAction.ExecuteTarget(Self);
      Key := 0;
    end;
  end;
end;

procedure TTabbedwithNavigationForm.OnEmployeeSelected(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // On List Click - Navigate to Detail
  ctaEmployeeDetail.ExecuteTarget(Self);
end;

procedure TTabbedwithNavigationForm.OnProjectClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // On List Click - Navigate to Detail
  ctaProjectDetails.ExecuteTarget(Self);
end;

procedure TTabbedwithNavigationForm.SetTabsActive(State: Boolean);
begin
  tabEmployees.Enabled := State;
  tabProjects.Enabled := State;
  if State then
    tcMain.ActiveTab := tabEmployees
  else
    tcMain.ActiveTab := tabLogin;
end;

end.
