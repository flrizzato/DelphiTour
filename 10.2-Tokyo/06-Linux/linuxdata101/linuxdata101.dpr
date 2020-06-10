program linuxdata101;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMainDM in 'uMainDM.pas' {MainDM: TDataModule};

begin
  try
    DisplayData;
    SaveDataTXT;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
