program RadiantMediaPlayer;

uses
  FMX.Forms,
  RadiantMediaPlayerForm in 'RadiantMediaPlayerForm.pas' {frmMediaPlayer},
  RadiantMediaPlayerConfigForm in 'RadiantMediaPlayerConfigForm.pas' {frmConfiguration};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMediaPlayer, frmMediaPlayer);
  Application.CreateForm(TfrmConfiguration, frmConfiguration);
  Application.Run;
end.
