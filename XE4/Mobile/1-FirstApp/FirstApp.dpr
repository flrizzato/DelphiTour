program FirstApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Consts in 'FMX.Consts.pas',
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
