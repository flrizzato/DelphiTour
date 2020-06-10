program SendSMS;

uses
  System.StartUpCopy,
  FMX.Forms,
  mainform in 'mainform.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
