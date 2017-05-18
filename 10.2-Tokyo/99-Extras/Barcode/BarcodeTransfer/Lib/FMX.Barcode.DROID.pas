unit FMX.Barcode.DROID;

// based on Brian Long work around Activities (http://blong.com)
// will use the zxing app installed in the device to scan
// for more info see https://github.com/zxing/zxing/wiki/Scanning-Via-Intent

interface

uses
  System.Classes,
  System.SysUtils,
  System.Messaging
  {$IFDEF ANDROID}
  , FMX.Helpers.Android
  , Androidapi.Helpers
  , Androidapi.JNIBridge
  , Androidapi.JNI.JavaTypes
  , Androidapi.JNI.GraphicsContentViewText
  , Androidapi.JNI.App
  , Androidapi.JNI.Net
  , Androidapi.JNI.Toast
  {$ENDIF}
  ;

const ScanRequestCode: Integer = 0;

{$IFDEF ANDROID}
type
  TFMXBarcodeGetResult = procedure(Sender: TObject; AResult: String) of object;

  TFMXBarcode = class(TComponent)
  private
    FOnGetResult: TFMXBarcodeGetResult;
    FMessageSubscriptionID: Integer;
    function LaunchActivityForResult(const Intent: JIntent;
      RequestCode: Integer): Boolean;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    function DoActivityResult(RequestCode, ResultCode: Integer;
      Data: JIntent): Boolean;
    procedure InternalLaunchQRScanner(RequestCode: Integer;
      bQRCode: Boolean = False);
  public
    procedure Show(bQRCode: Boolean = False);
    property OnGetResult: TFMXBarcodeGetResult read FOnGetResult
      write FOnGetResult;
  end;
{$ENDIF}

implementation

{ TBarcodeDROID }

{$IFDEF ANDROID}
procedure TFMXBarcode.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
begin
  if M is TMessageResultNotification then
    DoActivityResult(TMessageResultNotification(M).RequestCode, TMessageResultNotification(M).ResultCode,
      TMessageResultNotification(M).Value);
end;

function TFMXBarcode.LaunchActivityForResult(const Intent: JIntent;
  RequestCode: Integer): Boolean;
var
  ResolveInfo: JResolveInfo;
begin
  ResolveInfo := TAndroidHelper.Activity.getPackageManager.resolveActivity(Intent, 0);
  Result := ResolveInfo <> nil;
  if Result then
    TAndroidHelper.Activity.startActivityForResult(Intent, RequestCode);
end;

procedure TFMXBarcode.InternalLaunchQRScanner(RequestCode: Integer;
  bQRCode: Boolean = False);
var
  Intent: JIntent;
begin
  Intent := TJIntent.JavaClass.init
    (StringToJString('com.google.zxing.client.android.SCAN'));
  Intent.setPackage(StringToJString('com.google.zxing.client.android'));
  if bQRCode then
    Intent.putExtra(StringToJString('SCAN_MODE'),
      StringToJString('QR_CODE_MODE'));
  if not LaunchActivityForResult(Intent, RequestCode) then
    Toast('Cannot display QR scanner', ShortToast);
end;

function TFMXBarcode.DoActivityResult(RequestCode, ResultCode: Integer;
  Data: JIntent): Boolean;
var
  ScanContent, ScanFormat: string;
begin
  Result := False;

  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification,
    FMessageSubscriptionID);
  FMessageSubscriptionID := 0;

  if RequestCode = ScanRequestCode then
  begin
    if ResultCode = TJActivity.JavaClass.RESULT_OK then
    begin
      if Assigned(Data) then
      begin
        ScanContent := JStringToString
          (Data.getStringExtra(StringToJString('SCAN_RESULT')));
        ScanFormat := JStringToString
          (Data.getStringExtra(StringToJString('SCAN_RESULT_FORMAT')));
        OnGetResult(Self, ScanContent);
      end;
    end
    else if ResultCode = TJActivity.JavaClass.RESULT_CANCELED then
    begin
      Toast('You cancelled the scan', ShortToast);
      OnGetResult(Self, '');
    end;
    Result := True;
  end;
end;

procedure TFMXBarcode.Show(bQRCode: boolean);
begin
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage
    (TMessageResultNotification, HandleActivityMessage);
  InternalLaunchQRScanner(ScanRequestCode, bQRCode);
end;
{$ENDIF}

end.
