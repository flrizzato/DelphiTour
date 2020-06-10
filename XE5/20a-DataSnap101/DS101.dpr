program DS101;

uses
  Vcl.Forms,
  DS101MainForm in 'DS101MainForm.pas' {Form1},
  DS101ServerMethodsUnit in 'DS101ServerMethodsUnit.pas' {ServerMethods1: TDSServerModule},
  DS101ServerContainerUnit in 'DS101ServerContainerUnit.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

