program fotocasa;



uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {mainform},
  uSplash in 'uSplash.pas' {FrmSplash},
  uRecentLocations in 'uRecentLocations.pas' {frmRecentLocations};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait, TFormOrientation.soInvertedPortrait, TFormOrientation.soLandscape, TFormOrientation.soInvertedLandscape];
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
