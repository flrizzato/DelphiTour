unit mainform;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox, FMX.StdCtrls,
  FMX.Edit, FMX.DateTimeCtrls, Androidapi.JNI.Telephony, Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
  TForm8 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    EditPhoneNr: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditMsg: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
var
  MySMSManager : JSmsManager;
begin
  MySMSManager := TJSmsManager.JavaClass.getDefault;
  MySMSManager.sendTextMessage(
    StringToJString(EditPhoneNr.Text),nil,StringToJString(EditMsg.Text),nil,nil);
end;

end.
