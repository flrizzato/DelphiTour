unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Actions, System.IOUtils, System.Math,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, FMX.TabControl, FMX.Objects, System.UIConsts,
  FMX.Gestures, FMX.ActnList, FMX.Memo, FMX.Edit,
  NetworkState, OpenViewUrl, SendMail, BluetoothAdapter, BarCodeReader,
  ToastMessage
{$IFDEF ANDROID}
    , Androidapi.JNI.JavaTypes, Androidapi.JNIBridge;
{$ENDIF}
{$IFDEF IOS}
;
{$ENDIF}

const
  bufferSize = 500; // BLUETOOTH receive buffer

type
  TMainForm = class(TForm)
    TabControlMain: TTabControl;
    tabOpenURL: TTabItem;
    tabNetworkStatus: TTabItem;
    ToolBar1: TToolBar;
    butOpen: TSpeedButton;
    lsbMain: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ToolBar2: TToolBar;
    CircleNET: TCircle;
    CircleWiFi: TCircle;
    Circle3G: TCircle;
    timNetwork: TTimer;
    SwitchNetwork: TSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    ChangeTabAction0: TChangeTabAction;
    ChangeTabAction1: TChangeTabAction;
    tabSendMail: TTabItem;
    edtTo: TEdit;
    edtSubject: TEdit;
    memBody: TMemo;
    butSend: TButton;
    ChangeTabAction2: TChangeTabAction;
    tabBluetooth: TTabItem;
    lstBluetooth: TListBox;
    Label5: TLabel;
    memBluetooth: TMemo;
    Panel1: TPanel;
    butBluetoothSend: TSpeedButton;
    Edit1: TEdit;
    ChangeTabAction3: TChangeTabAction;
    Panel2: TPanel;
    Label4: TLabel;
    butBluetoothRefresh: TSpeedButton;
    tabBarCode: TTabItem;
    ToolBar3: TToolBar;
    butBarcode: TButton;
    lstBarCode: TListBox;
    butQRCode: TSpeedButton;
    ChangeTabAction4: TChangeTabAction;
    tabToast: TTabItem;
    Button1: TButton;
    ChangeTabAction5: TChangeTabAction;
    procedure butOpenClick(Sender: TObject);
    procedure timNetworkTimer(Sender: TObject);
    procedure SwitchNetworkSwitch(Sender: TObject);
    procedure TabControlMainGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure butSendClick(Sender: TObject);
    procedure lstBluetoothItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure butBluetoothSendClick(Sender: TObject);
    procedure butBluetoothRefreshClick(Sender: TObject);
    procedure butBarcodeClick(Sender: TObject);
    procedure butQRCodeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    fZBarReader: TBarCodeReader;
    fNetworkStatus: TMobileNetworkStatus;
{$IFDEF ANDROID}
    uid: JUUID; // UUID for SPP traffic
    targetMAC: string; // remote MAC address of the selected
    ostream: JOutputStream;
    istream: JInputstream;
    Sock: JBluetoothSocket;
    Adapter: JBluetoothAdapter; // Local BLUETOOTH adapter
    remoteDevice: JBluetoothDevice;
{$ENDIF}
    procedure MyZBarReaderGetResult(Sender: TBarCodeReader; AResult: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$IFDEF ANDROID}

uses uSplashScreen;
{$ENDIF}

procedure TMainForm.butOpenClick(Sender: TObject);
begin
  if lsbMain.Selected <> nil then
    if lsbMain.Selected.Text <> '' then
      OpenURL(lsbMain.Selected.Text);
end;

procedure TMainForm.butBarcodeClick(Sender: TObject);
begin
  fZBarReader.Show;
end;

procedure TMainForm.butQRCodeClick(Sender: TObject);
begin
  fZBarReader.Show(True);
end;

procedure TMainForm.butSendClick(Sender: TObject);
begin
  CreateEmail(edtTo.Text, edtSubject.Text, memBody.Text, '');
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  AndroidToast('Using Native Toast for Android!', ShortToast);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
  ShowSplashScreen;
  butQRCode.Visible := True;
{$ENDIF}
  fZBarReader := TBarCodeReader.Create(Self);
  fZBarReader.OnGetResult := MyZBarReaderGetResult;
  fNetworkStatus := TMobileNetworkStatus.Create;
end;

procedure TMainForm.lstBluetoothItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  memBluetooth.Lines.Clear;
  memBluetooth.Lines.add('Selected ' + Item.Text);

