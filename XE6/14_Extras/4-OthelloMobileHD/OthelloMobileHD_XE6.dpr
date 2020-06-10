program OthelloMobileHD_XE6;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  OthelloBoard in 'OthelloBoard.pas',
  OthelloCounters in 'OthelloCounters.pas',
  OthelloCounterSet in 'OthelloCounterSet.pas',
  OthelloGame in 'OthelloGame.pas' {Othello};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TOthello, Othello);
  Application.Run;
end.
