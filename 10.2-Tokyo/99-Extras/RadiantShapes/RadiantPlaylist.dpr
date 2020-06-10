program RadiantPlaylist;

uses
  FMX.Forms,
  RadiantPlaylistForm in 'RadiantPlaylistForm.pas' {frmPlaylist};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPlaylist, frmPlaylist);
  Application.Run;
end.
