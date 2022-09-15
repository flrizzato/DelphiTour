program FDMultiDBv3;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Polar Light');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
