program SendPush;

uses
  Vcl.Forms,
  SendPushForm in 'SendPushForm.pas' {Form17};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
