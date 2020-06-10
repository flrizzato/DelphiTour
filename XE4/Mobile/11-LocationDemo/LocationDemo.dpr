program LocationDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  LocationDemoUnit in 'LocationDemoUnit.pas' {LocationDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLocationDemoForm, LocationDemoForm);
  Application.Run;
end.
