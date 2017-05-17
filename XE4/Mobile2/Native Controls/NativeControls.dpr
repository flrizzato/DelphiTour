program NativeControls;

uses
  System.StartUpCopy,
  FMX.Forms,
  NativeControlsForm in 'NativeControlsForm.pas' {SettingBadgeNumberForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSettingBadgeNumberForm, SettingBadgeNumberForm);
  Application.Run;
end.
