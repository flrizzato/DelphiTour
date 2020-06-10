program EmployeeDirectoryFMXMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  TabbedFormwithNavigation in 'TabbedFormwithNavigation.pas' {TabbedwithNavigationForm},
  dataModuleMain in '..\common\dataModuleMain.pas' {DataModule1: TDataModule},
  BackButtonManager in 'BackButtonManager.pas',
  DataSnapServerConnectionObj in '..\common\DataSnapServerConnectionObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TTabbedwithNavigationForm, TabbedwithNavigationForm);
  Application.Run;
end.
