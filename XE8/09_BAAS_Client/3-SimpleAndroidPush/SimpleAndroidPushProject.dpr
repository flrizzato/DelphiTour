program SimpleAndroidPushProject;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  FormUnit9 in 'FormUnit9.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
