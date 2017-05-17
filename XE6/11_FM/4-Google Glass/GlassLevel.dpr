program GlassLevel;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  uGlassLevel in 'uGlassLevel.pas' {Form2},
  Androidapi.JNI.PowerManager in 'Androidapi.JNI.PowerManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
