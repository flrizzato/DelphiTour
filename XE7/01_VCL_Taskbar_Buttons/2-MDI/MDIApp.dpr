program MDIApp;

uses
  Vcl.Forms,
  MainMDIForm in 'MainMDIForm.pas' {Form2},
  MDIChild in 'MDIChild.pas' {FrMDIChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
