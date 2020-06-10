program EmployeeDirectoryFMDesktop;

uses
  FMX.Forms,
  dataModuleMain in '..\common\dataModuleMain.pas' {DataModule1: TDataModule},
  Unit2 in 'Unit2.pas' {FMXDesktopForm},
  DataSnapServerConnectionObj in '..\common\DataSnapServerConnectionObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFMXDesktopForm, FMXDesktopForm);
  Application.Run;
end.
