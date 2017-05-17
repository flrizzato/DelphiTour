program EmployeeDirectoryVCLDesktop;

uses
  Vcl.Forms,
  unit3 in 'unit3.pas' {Form3},
  dataModuleMain in '..\common\dataModuleMain.pas' {DataModule1: TDataModule},
  DataSnapServerConnectionObj in '..\common\DataSnapServerConnectionObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
