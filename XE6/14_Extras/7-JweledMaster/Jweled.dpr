program Jweled;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmGameUnit in 'frmGameUnit.pas' {frmGame};

{$R *.res}

begin
  {$IFDEF DEBUG}
  {$IFDEF MSWINDOWS}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  {$ENDIF}
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait];
  Application.CreateForm(TfrmGame, frmGame);
  Application.Run;
end.
