program Forms;

uses
  System.StartUpCopy,
  FMX.Forms,
  PortraitForm in 'PortraitForm.pas' {PForm},
  LandscapeForm in 'LandscapeForm.pas' {LSForm};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait, TFormOrientation.soInvertedPortrait, TFormOrientation.soLandscape, TFormOrientation.soInvertedLandscape];
  Application.CreateForm(TPForm, PForm);
  Application.CreateForm(TLSForm, LSForm);
  Application.Run;
end.
