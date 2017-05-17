unit EMSPush1ClientFormU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Backend.PushTypes, System.JSON, REST.Backend.EMSPushDevice,
  System.PushNotification, FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Backend.BindSource, REST.Backend.PushDevice, REST.Backend.EMSProvider,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Layouts;

type
  TForm1 = class(TForm)
    EMSProvider1: TEMSProvider;
    PushEvents1: TPushEvents;
    ButtonRegister: TButton;
    ButtonUnregister: TButton;
    CheckBoxListen: TCheckBox;
    Memo1: TMemo;
    ButtonClear: TButton;
    EditDeviceToken: TEdit;
    EditInstallationID: TEdit;
    EditHost: TEdit;
    ButtonTestConnection: TButton;
    Memo2: TMemo;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxListenChange(Sender: TObject);
    procedure ButtonRegisterClick(Sender: TObject);
    procedure ButtonUnregisterClick(Sender: TObject);
    procedure PushEvents1DeviceRegistered(Sender: TObject);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure ButtonTestConnectionClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
  private
    FChecking: Boolean;
    procedure OnIdle(Sender: TObject; var Done: Boolean);
    procedure Log(const AValue: string);
    procedure UpdateConnection;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses REST.JSON;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  PushEvents1.ClearResult;
end;

procedure TForm1.ButtonRegisterClick(Sender: TObject);
begin
  UpdateConnection;
  PushEvents1.RegisterDevice;
end;

procedure TForm1.UpdateConnection;
begin
  EMSProvider1.URLHost := EditHost.Text;
end;

procedure TForm1.Log(const AValue: string);
begin
  Memo1.Lines.Add(AValue);
end;

procedure TForm1.ButtonTestConnectionClick(Sender: TObject);
begin
  UpdateConnection;
  EMSProvider1.AppHandshake(
    procedure(const AObj: TJSONObject)
    begin
      Log(Rest.JSON.TJson.Format(AObj));
    end);
end;

procedure TForm1.ButtonUnregisterClick(Sender: TObject);
begin
  UpdateConnection;
  PushEvents1.UnregisterDevice;
end;

procedure TForm1.CheckBoxListenChange(Sender: TObject);
begin
  UpdateConnection;
  if not FChecking then
    PushEvents1.Active := not PushEvents1.Active;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    Application.OnIdle := OnIdle;
    if PushEvents1.StartupNotification <> nil then
      PushEvents1PushReceived(Self, PushEvents1.StartupNotification);
    PushEvents1.Active := True;
    if PushEvents1.DeviceToken = '' then
      Log('No DeviceToken on startup');
  except
    Application.HandleException(Self);

  end;
end;

procedure TForm1.OnIdle(Sender: TObject; var Done: Boolean);
var
  LInstallationID: string;
begin
  FChecking := True;
  try
    CheckBoxListen.IsChecked := PushEvents1.Active;
    EditDeviceToken.Text := PushEvents1.DeviceToken;
    if PushEvents1.InstallationValue.TryGetObjectID(LInstallationID) then
      EditInstallationID.Text := LInstallationID
    else
      EditInstallationID.Text := '';
  finally
    FChecking := False;
  end;
end;

procedure TForm1.PushEvents1DeviceRegistered(Sender: TObject);
begin
  Log('DeviceRegistered');
end;

procedure TForm1.PushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Log('DeviceTokenReceived');
end;

procedure TForm1.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Log('DeviceTokenRequestFailed');
end;

procedure TForm1.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    S.Values['message'] := AData.Message;
    S.Values['APS.Alert'] := AData.APS.Alert;
    S.Values['APS.Badge'] := AData.APS.Badge;
    S.Values['APS.Sound'] := AData.APS.Sound;
    S.Values['GCM.Message'] := AData.GCM.Message;
    S.Values['GCM.Title'] := AData.GCM.Title;
    S.Values['GCM.Msg'] := AData.GCM.Msg;
    S.Values['GCM.Action'] := AData.GCM.Action;
    Log('PushReceived: ' + S.DelimitedText);
  finally
    S.Free;
  end;
end;

end.
