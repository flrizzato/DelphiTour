program ListBoxStyled;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit11 in 'Unit11.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
