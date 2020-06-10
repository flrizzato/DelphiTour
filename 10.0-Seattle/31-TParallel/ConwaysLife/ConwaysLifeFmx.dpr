program ConwaysLifeFmx;

uses
  FMX.Forms,
  LifeUnitFmx in 'LifeUnitFmx.pas' {Form5},
  LifeEngine in 'LifeEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
