unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Media, FMX.Objects, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation,
  IdContext, IdCustomHTTPServer, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdHTTPServer, IdSync;

type
  TMainForm = class(TForm)
    ToolBarMain: TToolBar;
    butStart: TButton;
    cmbDevices: TComboBox;
    imgContainer: TImage;
    StyleBook: TStyleBook;
    IdHTTPServer: TIdHTTPServer;
    butPlay: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cmbDevicesChange(Sender: TObject);
    procedure butStartClick(Sender: TObject);
    procedure IdHTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure butPlayClick(Sender: TObject);
  private
    { Private declarations }
    VideoCamera: TVideoCaptureDevice;
    procedure SampleBufferSync;
    procedure SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
  public
    { Public declarations }
  end;

type
  TGetImageStream = class(TIdSync)
  protected
    FStream: TStream;
    procedure DoSynchronize; override;
  public
    class procedure GetImage(aStream: TStream);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}

procedure TMainForm.butStartClick(Sender: TObject);
begin
  if (VideoCamera <> nil) then
  begin
    if (VideoCamera.State = TCaptureDeviceState.Stopped) then
    begin
      VideoCamera.OnSampleBufferReady := SampleBufferReady;
      VideoCamera.Quality := TVideoCaptureQuality.LowQuality;
      VideoCamera.CaptureSettingPriority :=
        TVideoCaptureSettingPriority.FrameRate;
      VideoCamera.StartCapture;
      butPlay.Enabled := True;
    end
    else
    begin
      VideoCamera.StopCapture;
      butPlay.Enabled := False;
      IdHTTPServer.Active := False;
    end;
  end
  else
    raise Exception.Create('Dispositivo de captura de vídeo não disponível!');
end;

procedure TMainForm.butPlayClick(Sender: TObject);
begin
  IdHTTPServer.DefaultPort := 8080;
  IdHTTPServer.Active := not IdHTTPServer.Active;
end;

procedure TMainForm.cmbDevicesChange(Sender: TObject);
begin
  VideoCamera := TVideoCaptureDevice
    (TCaptureDeviceManager.Current.GetDevicesByName(cmbDevices.Selected.Text));

  if (VideoCamera <> nil) then
  begin
    butStart.Enabled := True;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
{$IF DEFINED(MSWINDOWS) OR DEFINED(MACOS)}
var
  DeviceList: TCaptureDeviceList;
  i: integer;
{$ENDIF}
begin
{$IF DEFINED(MSWINDOWS) OR DEFINED(MACOS)}
  DeviceList := TCaptureDeviceManager.Current.GetDevicesByMediaType
    (TMediaType.Video);
  for i := 0 to DeviceList.Count - 1 do
  begin
    cmbDevices.Items.Add(DeviceList[i].Name);
  end;
  cmbDevices.ItemIndex := 0;
{$ELSE}
  VideoCamera := TCaptureDeviceManager.Current.DefaultVideoCaptureDevice;
  butStart.Enabled := True;
{$ENDIF}
end;

procedure TMainForm.SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Queue(TThread.CurrentThread, SampleBufferSync);
end;

procedure TMainForm.SampleBufferSync;
begin
  VideoCamera.SampleBufferToBitmap(imgContainer.Bitmap, True);
end;

procedure TMainForm.IdHTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LStream: TMemoryStream;
begin
  LStream := TMemoryStream.Create;
  try
    TGetImageStream.GetImage(LStream);
    LStream.Position := 0;
  except
    LStream.Free;
    raise;
  end;
  AResponseInfo.ResponseNo := 200;
  AResponseInfo.ContentType := 'image/bmp';
  AResponseInfo.ContentStream := LStream;
end;

{ TGetImageStream }

procedure TGetImageStream.DoSynchronize;
begin
  inherited;
  MainForm.imgContainer.Bitmap.SaveToStream(FStream);
end;

class procedure TGetImageStream.GetImage(aStream: TStream);
begin
  with Create do
    try
      FStream := aStream;
      Synchronize;
    finally
      Free;
    end;
end;

end.
