unit SendPushForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  REST.Backend.EMSApi, IPPeerClient,
  REST.Backend.EMSProvider, Vcl.StdCtrls, REST.Backend.PushTypes,
  REST.Backend.MetaTypes, System.JSON, REST.Backend.EMSServices,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.BindSource,
  REST.Backend.ServiceComponents;

type
  TForm17 = class(TForm)
    EMSProvider1: TEMSProvider;
    Button1: TButton;
    BackendPush1: TBackendPush;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
var
  emscli1: TEMSClientAPI;
begin
  BackendPush1.Message := Edit1.Text;
  BackendPush1.Push;
end;

end.
