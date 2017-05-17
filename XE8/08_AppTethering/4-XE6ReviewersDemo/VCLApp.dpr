program VCLApp;

uses
  Vcl.Forms,
  VCLApp_MainForm in 'VCLApp_MainForm.pas' {Form3},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
