program EMSPush1Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  EMSPush1ClientFormU in 'EMSPush1ClientFormU.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
