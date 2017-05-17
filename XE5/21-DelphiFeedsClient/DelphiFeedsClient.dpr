program DelphiFeedsClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  DelphiFeedsIOSClientForm in 'DelphiFeedsIOSClientForm.pas' {HeaderFooterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.Run;
end.
