{===============================================================================
  RadiantMediaPlayerForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantMediaPlayerForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Media,
  FMX.Objects,
  FMX.Layouts,
  FMX.Effects,
  Radiant.Shapes;

type
  TfrmMediaPlayer = class(TForm)
    MediaPlayerControl1: TMediaPlayerControl;
    MediaPlayer1: TMediaPlayer;
    lytFastForward: TLayout;
    FastForwardChevron1: TRadiantChevron;
    FastForwardChevron2: TRadiantChevron;
    lytRewind: TLayout;
    RewindChevron1: TRadiantChevron;
    RewindChevron2: TRadiantChevron;
    PlayTriangle: TRadiantTriangle;
    lytPlay: TLayout;
    lytEjectOpen: TLayout;
    EjectOpenRectangle: TRadiantRectangle;
    EjectOpenTriangle: TRadiantTriangle;
    lytPower: TLayout;
    PowerRectangle: TRadiantRectangle;
    PowerSector: TRadiantSector;
    lytPause: TLayout;
    PauseRectangle1: TRadiantRectangle;
    PauseRectangle2: TRadiantRectangle;
    PauseGlowEffect: TGlowEffect;
    ConfigureGear: TRadiantGear;
    trkMediaPlayer: TTrackBar;
    lytFullScreen: TLayout;
    FullScreenGlowEffect: TGlowEffect;
    FullScreenFrame: TRadiantFrame;
    FullScreenArrow: TRadiantArrow;
    lytConfigure: TLayout;
    lytControlPanel: TLayout;
    lytButtons: TLayout;
    lytButtonsRight: TLayout;
    lytPlayback: TLayout;
    tmrPlayback: TTimer;
    dlgOpen: TOpenDialog;
    lytButtonsLeft: TLayout;
    trkVolume: TTrackBar;
    lytStop: TLayout;
    StopSquare: TRadiantSquare;
    RadiantRectangle1: TRadiantRectangle;
    FastForwardGlowEffect: TGlowEffect;
    ConfigureGlowEffect: TGlowEffect;
    EjectOpenGlowEffect: TGlowEffect;
    PowerGlowEffect: TGlowEffect;
    PlayGlowEffect: TGlowEffect;
    RewindGlowEffect: TGlowEffect;
    StopGlowEffect: TGlowEffect;
    StyleBook1: TStyleBook;
    procedure lytEjectOpenClick(Sender: TObject);
    procedure lytPlayClick(Sender: TObject);
    procedure lytPauseClick(Sender: TObject);
    procedure lytFullScreenClick(Sender: TObject);
    procedure lytConfigureClick(Sender: TObject);
    procedure lytPowerClick(Sender: TObject);
    procedure lytStopClick(Sender: TObject);
    procedure trkVolumeChange(Sender: TObject);
    procedure trkMediaPlayerChange(Sender: TObject);
    procedure tmrPlaybackTimer(Sender: TObject);
    procedure lytFastForwardClick(Sender: TObject);
    procedure lytRewindClick(Sender: TObject);
    procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure ButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure ButtonMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFileName: string;
    FVideoLoaded: Boolean;
    FButtonColor: TAlphaColor;
    FHighlightColor: TAlphaColor;

    procedure UpdateButtonStates;
    procedure AnimateButtonDown( Control: TControl );
    procedure AnimateButtonUp( Control: TControl );
    procedure UpdateButtonColors;
  public
  end;

var
  frmMediaPlayer: TfrmMediaPlayer;

implementation

{$R *.fmx}

uses
  FMX.Ani,
  RadiantMediaPlayerConfigForm;


{=============================}
{== TfrmMediaPlayer Methods ==}
{=============================}


procedure TfrmMediaPlayer.FormCreate(Sender: TObject);
begin
  FButtonColor := $FF35C9FD;
  FHighlightColor := $FFBCF1FF;
  UpdateButtonColors;
end;


procedure TfrmMediaPlayer.lytEjectOpenClick(Sender: TObject);
begin
  dlgOpen.Filter := TMediaCodecManager.GetFilterString;
  if dlgOpen.Execute then
  begin
    FFileName := dlgOpen.FileName;
    MediaPlayer1.FileName := dlgOpen.FileName;
    FVideoLoaded := True;
    UpdateButtonStates;

    if MediaPlayer1.Media <> nil then
    begin
//      Label1.Text := IntToStr( MediaPlayer1.Media.VideoSize.Truncate.X ) + 'x' + IntToStr( MediaPlayer1.Media.VideoSize.Truncate.Y ) + 'px ' +
//                     IntToStr( MediaPlayer1.Media.Duration div MediaTimeScale ) + 'ms';
      trkMediaPlayer.Max := MediaPlayer1.Media.Duration;
      trkVolume.Max := MediaPlayer1.Media.Volume;
      trkVolume.Value := MediaPlayer1.Media.Volume;
    end;
  end;
end;


procedure TfrmMediaPlayer.lytPlayClick(Sender: TObject);
begin
  MediaPlayer1.Play;
  tmrPlayback.Enabled := True;
  UpdateButtonStates;
end;


procedure TfrmMediaPlayer.lytPauseClick(Sender: TObject);
begin
  MediaPlayer1.Stop;
  tmrPlayback.Enabled := False;
  UpdateButtonStates;
end;


procedure TfrmMediaPlayer.lytFastForwardClick(Sender: TObject);
begin
  trkMediaPlayer.Value := trkMediaPlayer.Value + ( trkMediaPlayer.Max / 20 );
end;


procedure TfrmMediaPlayer.lytRewindClick(Sender: TObject);
begin
  trkMediaPlayer.Value := trkMediaPlayer.Value - ( trkMediaPlayer.Max / 20 );
end;


procedure TfrmMediaPlayer.lytStopClick(Sender: TObject);
begin
  MediaPlayer1.Clear;
  tmrPlayback.Enabled := False;
  UpdateButtonStates;
end;


procedure TfrmMediaPlayer.UpdateButtonStates;
var
  VideoPlaying: Boolean;
begin
  VideoPlaying := MediaPlayer1.State = TMediaState.Playing;

  lytPlay.Enabled := FVideoLoaded;

  lytPause.Visible := VideoPlaying;
  lytPlay.Visible := not VideoPlaying;


  lytRewind.Enabled := VideoPlaying;
  lytFastForward.Enabled := VideoPlaying;
  lytStop.Enabled := VideoPlaying;
end;


procedure TfrmMediaPlayer.lytFullScreenClick(Sender: TObject);
begin
  if WindowState <> TWindowState.wsMaximized then
  begin
    WindowState := TWindowState.wsMaximized;
    FullScreenArrow.RotationAngle := 225;
    FullScreenArrow.Position.X := 2;
    FullScreenArrow.Position.Y := 6;
  end
  else
  begin
    WindowState := TWindowState.wsNormal;
    FullScreenArrow.RotationAngle := 45;
    FullScreenArrow.Position.X := 10;
    FullScreenArrow.Position.Y := 2;
  end;
end;


procedure TfrmMediaPlayer.lytConfigureClick(Sender: TObject);
begin
  frmConfiguration.cbxButtonColor.Color := FButtonColor;
  frmConfiguration.cbxHighlightColor.Color := FHighlightColor;
  if frmConfiguration.ShowModal = mrOK then
  begin
    FButtonColor := frmConfiguration.SelectedButtonColor;
    FHighlightColor := frmConfiguration.SelectedHighlightColor;

    UpdateButtonColors;
  end;
end;


procedure TfrmMediaPlayer.lytPowerClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmMediaPlayer.trkMediaPlayerChange(Sender: TObject);
begin
  if trkMediaPlayer.Tag = 0 then
  begin
    MediaPlayer1.CurrentTime := Round( trkMediaPlayer.Value );
  end;
end;


procedure TfrmMediaPlayer.trkVolumeChange(Sender: TObject);
begin
  MediaPlayer1.Volume := trkVolume.Value;
end;


procedure TfrmMediaPlayer.tmrPlaybackTimer(Sender: TObject);
begin
  trkMediaPlayer.Tag := 1;
  trkMediaPlayer.Value := MediaPlayer1.CurrentTime;
  trkMediaPlayer.Tag := 0;
  if trkMediaPlayer.Value = trkMediaPlayer.Max then
  begin
    MediaPlayer1.Stop;
    tmrPlayback.Enabled := False;
    UpdateButtonStates;
  end;
end;


procedure TfrmMediaPlayer.AnimateButtonDown( Control: TControl );
begin
  // TAnimator.AnimateFloat( Control, 'Opacity', 0.2, 0.1 );
  {$WARN SYMBOL_DEPRECATED OFF}
  // Control.AnimateFloat was deprecated in XE7, but XE6 does not have TAnimator.AnimateFloat..
  Control.AnimateFloat( 'Opacity', 0.2, 0.1 );
  {$WARN SYMBOL_DEPRECATED ON}
end;


procedure TfrmMediaPlayer.AnimateButtonUp( Control: TControl );
begin
  // TAnimator.AnimateFloat( Control, 'Opacity', 1.0, 0.1 );
  {$WARN SYMBOL_DEPRECATED OFF}
  // Control.AnimateFloat was deprecated in XE7, but XE6 does not have TAnimator.AnimateFloat..
  Control.AnimateFloat( 'Opacity', 1.0, 0.1 );
  {$WARN SYMBOL_DEPRECATED ON}
end;



procedure TfrmMediaPlayer.ButtonMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single );
begin
  AnimateButtonDown( Sender as TControl );
