unit FMX.Barcode.IOS;

// based on TMSFMXZBarReader from TMS Software
// will use the libzbar linked statically in your project

interface

uses
  System.Classes
  {$IFDEF IOS}
  ,MacApi.ObjectiveC
  ,iOSApi.CocoaTypes
  ,iOSApi.Foundation
  ,iOSApi.UIKit
  ,iOSApi.QuartzCore
  ,iOSApi.CoreMedia
  ,iOSApi.CoreVideo
  ,iOSApi.AVFoundation
  {$ENDIF}
  ;

{$IFDEF IOS}
type
  TFMXBarcode = class;

  zbar_symbol_type_t = Cardinal;
  zbar_config_t = Cardinal;
  zbar_symbol_s = Pointer;
  zbar_symbol_set_s = Pointer;
  zbar_symbol_t = zbar_symbol_s;
  zbar_symbol_set_t = zbar_symbol_set_s;

  ZBarSymbolClass = interface(NSObjectClass)
  ['{35FAE888-4088-4C6D-8564-E65E728653E4}']
  end;

  ZBarSymbol = interface(NSObject)
  ['{D5B645FC-1CF7-4966-BA44-17787FADD524}']
    function data: NSString; cdecl;
    function initWithSymbol(symbol: zbar_symbol_t): Pointer; cdecl;
  end;
  TZBarSymbol = class(TOCGenericImport<ZBarSymbolClass, ZBarSymbol>) end;

  ZBarSymbolSetClass = interface(NSObjectClass)
  ['{A285BD5D-32AD-43F9-BA75-3F002DF4D7B2}']
  end;

  ZBarSymbolSet = interface(NSObject)
  ['{1A6960EA-B523-4057-81F6-0DB227FA8CA5}']
  function count: Integer; cdecl;
  function zbarSymbolSet: Pointer; cdecl;
  end;
  TZBarSymbolSet = class(TOCGenericImport<ZBarSymbolSetClass, ZBarSymbolSet>) end;


  ZBarReaderDelegate = interface(IObjectiveC)
    ['{2B97F7C6-8FA8-4BC3-B8B1-EB913D0A8F77}']
    procedure imagePickerController(reader: UIImagePickerController; didFinishPickingMediaWithInfo: NSDictionary); cdecl;
  end;

  TZBarReaderDelegate = class(TOCLocal, ZBarReaderDelegate)
  private
    {$IFDEF CPUARM}
    FZBarReader: TFMXBarcode;
    {$ENDIF}
  public
    procedure imagePickerController(reader: UIImagePickerController; didFinishPickingMediaWithInfo: NSDictionary); cdecl;
  end;

  ZBarImageScannerClass = interface(NSObjectClass)
    ['{A162FBBE-1BC8-451F-B783-302BDDF4E58B}']
  end;

  ZBarImageScanner = interface(NSObject)
    ['{779D918F-9CCF-4E4B-AA8E-C0461D3B6060}']
    procedure setSymbology(symbology: zbar_symbol_type_t; config: zbar_config_t; _to: NSInteger); cdecl;
  end;
  TZBarImageScanner = class(TOCGenericImport<ZBarImageScannerClass, ZBarImageScanner>) end;

  ZBarReaderViewControllerClass = interface(UIViewControllerClass)
  ['{A23DB840-F5FE-44FF-B80E-FA251FFE78B7}']
  end;
  ZBarReaderViewController = interface(UIViewController)
  ['{B9431ED6-C67D-46D8-ABB7-7CCAB9DB8703}']
     procedure setReaderDelegate(newValue: Pointer); cdecl;
     function readerDelegate: Pointer; cdecl;
     procedure setSupportedOrientationsMask(supportedOrientationsMask: NSUInteger); cdecl;
     function scanner: ZBarImageScanner; cdecl;
     procedure start; cdecl;
     procedure stop; cdecl;
   end;
  TZBarReaderViewController = class(TOCGenericImport<ZBarReaderViewControllerClass, ZBarReaderViewController>) end;

  TFMXBarcodeGetResult = procedure(Sender: TObject; AResult: String) of object;

  [ComponentPlatformsAttribute({$IF COMPILERVERSION > 28}pidiOSDevice32 or pidiOSDevice64{$ELSE}pidiOSDevice{$ENDIF})]
  TFMXBarcode = class(TComponent)
  private
    FOnGetResult: TFMXBarcodeGetResult;
    {$IFDEF CPUARM}
    FZBarReaderDelegate: TZBarReaderDelegate;
    FZBarReaderViewController: ZBarReaderViewController;
    {$ENDIF}
  public
    procedure Show(bQRCode: boolean = False);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnGetResult: TFMXBarcodeGetResult read FOnGetResult write FOnGetResult;
  end;

