unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList,
  IniFiles, WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    TitleBarPanel: TTitleBarPanel;
    ImageCollection: TImageCollection;
    VirtualImageList: TVirtualImageList;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList: TActionList;
    actionNewAccount: TAction;
    PageControl: TPageControl;
    actionRemAccount: TAction;
    actionNewMessage: TAction;
    timStatus: TTimer;
    procedure actionNewAccountExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actionRemAccountExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actionNewMessageExecute(Sender: TObject);
    procedure timStatusTimer(Sender: TObject);
  private
    { Private declarations }

    fIniFile: TIniFile;
    fAccFile: TIniFile;
    stlAccounts: TStringList;

    {
      Credits for the Save/Load Seetings feature:
      https://www.davidghoyle.co.uk/WordPress/?p=2100
    }
    function MonitorProfile: string;
    procedure AppSaveSettings;
    procedure AppLoadSettings;

    function IsValidAcctName(sAcctName: string): Boolean;
    function CreateNewTab(sAcctName: string): TTabSheet;
    function CreateNewEdge(const fTabSheet: TTabSheet; sAcctName: string)
      : TEdgeBrowser;
    procedure RemoveAccount(sAcctName: string);

    procedure OnTabSheetShow(Sender: TObject);
    procedure _OnCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
      AResult: HRESULT);
    procedure _OnExecuteScript(Sender: TCustomEdgeBrowser; AResult: HRESULT;
      const AResultObjectAsJson: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses System.IOUtils, System.RegularExpressions, System.UITypes,
  System.NetEncoding;

const
  cImageRead: smallint = 4;
  cImageUnread: smallint = 5;

function TMainForm.MonitorProfile: string;
const
  strMask = '%d=%dDPI(%s,%d,%d,%d,%d)';
var
  iMonitor: integer;
  M: TMonitor;
begin
  Result := '';
  for iMonitor := 0 To Screen.MonitorCount - 1 Do
  begin
    If Result <> '' Then
      Result := Result + ':';
    M := Screen.Monitors[iMonitor];
    Result := Result + Format(strMask, [M.MonitorNum, M.PixelsPerInch,
      BoolToStr(M.Primary, True), M.Left, M.Top, M.Width, M.Height]);
  end;
end;

procedure TMainForm.AppSaveSettings;
Var
  strMonitorProfile: String;
  recWndPlmt: TWindowPlacement;
Begin
  strMonitorProfile := MonitorProfile;
  recWndPlmt.Length := SizeOf(TWindowPlacement);
  GetWindowPlacement(Handle, @recWndPlmt);
  fIniFile.WriteInteger(strMonitorProfile, 'Top',
    recWndPlmt.rcNormalPosition.Top);
  fIniFile.WriteInteger(strMonitorProfile, 'Left',
    recWndPlmt.rcNormalPosition.Left);
  fIniFile.WriteInteger(strMonitorProfile, 'Height',
    recWndPlmt.rcNormalPosition.Height);
  fIniFile.WriteInteger(strMonitorProfile, 'Width',
    recWndPlmt.rcNormalPosition.Width);
  fIniFile.WriteInteger(strMonitorProfile, 'WindowState', recWndPlmt.showCmd);
  fIniFile.UpdateFile;
end;

procedure TMainForm.AppLoadSettings;
var
  strMonitorProfile: String;
  recWndPlmt: TWindowPlacement;
begin
  strMonitorProfile := MonitorProfile;
  recWndPlmt.Length := SizeOf(TWindowPlacement);
  recWndPlmt.rcNormalPosition.Top := fIniFile.ReadInteger(strMonitorProfile,
    'Top', 100);
  recWndPlmt.rcNormalPosition.Left := fIniFile.ReadInteger(strMonitorProfile,
    'Left', 100);
  recWndPlmt.rcNormalPosition.Height := fIniFile.ReadInteger(strMonitorProfile,
    'Height', 480);
  recWndPlmt.rcNormalPosition.Width := fIniFile.ReadInteger(strMonitorProfile,
    'Width', 640);
  recWndPlmt.showCmd := fIniFile.ReadInteger(strMonitorProfile, 'WindowState',
    SW_NORMAL);
  SetWindowPlacement(Handle, @recWndPlmt);
end;

procedure TMainForm.actionNewAccountExecute(Sender: TObject);
begin
  var
    sAcctName: string := '';
  if InputQuery('Create a New Account (no spaces, no special chars)',
    'Account Unique Name', sAcctName) then
  begin
    sAcctName := sAcctName.ToUpper.Trim;
    if IsValidAcctName(sAcctName) then
    begin
      var
      fBrowserInstance := CreateNewEdge(CreateNewTab(sAcctName), sAcctName);
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
      fBrowserInstance.Navigate('https://web.whatsapp.com');
      fBrowserInstance.Tag := 1;

      fAccFile.WriteString('Accounts', sAcctName, sAcctName);
      stlAccounts.AddPair(sAcctName, sAcctName);
      fAccFile.UpdateFile;
    end
  end;
end;

procedure TMainForm.actionNewMessageExecute(Sender: TObject);
begin
  if PageControl.ActivePage.Tag > 0 then
  begin
    var
      sNewNumber: string := '';
    if InputQuery('Start New Conversation', 'Phone Number', sNewNumber) then
    begin
      if not TRegEx.IsMatch(sNewNumber, '^[0-9]*$') then
        raise Exception.Create
          ('The account name must contain only letters and numbers!');

      var
      script := 'window.open("https://web.whatsapp.com/send?phone=' + sNewNumber
        + '&text&app_absent=0","_self")';
      TEdgeBrowser(PageControl.ActivePage.Tag).ExecuteScript(script);
    end;
  end;
end;

procedure TMainForm.actionRemAccountExecute(Sender: TObject);
begin
  if PageControl.PageCount > 0 then
    if MessageDlg('This account will be removed. Confirm?',
      TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = IDYES
    then
      RemoveAccount(Trim(PageControl.ActivePage.Caption));
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  timStatus.Enabled := False;
  AppSaveSettings;
  CanClose := True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'QuickWhats.ini');

  stlAccounts := TStringList.Create;
  fAccFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'Accounts.ini');
  fAccFile.ReadSectionValues('Accounts', stlAccounts);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  AppLoadSettings;
  if stlAccounts.Count > 0 then
  begin
    for var i: integer := 0 to stlAccounts.Count - 1 do
      CreateNewEdge(CreateNewTab(stlAccounts.Names[i]), stlAccounts.Names[i]);
    PageControl.ActivePageIndex := 0;
    PageControl.ActivePage.OnShow(PageControl.ActivePage);
  end;
