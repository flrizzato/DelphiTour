program OthelloMobileHD;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  OthelloGame in 'OthelloGame.pas' {Othello},
  OthelloCounters in 'OthelloCounters.pas',
  OthelloBoard in 'OthelloBoard.pas',
  OthelloCounterSet in 'OthelloCounterSet.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.soPortrait, TFormOrientation.soInvertedPortrait];
  Application.CreateForm(TOthello, Othello);
  Application.Run;
end.
