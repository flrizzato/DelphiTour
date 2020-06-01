program MobileWrappers;

uses
  System.StartUpCopy,
  FMX.Forms,
  BarCodeReader in 'BarCodeReader.pas',
  NetworkState in 'NetworkState.pas',
  OpenViewUrl in 'OpenViewUrl.pas',
  SendMail in 'SendMail.pas',
  ToastMessage in 'ToastMessage.pas',
  uMainForm in 'uMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
