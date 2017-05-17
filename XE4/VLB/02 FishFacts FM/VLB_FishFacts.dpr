program VLB_FishFacts;

uses
  FMX.Forms,
  frmFishmain in 'frmFishmain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
