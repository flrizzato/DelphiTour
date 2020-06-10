unit VCLApp_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, IPPeerClient, IPPeerServer, System.Tether.Manager,
  System.Tether.AppProfile;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    ActionList1: TActionList;
    Action1: TAction;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Action1Execute(Sender: TObject);
begin
  if Edit1.Text <> '' then
    ListBox1.Items.Add(Edit1.Text);
end;

end.