{$IFDEF IOS32}
const
  libZBar = 'ZBarSDK\libzbar_32.a';
{$ENDIF}

{$IFDEF IOS64}
const
  libZBar = 'ZBarSDK\libzbar_64.a';
{$ENDIF}

{$IFDEF CPUARM}
{$O-}
function lzld: ZBarReaderViewController; cdecl; external libZBar name 'OBJC_CLASS_$_ZBarReaderViewController';
{$O+}
function zbar_symbol_set_first_symbol(symbols : zbar_symbol_set_t): zbar_symbol_t; cdecl; external libZBar name 'zbar_symbol_set_first_symbol';
{$ENDIF}

{$ENDIF}

implementation

{$IFDEF IOS}
{$IF COMPILERVERSION > 26}
uses
  MacApi.Helpers;
{$ENDIF}
{$ENDIF}

{$IFDEF IOS}
function NSStrEx(AString: String): NSString;
begin
  {$IF COMPILERVERSION > 26}
  Result := StrToNSStr(AString);
  {$ELSE}
  Result := NSStr(AString);
  {$ENDIF}
end;

function GetSharedApplication: UIApplication;
begin
  Result := TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication);
end;

{ TTMSFMXZBarReader }

constructor TFMXBarcode.Create(AOwner: TComponent);
begin
  inherited;
  {$IFDEF CPUARM}
  FZBarReaderDelegate := TZBarReaderDelegate.Create;
  FZBarReaderDelegate.FZBarReader := Self;
  FZBarReaderViewController := TZBarReaderViewController.Wrap(TZBarReaderViewController.Wrap(TZBarReaderViewController.OCClass.alloc).init);
  FZBarReaderViewController.setReaderDelegate(FZBarReaderDelegate.GetObjectID);
  FZBarReaderViewController.setSupportedOrientationsMask(UIInterfaceOrientationMaskAll);
  {$ENDIF}
end;

destructor TFMXBarcode.Destroy;
begin
  {$IFDEF CPUARM}
  if Assigned(FZBarReaderDelegate) then
  begin
    FZBarReaderDelegate.Free;
    FZBarReaderDelegate := nil;
  end;
  if Assigned(FZBarReaderViewController) then
  begin
    FZBarReaderViewController.release;
    FZBarReaderViewController := nil;
  end;
  {$ENDIF}
  inherited;
end;

procedure TFMXBarcode.Show(bQRCode: boolean = False);
{$IFDEF CPUARM}
var
  app: UIApplication;
{$ENDIF}
begin
  {$IFDEF CPUARM}
  app := GetSharedApplication;
  if Assigned(app) and Assigned(app.keyWindow) then
    app.keyWindow.rootViewController.presentModalViewController(FZBarReaderViewController, True);
  {$ENDIF}
end;

{ TZBarReaderDelegate }

procedure TZBarReaderDelegate.imagePickerController(
  reader: UIImagePickerController; didFinishPickingMediaWithInfo: NSDictionary);
{$IFDEF CPUARM}
var
  val: ZBarSymbolSet;
  symbol: ZBarSymbol;
  sym : zbar_symbol_t;
  res: NSString;
{$ENDIF}
begin
  {$IFDEF CPUARM}
  val := TZBarSymbolSet.Wrap(didFinishPickingMediaWithInfo.objectForKey((NSStrEx('ZBarReaderControllerResults') as ILocalObject).GetObjectID));
  sym := zbar_symbol_set_first_symbol(val.zbarSymbolSet);
  symbol := TZBarSymbol.Wrap(TZBarSymbol.Wrap(TZBarSymbol.OCClass.alloc).initWithSymbol(sym));
  res := symbol.data;
  symbol.release;
  symbol := nil;

  if Assigned(FZBarReader.OnGetResult) then
    FZBarReader.OnGetResult(FZBarReader, UTF8ToString(res.UTF8String));

  if not FZBarReader.FZBarReaderViewController.isBeingDismissed then
    FZBarReader.FZBarReaderViewController.dismissModalViewControllerAnimated(True);
  {$ENDIF}
end;

{$ENDIF}

end.