{$IFDEF ANDROID}
  targetMAC := Item.Text.Split(['='])[1];
  if trim(targetMAC) = '' then
    exit;

  Adapter := TJBluetoothAdapter.JavaClass.getDefaultAdapter;
  Adapter.cancelDiscovery;
  remoteDevice := Adapter.getRemoteDevice(stringtojstring(targetMAC));

  memBluetooth.Lines.add('Connecting to ' + Item.Text);

  Sock := remoteDevice.createRfcommSocketToServiceRecord(uid);
  try
    Sock.connect;
  except
    memBluetooth.Lines.add('?Could not create service record');
  end;

  if not Sock.isConnected then
  begin
    memBluetooth.Lines.add('Failed to connect to ' + targetMAC);
    memBluetooth.Lines.add('Try again');
    exit
  end;
  memBluetooth.Lines.Clear;
  memBluetooth.Lines.add('Connected - click send to transmit command');

  ostream := Sock.getOutputStream; // record io streams
  istream := Sock.getInputStream;
{$ENDIF}
end;

procedure TMainForm.MyZBarReaderGetResult(Sender: TBarCodeReader;
  AResult: string);
begin
  lstBarCode.Items.Insert(0, AResult);
end;

procedure TMainForm.butBluetoothRefreshClick(Sender: TObject);
{$IFDEF ANDROID}
var
  s: string;
{$ENDIF}
begin
{$IFDEF ANDROID}
  // Make sure bluetooth is enabled
  s := checkBluetooth;

  if pos('disabled', s) <> 0 then
    exit;

  // This is the well known SPP UUID for connection to a Bluetooth serial device
  uid := TJUUID.JavaClass.fromString
    (stringtojstring('00001101-0000-1000-8000-00805F9B34FB'));

  lstBluetooth.Items.AddStrings(getbonded);
{$ENDIF}
end;

procedure TMainForm.butBluetoothSendClick(Sender: TObject);
{$IFDEF ANDROID}
var
  len, idx, i: integer;
  s: string;
  buffer: TJavaArray<byte>;
{$ENDIF}
begin
{$IFDEF ANDROID}
  memBluetooth.Lines.Clear;
  s := '$' + Edit1.Text + #13;

  // format command for BU1 twig and emit on ostream
  for i := 0 to pred(length(s)) do
    ostream.write(ord(s[i])); // 0 based

  for i := 1 to 100 do
  begin
    if istream.available > 50 then
      break;
    sleep(100);
  end;
  len := min(bufferSize, istream.available);
  if len = 0 then
  begin
    showmessage('Nothing read from the device...');
    exit;
  end;

  buffer := TJavaArray<byte>.Create(len);
  istream.read(buffer, 0, len);

  s := '';
  idx := 0;
  while len > 0 do
  begin
    s := s + char(buffer[idx]);
    if trim(s) <> s then
    begin
      if trim(s) <> '' then
        memBluetooth.Lines.add(trim(s));
      s := '';
    end;
    dec(len);
    inc(idx);
  end;
  if trim(s) <> '' then
    memBluetooth.Lines.add(trim(s));
{$ENDIF}
end;

procedure TMainForm.SwitchNetworkSwitch(Sender: TObject);
begin
  timNetwork.Enabled := SwitchNetwork.Enabled;
end;

procedure TMainForm.TabControlMainGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControlMain.TabIndex = 0 then
        begin
          ChangeTabAction1.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 1 then
        begin
          ChangeTabAction2.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 2 then
        begin
          ChangeTabAction3.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 3 then
        begin
          ChangeTabAction4.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 4 then
        begin
          ChangeTabAction5.ExecuteTarget(Self);
          Handled := True;
        end;
      end;
    sgiRight:
      begin
        if TabControlMain.TabIndex = 5 then
        begin
          ChangeTabAction4.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 4 then
        begin
          ChangeTabAction3.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 3 then
        begin
          ChangeTabAction2.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 2 then
        begin
          ChangeTabAction1.ExecuteTarget(Self);
          Handled := True;
        end
        else if TabControlMain.TabIndex = 1 then
        begin
          ChangeTabAction0.ExecuteTarget(Self);
          Handled := True;
        end;
      end;
  end;
end;

procedure TMainForm.timNetworkTimer(Sender: TObject);
begin
  if fNetworkStatus.isConnected then
    CircleNET.Fill.Color := claGreen
  else
    CircleNET.Fill.Color := claRed;

  if fNetworkStatus.IsWiFiConnected then
    CircleWiFi.Fill.Color := claGreen
  else
    CircleWiFi.Fill.Color := claRed;

  if fNetworkStatus.IsMobileConnected then
    Circle3G.Fill.Color := claGreen
  else
    Circle3G.Fill.Color := claRed;
end;

end.
