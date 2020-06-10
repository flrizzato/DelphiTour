program PlanetsDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormPlanetsUnit in 'FormPlanetsUnit.pas' {FormPlanets};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soLandscape, TFormOrientation.soInvertedLandscape];
  Application.CreateForm(TFormPlanets, FormPlanets);
  Application.Run;
end.
