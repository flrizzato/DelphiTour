program Accelerometer;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {AccelerometerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait];
  Application.CreateForm(TAccelerometerForm, AccelerometerForm);
  Application.Run;
end.
