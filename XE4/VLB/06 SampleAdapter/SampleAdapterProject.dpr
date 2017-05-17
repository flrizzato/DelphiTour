program SampleAdapterProject;

uses
  Vcl.Forms,
  SampleAdapterForm in 'SampleAdapterForm.pas' {Form259},
  SampleAdapter1 in 'SampleAdapter1.pas',
  Data.Bind.ObjectScope in '..\..\..\Data.Bind.ObjectScope.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm259, Form259);
  Application.Run;
end.
