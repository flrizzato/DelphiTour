program VLB_TFoo;

uses
  FMX.Forms,
  frmFoo in 'frmFoo.pas' {FormFoo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFoo, FormFoo);
  Application.Run;
end.
