program BufferedStream;

uses
  Vcl.Forms,
  BufferedStream_MainForm in 'BufferedStream_MainForm.pas' {FormReaderWriter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormReaderWriter, FormReaderWriter);
  Application.Run;
end.
