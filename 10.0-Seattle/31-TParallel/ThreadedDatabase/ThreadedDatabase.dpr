program ThreadedDatabase;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  FMX.Types,
  UnitFormMain in 'UnitFormMain.pas' {FormMain},
  UnitDataMain in 'UnitDataMain.pas' {DataModuleMain: TDataModule},
  UnitDataThread in 'UnitDataThread.pas' {DataModuleThread: TDataModule};

{$R *.res}

begin
  Log.Timestamp('START ThreadedDatabase');
  Application.Initialize;
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModuleThread, DataModuleThread);
  Application.Run;
end.
