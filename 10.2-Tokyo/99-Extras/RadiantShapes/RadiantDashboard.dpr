program RadiantDashboard;

uses
  FMX.Forms,
  RadiantDashboardForm in 'RadiantDashboardForm.pas' {frmDashboard};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDashboard, frmDashboard);
  Application.Run;
end.
