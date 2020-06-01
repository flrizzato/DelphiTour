program MarvelRESTApi;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  Xplat.Utils in 'Lib\Xplat.Utils.pas',
  AnonThread in 'Lib\AnonThread.pas',
  Xplat.Services in 'Lib\Xplat.Services.pas',
  Android.Services in 'Lib\Android.Services.pas',
  Android.ProgressDialog in 'Lib\Android.ProgressDialog.pas',
  Xplat.Inifiles in 'Lib\Xplat.Inifiles.pas',
  FMX.Graphics.HelperClass in 'Lib\FMX.Graphics.HelperClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
