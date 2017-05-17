program DSMobileClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  DSMobileClientForm in 'DSMobileClientForm.pas' {HeaderFooterForm},
  DS101ClientClassesUnit in 'DS101ClientClassesUnit.pas',
  DS101ClientModuleUnit in 'DS101ClientModuleUnit.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
