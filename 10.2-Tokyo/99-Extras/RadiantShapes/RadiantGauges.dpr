program RadiantGauges;

uses
  FMX.Forms,
  RadiantGaugesForm in 'RadiantGaugesForm.pas' {frmGauges};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGauges, frmGauges);
  Application.Run;
end.
