program SampleEMSFireDACClient;

uses
  Vcl.Forms,
  ClientFormU in 'ClientFormU.pas' {ClientForm},
  ClientModuleU in 'ClientModuleU.pas' {ClientModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
