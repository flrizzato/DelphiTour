unit SampleAdapter1Reg;

interface

procedure Register;

implementation

uses System.Classes, SampleAdapter1;

procedure Register;
begin
  RegisterComponents('LiveBindings Samples', [TContactsAdapter]);

end;

end.
