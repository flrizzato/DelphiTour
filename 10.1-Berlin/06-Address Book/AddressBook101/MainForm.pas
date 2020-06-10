unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.AddressBook.Types, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.StdCtrls, FMX.ListView,
  FMX.Controls.Presentation, FMX.AddressBook;

type
  TForm1 = class(TForm)
    AddressBook1: TAddressBook;
    ToolBar1: TToolBar;
    lvContacts: TListView;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure AddressBook1PermissionRequest(ASender: TObject;
      const AMessage: string; const AAccessGranted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses System.Threading;

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TForm1.AddressBook1PermissionRequest(ASender: TObject;
  const AMessage: string; const AAccessGranted: Boolean);
begin
  if not AAccessGranted then
    ShowMessage('Nao permitido!');
end;

procedure TForm1.Button1Click(Sender: TObject);
Var Task : ITask;
begin
  Task := TTask.Create(procedure
    var
      Contact : TAddressBookContact;
      Contacts : TAddressBookContacts;
      LVI: TListViewItem;
    begin
      Contacts := TAddressBookContacts.Create;
      try
        AddressBook1.AllContacts(Contacts);

        for Contact in Contacts do begin
          TThread.Synchronize(nil,procedure
            begin
              LVI := lvContacts.Items.Add;
              LVI.Text := Contact.DisplayName;
              LVI.Detail := Contact.Source.SourceName;
              LVI.Bitmap.Assign(Contact.PhotoThumbnail);
              LVI.Data['ID'] := Contact.ID;
            end)
        end;
      finally
        Contacts.Free;
      end;
    end);
  Task.Start;
end;

end.
