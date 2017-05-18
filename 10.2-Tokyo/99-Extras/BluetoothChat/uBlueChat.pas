unit uBlueChat;

interface

uses SysUtils, System.Classes, System.StrUtils, System.Threading,
  System.Bluetooth, System.Types, System.Generics.Collections,
{$IFDEF MACOS}
  Macapi.CoreFoundation,
{$ENDIF}
  FMX.Memo;

type
  TTextEvent = procedure(const Sender: TObject; const AText: string;
    const aDeviceName: string) of object;

type
  TBlueChatWriter = class(TComponent)
  private
    fSendUUID: TGUID;

    fDeviceName: string;
    fBlueDevice: TBluetoothDevice;

    fSendSocket: TBluetoothSocket;
    procedure SetBlueDevice(Value: string);
  public
    constructor Create(AOwner: TComponent); override;

    function SendMessage(sMessage: string): boolean;
    property DeviceName: string read fDeviceName write SetBlueDevice;
  end;

type
  TBlueChatReader = class(TComponent)
  private
    fReadUUID: TGUID;

    fDeviceName: string;
    fTaskReader: ITask;

    fReadSocket: TBluetoothSocket;
    fServerSocket: TBluetoothServerSocket;

    FOnTextReceived: TTextEvent;
    procedure SetOnTextReceived(const Value: TTextEvent);
  public
    constructor Create(AOwner: TComponent); override;
    procedure StartReader;
    procedure StopReader;

    property OnTextReceived: TTextEvent read FOnTextReceived
      write SetOnTextReceived;
    property DeviceName: string read fDeviceName write fDeviceName;
  end;

implementation

{ TBlueChatSend }

const
  cTimeOut: integer = 5000;

function FindBlueDevice(DeviceName: string): TBluetoothDevice;
var
  i: integer;
  aBTDeviceList: TBluetoothDeviceList;
begin
  aBTDeviceList := TBluetoothManager.Current.CurrentAdapter.PairedDevices;
  for i := 0 to aBTDeviceList.Count - 1 do
    if aBTDeviceList.Items[i].DeviceName = DeviceName then
      exit(aBTDeviceList.Items[i]);
  Result := nil;
end;

constructor TBlueChatWriter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fBlueDevice := nil;
  fSendSocket := nil;

  fSendUUID := StringToGuid('{14800546-CF05-481F-BE41-4EC0246D862D}');
end;

function TBlueChatWriter.SendMessage(sMessage: string): boolean;
begin
  try
    try
      if fBlueDevice = nil then
        raise Exception.Create('Select a bluetooth device first...');

      fSendSocket := fBlueDevice.CreateClientSocket(fSendUUID, False);
      if fSendSocket = nil then
        raise Exception.Create('Cannot create client socket to ' + fDeviceName);

      fSendSocket.Connect;
      if fSendSocket.Connected then
        fSendSocket.SendData(TEncoding.ASCII.GetBytes(sMessage))
      else
        raise Exception.Create('Cannot connect to ' + fDeviceName);

      Result := True;
    except
      on E: Exception do
        raise Exception.Create('Exception raised sending message: ' +
          E.Message);
    end;
  finally
    if fSendSocket.Connected then
      fSendSocket.Close;
    FreeAndNil(fSendSocket);
  end;
end;

procedure TBlueChatWriter.SetBlueDevice(Value: string);
begin
  if Value <> fDeviceName then
  begin
    fDeviceName := Value;
    fBlueDevice := FindBlueDevice(fDeviceName);
    if fBlueDevice = nil then
      raise Exception.Create('Cannot find device ' + fDeviceName);
  end;
end;

{ TBlueChatRead }

constructor TBlueChatReader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fTaskReader := nil;
  fReadSocket := nil;
  fServerSocket := nil;

  fReadUUID := StringToGuid('{14800546-CF05-481F-BE41-4EC0246D862D}');
end;

procedure TBlueChatReader.SetOnTextReceived(const Value: TTextEvent);
begin
  FOnTextReceived := Value;
end;

procedure TBlueChatReader.StartReader;
var
  Data: TBytes;
begin
  if fServerSocket <> nil then
    FreeAndNil(fServerSocket);

  fServerSocket := TBluetoothManager.Current.CurrentAdapter.CreateServerSocket
    ('FMXBlueChat', fReadUUID, False);

  fTaskReader := TTask.Create(
    procedure()
    begin
      fReadSocket := nil;
      while (fTaskReader.Status <> TTaskStatus.Canceled) do
      begin
        try
          fReadSocket := fServerSocket.Accept(cTimeOut);
          if (fReadSocket <> nil) and (fReadSocket.Connected) then
          begin
            Data := fReadSocket.ReceiveData;
            if Length(Data) > 0 then
            begin
              if Assigned(FOnTextReceived) then
                FOnTextReceived(Self, TEncoding.ASCII.GetString(Data),
                  fDeviceName);
            end;
          end;
        except
          on E: Exception do
          begin
            FreeAndNil(fReadSocket);
            raise Exception.Create('Exception raised receiving message: ' +
              E.Message);
          end;
        end;
        FreeAndNil(fReadSocket);
      end;
    end);
  fTaskReader.Start;
end;

procedure TBlueChatReader.StopReader;
begin
  if fTaskReader <> nil then
    if fTaskReader.Status <> TTaskStatus.Canceled then
      fTaskReader.Cancel;
end;

end.
