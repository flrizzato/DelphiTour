program RadiantGears;

uses
  FMX.Forms,
  RadiantGearsForm in 'RadiantGearsForm.pas' {frmGears};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGears, frmGears);
  Application.Run;
end.
