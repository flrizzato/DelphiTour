program AppAnalyticsExceptionOPFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  ExceptTestUnit in 'ExceptTestUnit.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