end;


procedure TfrmMediaPlayer.ButtonMouseUp( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single );
begin
  AnimateButtonUp( Sender as TControl );
end;


procedure TfrmMediaPlayer.ButtonMouseLeave(Sender: TObject);
begin
  ( Sender as TControl ).Opacity := 1.0;
end;


procedure TfrmMediaPlayer.UpdateButtonColors;
var
  SectorRing: TRadiantSectorRing;
  Marker: TRadiantMarker;
  GlowEffect: TGlowEffect;
begin
  // EjectOpen
  EjectOpenGlowEffect.GlowColor := FHighlightColor;
  EjectOpenRectangle.Fill.Color := FButtonColor;
  EjectOpenTriangle.Fill.Color := FButtonColor;

  // Power
  PowerGlowEffect.GlowColor := FHighlightColor;
  PowerRectangle.Fill.Color := FButtonColor;
  PowerSector.Fill.Color := FButtonColor;

  // Stop
  StopGlowEffect.GlowColor := FHighlightColor;
  StopSquare.Fill.Color := FButtonColor;

  // Rewind
  RewindGlowEffect.GlowColor := FHighlightColor;
  RewindChevron1.Fill.Color := FButtonColor;
  RewindChevron2.Fill.Color := FButtonColor;

  // Play
  PlayGlowEffect.GlowColor := FHighlightColor;
  PlayTriangle.Fill.Color := FButtonColor;

  // Pause
  PauseGlowEffect.GlowColor := FHighlightColor;
  PauseRectangle1.Fill.Color := FButtonColor;
  PauseRectangle2.Fill.Color := FButtonColor;

  // FastForward
  FastForwardGlowEffect.GlowColor := FHighlightColor;
  FastForwardChevron1.Fill.Color := FButtonColor;
  FastForwardChevron2.Fill.Color := FButtonColor;

  // Volume
  SectorRing := StyleBook1.Style.FindStyleResource( 'radiantsectorring1' ) as TRadiantSectorRing;
  if SectorRing <> nil then
  begin
    SectorRing.Fill.Color := FButtonColor;
    GlowEffect := SectorRing.FindStyleResource( 'SectorRingGlowEffect' ) as TGlowEffect;
    if GlowEffect <> nil then
      GlowEffect.GlowColor := FHighlightColor;
  end;
  // By resetting the StyleLookup, the updated style will get re-applied to the control
  trkVolume.StyleLookup := 'trkVolumeStyle1';

  // FullScreen
  FullScreenGlowEffect.GlowColor := FHighlightColor;
  FullScreenFrame.Fill.Color := FButtonColor;
  FullScreenArrow.Fill.Color := FButtonColor;

  // Configure
  ConfigureGlowEffect.GlowColor := FHighlightColor;
  ConfigureGear.Fill.Color := FButtonColor;

  // Playback
  Marker := StyleBook1.Style.FindStyleResource( 'radiantmarker1' ) as TRadiantMarker;
  if Marker <> nil then
  begin
    Marker.Fill.Color := FButtonColor;
    GlowEffect := Marker.FindStyleResource( 'MarkerGlowEffect' ) as TGlowEffect;
    if GlowEffect <> nil then
      GlowEffect.GlowColor := FHighlightColor;
  end;
  // By resetting the StyleLookup, the updated style will get re-applied to the control
  trkMediaPlayer.StyleLookup := 'trkMediaPlayerStyle1';
end;


end.
