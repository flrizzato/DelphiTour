unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, System.IOUtils,
  GameAudioManager;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    faudioMgr: TGameAudioManager;
  end;

var
  MainForm: TMainForm;

implementation

{$IFDEF ANDROID}
uses
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.OS,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText;
{$ENDIF}

{$IFDEF IOS}
const
  kSystemSoundID_vibrate = $FFF;
{$ENDIF}

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}
{$R *.iPad.fmx IOS}

procedure TMainForm.Button1Click(Sender: TObject);
var
  wFile, wPath: string;
begin
  ListBox1.Items.Clear;
  wPath := TPath.GetDocumentsPath;

  wFile := TPath.Combine(wPath, 'ding1.wav');
  if FileExists(wFile) then
  begin
    faudioMgr.AddSound(wFile);
    ListBox1.Items.Add(wFile);
  end
  else
    showmessage(wFile);

  wFile := TPath.Combine(wPath, 'ding2.wav');
  if FileExists(wFile) then
  begin
    faudioMgr.AddSound(wFile);
    ListBox1.Items.Add(wFile);
  end
  else
    showmessage(wFile);

  wFile := TPath.Combine(wPath, 'ding3.wav');
  if FileExists(wFile) then
  begin
    faudioMgr.AddSound(wFile);
    ListBox1.Items.Add(wFile);
  end
  else
    showmessage(wFile);

  ListBox1.ItemIndex := 0;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  faudioMgr.PlaySound(ListBox1.ItemIndex);
end;

procedure TMainForm.Button3Click(Sender: TObject);
{$IFDEF ANDROID}
var
  Vibrator: JVibrator;
{$ENDIF}
begin
{$IFDEF ANDROID}
  Vibrator := TJVibrator.Wrap
    ((SharedActivityContext.getSystemService
    (TJContext.JavaClass.VIBRATOR_SERVICE) as ILocalObject).GetObjectID);
  Vibrator.vibrate(500);
{$ENDIF}
{$IFDEF IOS}
  AudioServicesPlaySystemSound( kSystemSoundID_vibrate );
{$ENDIF}
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  faudioMgr := TGameAudioManager.Create;
end;

end.