end;

procedure TMainForm._OnCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
  AResult: HRESULT);
begin
  Sender.DefaultContextMenusEnabled := True;
  Sender.DefaultScriptDialogsEnabled := True;
  // Sender.StatusBarEnabled := True;
  // Sender.WebMessageEnabled := True;
  // Sender.ZoomControlEnabled := True;
  // Sender.DevToolsEnabled := True;
end;

procedure TMainForm._OnExecuteScript(Sender: TCustomEdgeBrowser;
  AResult: HRESULT; const AResultObjectAsJson: string);
begin
  if AResultObjectAsJson <> 'null' then
  begin
    var
    fTitle := TNetEncoding.URL.Decode(AResultObjectAsJson).DeQuotedString('"');
    if Pos('(', fTitle) > 0 then
      TTabSheet(Sender.Parent).ImageIndex := cImageUnread
    else
      TTabSheet(Sender.Parent).ImageIndex := cImageRead;
  end;
end;

procedure TMainForm.OnTabSheetShow(Sender: TObject);
begin
  var
  fBrowserInstance := TEdgeBrowser(TTabSheet(Sender).Tag);
  if Assigned(fBrowserInstance) then
    if fBrowserInstance.Tag = 0 then
    begin
      fBrowserInstance.Navigate('https://web.whatsapp.com');
      fBrowserInstance.Tag := 1;

    end;
end;

function TMainForm.IsValidAcctName(sAcctName: string): Boolean;
begin
  if sAcctName.IsEmpty or (sAcctName.Length < 4) then
    raise Exception.Create
      ('The account name must contain three or more characters!');

  if not TRegEx.IsMatch(sAcctName, '([A-Za-z0-9\-\_]+)') then
    raise Exception.Create
      ('The account name must contain only letters and numbers!');

  if stlAccounts.IndexOf(sAcctName + '=' + UpperCase(sAcctName)) > -1 then
    raise Exception.Create('The account name must be unique!');

  Result := True;
end;

function TMainForm.CreateNewTab(sAcctName: string): TTabSheet;
begin
  Result := TTabSheet.Create(PageControl);
  Result.Name := 'tab' + sAcctName;
  Result.PageControl := PageControl;
  Result.Caption := sAcctName;
  Result.ImageIndex := cImageRead;
  Result.OnShow := OnTabSheetShow;
end;

function TMainForm.CreateNewEdge(const fTabSheet: TTabSheet; sAcctName: string)
  : TEdgeBrowser;
begin
  var
  fDataFolder := ExtractFilePath(Application.ExeName) + 'Accounts' + PathDelim +
    UpperCase(sAcctName);
  ForceDirectories(fDataFolder);

  Result := TEdgeBrowser.Create(fTabSheet);
  Result.UserDataFolder := fDataFolder;
  Result.Name := 'edge' + sAcctName;
  Result.OnCreateWebViewCompleted := _OnCreateWebViewCompleted;
  Result.OnExecuteScript := _OnExecuteScript;
  Result.Align := alClient;
  Result.Parent := fTabSheet;

  fTabSheet.Tag := integer(Result);
end;

procedure TMainForm.RemoveAccount(sAcctName: string);
begin
  TEdgeBrowser(PageControl.ActivePage.Tag).CloseWebView;
  TEdgeBrowser(PageControl.ActivePage.Tag).Free;
  PageControl.ActivePage.Free;

  fAccFile.DeleteKey('Accounts', sAcctName);
  stlAccounts.Delete(stlAccounts.IndexOf(sAcctName + '=' +
    UpperCase(sAcctName)));
  fAccFile.UpdateFile;

  var
  fDataFolder := ExtractFilePath(Application.ExeName) + 'Accounts' + PathDelim +
    UpperCase(sAcctName);
  if DirectoryExists(fDataFolder) then
  begin
    Sleep(1000);
    TDirectory.Delete(fDataFolder, True);
  end;

  PageControl.ActivePageIndex := 0;
end;

procedure TMainForm.timStatusTimer(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    var
    fBrowserInstance := TEdgeBrowser(PageControl.Pages[i].Tag);
    if (fBrowserInstance <> nil) then
      fBrowserInstance.ExecuteScript
        ('encodeURI(document.title)');
  end;
end;

end.
