program BarcodeTransfer;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  Androidapi.JNI.Toast in 'Lib\Androidapi.JNI.Toast.pas',
  FMX.Barcode.IOS in 'Lib\FMX.Barcode.IOS.pas',
  FMX.Barcode.DROID in 'Lib\FMX.Barcode.DROID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.InvertedLandscape];
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
