unit SampleAdapterForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Data.Bind.Components, Data.Bind.ObjectScope,
  SampleAdapter1, Vcl.Bind.Grid, Data.Bind.Grid, Vcl.Grids, Vcl.ExtDlgs,
  Vcl.AppEvnts;

type
  TForm259 = class(TForm)
    ContactsAdapter1: TContactsAdapter;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    NavigatorAdapterBindSource1: TBindNavigator;
    LabeledEditFirstName: TLabeledEdit;
    LinkControlToField2: TLinkControlToField;
    LabeledEditLastName: TLabeledEdit;
    LinkControlToField3: TLinkControlToField;
    LabeledEditAddress1: TLabeledEdit;
    LinkControlToField4: TLinkControlToField;
    LabeledEditAddress2: TLabeledEdit;
    LinkControlToField5: TLinkControlToField;
    LabeledEditState: TLabeledEdit;
    LinkControlToField6: TLinkControlToField;
    LabeledEditZip: TLabeledEdit;
    LinkControlToField7: TLinkControlToField;
    LabeledEditID: TLabeledEdit;
    LinkControlToField8: TLinkControlToField;
    StringGridAdapterBindSource1: TStringGrid;
    LinkGridToDataSource1: TLinkGridToDataSource;
    ButtonLoad: TButton;
    OpenTextFileDialog1: TOpenTextFileDialog;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Button1: TButton;
    ButtonSaveAs: TButton;
    ButtonLoadFrom: TButton;
    CheckBoxActive: TCheckBox;
    ApplicationEvents1: TApplicationEvents;
    Label1: TLabel;
    LabelFileName: TLabel;
    CheckBoxAutoLoad: TCheckBox;
    ButtonClear: TButton;
    CheckBoxAutoEdit: TCheckBox;
    ButtonChangeName: TButton;
    ButtonChangeNamesInFields: TButton;
    procedure ButtonLoadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonSaveAsClick(Sender: TObject);
    procedure ButtonLoadFromClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure CheckBoxActiveClick(Sender: TObject);
    procedure CheckBoxAutoLoadClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure CheckBoxAutoEditClick(Sender: TObject);
    procedure ContactsAdapter1BeforeOpen(Adapter: TBindSourceAdapter);
    procedure ButtonChangeNameClick(Sender: TObject);
    procedure ButtonChangeNamesInFieldsClick(Sender: TObject);
  private
    FChecking: Boolean;
    FCreating: Boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form259: TForm259;

implementation

{$R *.dfm}

uses Generics.Collections;


procedure TForm259.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  FChecking := True;
  try
     CheckBoxActive.Checked := Self.AdapterBindSource1.Active;
     CheckBoxAutoLoad.Checked := Self.ContactsAdapter1.AutoLoad;
     CheckBoxAutoEdit.Checked := Self.ContactsAdapter1.AutoEdit;
     if FileExists(ContactsAdapter1.FileName) then
       LabelFileName.Caption := ContactsAdapter1.FileName + ' (exists)'
     else
       LabelFileName.Caption := ContactsAdapter1.FileName + ' (not exists)';
  finally
    FChecking := False;
  end;
end;

procedure TForm259.Button1Click(Sender: TObject);
begin
  if AdapterBindSource1.Editing then
    AdapterBindSource1.Post;
  ContactsAdapter1.Save;
end;

procedure TForm259.ButtonChangeNameClick(Sender: TObject);
var
  LList: TList<TContact>;
  LContact: TContact;
  LField: TBindSourceAdapterField;
begin
  // Modify underlying data
  if AdapterBindSource1.Active then
    if AdapterBindSource1.Editing then
      AdapterBindSource1.Post;


  LList := ContactsAdapter1.List;
  if LList <> nil then
  begin
    for LContact in LList do
    begin
      LContact.FirstName := '.' + LContact.FirstName;
      LContact.LastName := '.' + LContact.LastName;
    end;
    if AdapterBindSource1.Active then
    begin
      ContactsAdapter1.Refresh; // Only update the active row
      LinkGridToDataSource1.BindGridLink.ResetGrid;
    end;
  end;
end;

procedure TForm259.ButtonChangeNamesInFieldsClick(Sender: TObject);
var
  LField: TBindSourceAdapterField;
begin
  if not AdapterBindSource1.Active then
    Exit;
  // Modify the fields.  Underlying data will be updated when post.
  AdapterBindSource1.Edit;
  LField := ContactsAdapter1.FindField('FirstName');
  Assert(LField <> nil);
  LField.SetTValue('.' + LField.GetTValue.AsString);
  LField := ContactsAdapter1.FindField('LastName');
  Assert(LField <> nil);
  LField.SetTValue('.' + LField.GetTValue.AsString);
end;

procedure TForm259.ButtonClearClick(Sender: TObject);
begin
  ContactsAdapter1.SetList(nil);
end;

procedure TForm259.ButtonLoadClick(Sender: TObject);
begin
  ContactsAdapter1.Load;
  AdapterBindSource1.Active := True;
end;

procedure TForm259.ButtonLoadFromClick(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute(Self.Handle) then
  begin
    ContactsAdapter1.LoadFrom(OpenTextFileDialog1.FileName);
    AdapterBindSource1.Active := True;
  end;
end;

procedure TForm259.ButtonSaveAsClick(Sender: TObject);
begin
  if AdapterBindSource1.Editing then
    AdapterBindSource1.Post;
  if SaveTextFileDialog1.Execute(Self.Handle) then
  begin
    ContactsAdapter1.SaveAs(SaveTextFileDialog1.FileName);
  end;
end;

procedure TForm259.CheckBoxActiveClick(Sender: TObject);
begin
  if not FChecking then
  begin
    AdapterBindSource1.Active := not AdapterBindSource1.Active;;
  end;
end;

procedure TForm259.CheckBoxAutoEditClick(Sender: TObject);
begin
  if not FChecking then
    Self.ContactsAdapter1.AutoEdit := not Self.ContactsAdapter1.AutoEdit;
end;

procedure TForm259.CheckBoxAutoLoadClick(Sender: TObject);
begin
  if not FChecking then
    Self.ContactsAdapter1.AutoLoad := not Self.ContactsAdapter1.AutoLoad;
end;

procedure TForm259.ContactsAdapter1BeforeOpen(Adapter: TBindSourceAdapter);
begin
  if FCreating then
    // Prevent exception on startup if xml file does not exist yet
    if not FileExists(ContactsAdapter1.FileName) then
      ContactsAdapter1.AutoLoad := False;
end;

constructor TForm259.Create(AOwner: TComponent);
begin
  FCreating := True;
  inherited;
  FCreating := False;
end;

end.
