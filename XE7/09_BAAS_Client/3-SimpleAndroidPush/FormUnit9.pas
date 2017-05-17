unit FormUnit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Backend.PushTypes, REST.Backend.KinveyPushDevice, System.JSON,
  System.PushNotification, FMX.StdCtrls, REST.Backend.KinveyProvider,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.PushDevice, FMX.Layouts, FMX.Memo, REST.OpenSSL;

type
  TForm9 = class(TForm)
    PushEvents1: TPushEvents;
    KinveyProvider1: TKinveyProvider;
    ToolBar1: TToolBar;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure PushEvents1DeviceRegistered(Sender: TObject);
    procedure PushEvents1DeviceTokenReceived(Sender: TObject);
    procedure PushEvents1DeviceTokenRequestFailed(Sender: TObject;
      const AErrorMessage: string);
    procedure PushEvents1PushReceived(Sender: TObject; const AData: TPushData);
    procedure Button1Click(Sender: TObject);
  private
    procedure OnIdle(Sender: TObject; var ADone: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.Button1Click(Sender: TObject);
begin
  PushEvents1.Active := not PushEvents1.Active;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Application.OnIdle := OnIdle;
end;

procedure TForm9.OnIdle(Sender: TObject; var ADone: Boolean);
begin
  if PushEvents1.Active then
    Button1.Text := 'Active'
  else
    Button1.Text := 'Inactive';
end;

procedure TForm9.PushEvents1DeviceRegistered(Sender: TObject);
begin
  Memo1.Lines.Add('PushEvents1DeviceRegistered');
end;

procedure TForm9.PushEvents1DeviceTokenReceived(Sender: TObject);
begin
  Memo1.Lines.Add('PushEvents1DeviceTokenReceived');
end;

procedure TForm9.PushEvents1DeviceTokenRequestFailed(Sender: TObject;
  const AErrorMessage: string);
begin
  Memo1.Lines.Add('PushEvents1DeviceTokenRequestFailed');
  Memo1.Lines.Add('ErrorMessage: ' + AErrorMessage);
end;

procedure TForm9.PushEvents1PushReceived(Sender: TObject;
  const AData: TPushData);
begin
  Memo1.Lines.Add('PushEvents1PushReceived');
  Memo1.Lines.Add('JSON: ' + AData.Message);
end;

end.
