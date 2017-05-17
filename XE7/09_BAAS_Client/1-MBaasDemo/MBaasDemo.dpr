program MBaasDemo;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  uMain_frm in 'uMain_frm.pas' {frm_Main},
  MBD.DataModule in 'MBD.DataModule.pas' {dm: TDataModule},
  MBD.Credentials in 'MBD.Credentials.pas',
  MDB.BusinessObjects in 'MDB.BusinessObjects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
