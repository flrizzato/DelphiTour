program RadiantTicTacToe;

uses
  FMX.Forms,
  RadiantTicTacToeForm in 'RadiantTicTacToeForm.pas' {frmTicTacToe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTicTacToe, frmTicTacToe);
  Application.Run;
end.
