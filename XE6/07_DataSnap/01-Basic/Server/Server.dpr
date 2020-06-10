program Server;
{$APPTYPE CONSOLE}

{$R *.dres}

uses
  System.SysUtils,
  Winapi.Windows,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  Datasnap.DSSession,
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDataModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule};

{$R *.res}

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure RunServer(APort: Integer);
var
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
  LServer: TIdHTTPWebBrokerBridge;
begin
  Writeln(Format('Starting HTTP Server on port %d', [APort]));
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;
    LServer.Active := True;
    Writeln('Press ESC to stop the server');
    LHandle := GetStdHandle(STD_INPUT_HANDLE);
    while True do
    begin
      ReadConsoleInput(LHandle, LInputRecord, 1, LEvent);
      if (LInputRecord.EventType = KEY_EVENT) and
      LInputRecord.Event.KeyEvent.bKeyDown and
      (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
        break;
    end;
    TerminateThreads();
  finally
    LServer.Free;
  end;
end;

begin
  try
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
    RunServer(9090);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.
