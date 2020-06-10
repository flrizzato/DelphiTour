program FireDAC_LocalSQL;

uses
  Vcl.Forms,
  mainformu in 'mainformu.pas' {Form1},
  datamodu in 'datamodu.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
