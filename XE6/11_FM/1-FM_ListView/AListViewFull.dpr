program AListViewFull;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  MainFm in 'MainFm.pas' {MainForm},
  RandomTextUtils in 'RandomTextUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
