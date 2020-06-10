program SCServerApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uMainFrame in 'uMainFrame.pas' {MainFrame: TFrame},
  uMainDM in 'uMainDM.pas' {MainDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
