program wCheckPassword;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  ActiveDs_TLB in 'ActiveDs_TLB.pas',
  ADSISearch in 'ADSISearch.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TFrmMain, FrmMain);
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF DEBUG}
  Application.Run;
end.
