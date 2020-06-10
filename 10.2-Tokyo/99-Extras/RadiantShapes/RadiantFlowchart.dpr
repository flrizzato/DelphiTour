program RadiantFlowchart;

uses
  FMX.Forms,
  RadiantFlowchartForm in 'RadiantFlowchartForm.pas' {frmFlowchart};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFlowchart, frmFlowchart);
  Application.Run;
end.
