program TabbedwithNavigation;

uses
  System.StartUpCopy,
  FMX.Forms,
  TabbedFormwithNavigation in 'TabbedFormwithNavigation.pas' {TabbedwithNavigationForm},
  dataModuleMain in '..\FireMonkey Example Desktop\dataModuleMain.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TTabbedwithNavigationForm, TabbedwithNavigationForm);
  Application.Run;
end.
