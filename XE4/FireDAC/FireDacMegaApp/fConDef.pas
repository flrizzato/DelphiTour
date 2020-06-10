unit fConDef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager, DB, uADCompClient,
  uADStanAsync;

type
  TConDefFrm = class(TForm)
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDatabase: TEdit;
    Button1: TButton;
    edtServer: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtPort: TEdit;
    edtUserName: TEdit;
    Label6: TLabel;
    edtPassword: TEdit;
    Label7: TLabel;
    ADConnection1: TADConnection;
    Label8: TLabel;
    edtDriverID: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConDefFrm: TConDefFrm;

implementation

uses
  uADStanUtil;

{$R *.dfm}

procedure TConDefFrm.FormCreate(Sender: TObject);
begin
  // Get the list of accessible drivers
  ADManager.GetDriverNames(edtDriverID.Items);
end;

procedure TConDefFrm.Button1Click(Sender: TObject);
var
  oParams: TStrings;
begin
  // First disconnect
  ADConnection1.Connected := False;

  oParams := TStringList.Create;
  try
    if edtServer.Text <> '' then
      oParams.Add('Server=' + edtServer.Text);
    if edtPort.Text <> '' then
      oParams.Add('Port=' + edtPort.Text);
    if edtDatabase.Text <> '' then
      oParams.Add('Database=' + edtDatabase.Text);
    if edtUserName.Text <> '' then
      oParams.Add('User_Name=' + edtUserName.Text);
    if edtPassword.Text <> '' then
      oParams.Add('Password=' + edtPassword.Text);

    // If connection definition already exists, then delete it
    if ADManager.IsConnectionDef(edtName.Text) then
      ADManager.DeleteConnectionDef(edtName.Text);

    // Create new connection definition
    ADManager.AddConnectionDef(edtName.Text, edtDriverID.Text, oParams);
  finally
    oParams.Free;
  end;

  // Use the connection definition and connect
  ADConnection1.ConnectionDefName := edtName.Text;
  ADConnection1.Connected := True;

  ShowMessage('Connected !');
end;

procedure TConDefFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Defining_Connection.html', '');
end;

end.
