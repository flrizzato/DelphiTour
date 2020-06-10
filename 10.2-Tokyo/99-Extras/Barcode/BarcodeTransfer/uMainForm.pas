unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Messaging,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
  FMX.Edit, FMX.Media, ZXing.BarcodeFormat, ZXing.ReadResult, ZXing.ScanManager,
  FMX.Platform, FMX.Layouts, IPPeerClient, IPPeerServer, System.Tether.Manager,
  System.Tether.AppProfile,
  FMX.Barcode.DROID,
  FMX.Barcode.IOS, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    imgCamera: TImage;
    butStart: TButton;
    butStop: TButton;
    butSend: TButton;
    CameraComponent1: TCameraComponent;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    timAutoConnect: TTimer;
    StyleBook1: TStyleBook;
    LayoutBottom: TLayout;
    lblScanStatus: TLabel;
    edtResult: TEdit;
    chkLibrary: TCheckBox;
    butShare: TButton;
    ActionList1: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    chkAutoSend: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butStartClick(Sender: TObject);
    procedure butStopClick(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure timAutoConnectTimer(Sender: TObject);
    procedure TetheringManager1EndAutoConnect(Sender: TObject);
    procedure butSendClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtResultChange(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
  private
    { Private declarations }

    // for the external library
    fInProgress: boolean;
    fFMXBarcode: TFMXBarcode;

    // for the native zxing.delphi library
    fScanManager: TScanManager;
    fScanInProgress: Boolean;
    fFrameTake: Integer;
    procedure GetImage();
    function AppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;

    // for the external library
    procedure OnFMXBarcodeResult(Sender: TObject; ABarcode: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses System.Threading, FMX.VirtualKeyboard;

function TMainForm.AppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  Result := False;
  case AAppEvent of
    TApplicationEvent.WillBecomeInactive, TApplicationEvent.EnteredBackground,
      TApplicationEvent.WillTerminate:
      begin
        CameraComponent1.Active := False;
        Result := True;
      end;
  end;
end;

procedure TMainForm.butSendClick(Sender: TObject);
begin
  TetheringAppProfile1.SendString(TetheringManager1.RemoteProfiles.First,
    'Barcode', edtResult.Text);
end;

procedure TMainForm.butStartClick(Sender: TObject);
begin
  if chkLibrary.IsChecked then
  begin
    fInProgress := True;

    if Assigned(fFMXBarcode) then
      fFMXBarcode.Free;

    fFMXBarcode := TFMXBarcode.Create(Application);
    fFMXBarcode.OnGetResult := OnFMXBarcodeResult;
    fFMXBarcode.Show(False);
  end
  else
  begin
    if Assigned(fScanManager) then
      fScanManager.Free;

    fScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);

    CameraComponent1.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
    CameraComponent1.Active := False;
    CameraComponent1.Kind := FMX.Media.TCameraKind.BackCamera;
    CameraComponent1.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
    CameraComponent1.Active := True;
  end;

  lblScanStatus.Text := '';
  edtResult.Text := '';
end;

procedure TMainForm.butStopClick(Sender: TObject);
begin
  CameraComponent1.Active := False;
end;

procedure TMainForm.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);
end;

procedure TMainForm.edtResultChange(Sender: TObject);
begin
  ShowShareSheetAction1.Enabled := not edtResult.Text.IsEmpty;
  if not edtResult.Text.IsEmpty then
    if butSend.Enabled then
      butSendClick(Self);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not fInProgress;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  AppEventSvc: IFMXApplicationEventService;
begin
  if TPlatformServices.Current.SupportsPlatformService
    (IFMXApplicationEventService, IInterface(AppEventSvc)) then
  begin
    AppEventSvc.SetApplicationEventHandler(AppEvent);
  end;

  fFrameTake := 0;
  fInProgress := False;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  fScanManager.Free;
  fFMXBarcode.Free;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  FService: IFMXVirtualKeyboardService;
begin
  if Key = vkHardwareBack then
  begin
      TPlatformServices.Current.SupportsPlatformService
        (IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> nil) and (TVirtualKeyboardState.Visible
        in FService.VirtualKeyBoardState) then
      begin
        // Back button pressed, keyboard visible, so do nothing...
      end
      else
      begin
        // Back button pressed, keyboard not visible or not supported on this platform
        if fInProgress then
         begin
           Key := 0;
           fInProgress := False;
         end;
      end;
  end;
end;

procedure TMainForm.GetImage;
var
  scanBitmap: TBitmap;
  ReadResult: TReadResult;

begin
  CameraComponent1.SampleBufferToBitmap(imgCamera.Bitmap, True);

  if (fScanInProgress) then
  begin
    exit;
  end;

  { This code will take every 2 frame. }
  inc(fFrameTake);
  if (fFrameTake mod 2 <> 0) then
  begin
    exit;
  end;

  scanBitmap := TBitmap.Create();
  scanBitmap.Assign(imgCamera.Bitmap);
  ReadResult := nil;

  TTask.Run(
    procedure
    begin
      try
        fScanInProgress := True;
        try
          ReadResult := fScanManager.Scan(scanBitmap);
        except
          on E: Exception do
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                lblScanStatus.Text := E.Message;
              end);

            exit;
          end;
        end;

        TThread.Synchronize(nil,
          procedure
          begin

            if (length(lblScanStatus.Text) > 10) then
            begin
              lblScanStatus.Text := '*';
            end;

            lblScanStatus.Text := lblScanStatus.Text + '*';

            if (ReadResult <> nil) then
            begin
              edtResult.Text := ReadResult.Text;
            end;

          end);

      finally
        ReadResult.Free;
        scanBitmap.Free;
        fScanInProgress := False;
      end;

    end);
end;

procedure TMainForm.OnFMXBarcodeResult(Sender: TObject; ABarcode: string);
begin
  edtResult.Text := ABarcode;
  if (ABarcode <> '') and fInProgress then
    fInProgress := False;
end;

procedure TMainForm.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.TextMessage := edtResult.Text;
end;

procedure TMainForm.TetheringManager1EndAutoConnect(Sender: TObject);
begin
  try
    butSend.Enabled := TetheringAppProfile1.Connect
      (TetheringManager1.RemoteProfiles.First);
  except
    on E: Exception do
      butSend.Enabled := False;
  end;
end;

procedure TMainForm.timAutoConnectTimer(Sender: TObject);
begin
  if not butSend.Enabled then
    TetheringManager1.AutoConnect;
end;

end.
