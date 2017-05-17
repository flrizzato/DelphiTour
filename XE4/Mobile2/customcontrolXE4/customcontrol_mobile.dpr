program customcontrol_mobile;

{$R 'fmx.customcontrol.ios.res' 'fmx.customcontrol.ios.rc'}

uses
  System.StartUpCopy,
  FMX.Forms,
  customcontrolmobilefrm in 'customcontrolmobilefrm.pas' {Form15},
  fmx.customcontrol in 'fmx.customcontrol.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm15, Form15);
  Application.Run;
end.
