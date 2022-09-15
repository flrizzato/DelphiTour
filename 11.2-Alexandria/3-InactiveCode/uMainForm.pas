unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  System.Permissions, System.IOUtils, FMX.Memo.Types;

type
  TMainForm = class(TForm)
    memDisplay: TMemo;
    ToolBar1: TToolBar;
    butWrite: TButton;
    butLoad: TButton;
    butClear: TButton;
    SwitchLocal: TSwitch;
    lblLocal: TLabel;
    lblStatus: TLabel;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    SwitchDocsDown: TSwitch;
    procedure butLoadClick(Sender: TObject);
    procedure butWriteClick(Sender: TObject);
    procedure butClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SwitchLocalSwitch(Sender: TObject);
  private
    { Private declarations }

    FFileName, FFilePath: string;
    FPermissionReadExternalStorage: string;
    FPermissionWriteExternalStorage: string;

    procedure DisplayRationale(Sender: TObject;
      const APermissions: TClassicStringDynArray;
      const APostRationaleProc: TProc);

    procedure ReadStoragePermissionRequestResult(Sender: TObject;
      const APermissions: TClassicStringDynArray;
      const AGrantResults: TClassicPermissionStatusDynArray);

    procedure WriteStoragePermissionRequestResult(Sender: TObject;
      const APermissions: TClassicStringDynArray;
      const AGrantResults: TClassicPermissionStatusDynArray);

    procedure MemoFileRead;
    procedure MemoFileWrite;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  {$ENDIF}
  FMX.DialogService;

procedure TMainForm.butLoadClick(Sender: TObject);
begin
  PermissionsService.RequestPermissions([FPermissionReadExternalStorage,
    FPermissionWriteExternalStorage], ReadStoragePermissionRequestResult,
    DisplayRationale);
end;

procedure TMainForm.butWriteClick(Sender: TObject);
begin
  PermissionsService.RequestPermissions([FPermissionReadExternalStorage,
    FPermissionWriteExternalStorage], WriteStoragePermissionRequestResult,
    DisplayRationale);
end;

procedure TMainForm.DisplayRationale(Sender: TObject;
  const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
begin
  TDialogService.ShowMessage
    ('The app needs to read/write files from your device...',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SwitchLocalSwitch(Self);
  //FFileName := PathDelim + 'readme.txt';
  FFileName := PathDelim + 'license.lic';
  {$IFDEF ANDROID}
  FPermissionReadExternalStorage :=
    JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  FPermissionWriteExternalStorage :=
    JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  {$ENDIF}
end;

procedure TMainForm.ReadStoragePermissionRequestResult(Sender: TObject;
const APermissions: TClassicStringDynArray;
const AGrantResults: TClassicPermissionStatusDynArray);
begin
  // 2 permissions involved: READ_EXTERNAL_STORAGE, WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
    MemoFileRead
  else
    TDialogService.ShowMessage
      ('Cannot read the file as the required permission was not granted!');
end;

procedure TMainForm.WriteStoragePermissionRequestResult(Sender: TObject;
const APermissions: TClassicStringDynArray;
const AGrantResults: TClassicPermissionStatusDynArray);
begin
  // 2 permissions involved: READ_EXTERNAL_STORAGE, WRITE_EXTERNAL_STORAGE
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
    MemoFileWrite
  else
    TDialogService.ShowMessage
      ('Cannot write the file as the required permission was not granted!');
end;

procedure TMainForm.SwitchLocalSwitch(Sender: TObject);
begin
  if SwitchLocal.IsChecked then
  begin
    if not SwitchDocsDown.IsChecked then
      //FFilePath := TPath.Combine(TPath.GetDocumentsPath, 'MyNotes')
      FFilePath := TPath.GetDocumentsPath
    else
      //FFilePath := TPath.Combine(TPath.GetDownloadsPath, 'MyNotes')
      FFilePath := TPath.GetDownloadsPath
  end
  else
  begin
    if not SwitchDocsDown.IsChecked then
      //FFilePath := TPath.Combine(TPath.GetSharedDocumentsPath, 'MyNotes')
      FFilePath := TPath.GetSharedDocumentsPath
    else
      //FFilePath := TPath.Combine(TPath.GetSharedDownloadsPath, 'MyNotes')
      FFilePath := TPath.GetSharedDownloadsPath
  end;
end;

procedure TMainForm.MemoFileWrite;
begin
  //ForceDirectories(FFilePath);
  if TDirectory.Exists(FFilePath) then
  begin
    memDisplay.Lines.SaveToFile(FFilePath + FFileName);
    lblStatus.Text := 'Status: ' + 'Saved to ' + FFilePath + FFileName;
  end
  else
    TDialogService.ShowMessage('Folder ' + FFilePath + ' not created!');
end;

procedure TMainForm.butClearClick(Sender: TObject);
begin
  memDisplay.Lines.Clear;
end;

procedure TMainForm.MemoFileRead;
begin
  if FileExists(FFilePath + FFileName) then
  begin
    memDisplay.Lines.LoadFromFile(FFilePath + FFileName);
    lblStatus.Text := 'Status: ' + 'Loaded from ' + FFilePath + FFileName;
  end
  else
    TDialogService.ShowMessage('File ' + FFilePath + FFileName + ' not found!');
end;

end.
