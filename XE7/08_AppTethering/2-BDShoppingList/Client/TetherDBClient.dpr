program TetherDBClient;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  System.Tether.AppProfile in '..\..\..\System.Tether.AppProfile.pas',
  System.Tether.Consts in '..\..\..\System.Tether.Consts.pas',
  System.Tether.Manager in '..\..\..\System.Tether.Manager.pas',
  System.Tether.NetworkAdapter in '..\..\..\System.Tether.NetworkAdapter.pas',
  System.Tether.TCPProtocol in '..\..\..\System.Tether.TCPProtocol.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
