program StringsBasics;

uses
  System.StartUpCopy,
  FMX.Forms,
  StirngsBasicsForm in 'StirngsBasicsForm.pas' {TabbedForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTabbedForm, TabbedForm);
  Application.Run;
end.
