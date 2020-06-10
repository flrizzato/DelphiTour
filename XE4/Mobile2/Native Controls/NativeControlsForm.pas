unit NativeControlsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit, FMX.StdCtrls, FMX.Platform,
  FMX.Notification, FMX.ListBox, FMX.Layouts, FMX.ExtCtrls, FMX.TabControl;

type
  TSettingBadgeNumberForm = class(TForm)
    btnSetBadgeNumber: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnResetBadgeNumber: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ListBox2: TListBox;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    CalendarEdit1: TCalendarEdit;
    ListBoxItem6: TListBoxItem;
    ListBox3: TListBox;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ComboBox1: TComboBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ToolBar2: TToolBar;
    Label2: TLabel;
    TabItem2: TTabItem;
    ListBox4: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem10: TListBoxItem;
    nbBadgeNumber: TNumberBox;
    Button1: TButton;
    Button2: TButton;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    btnOneButtonAlert: TButton;
    Button4: TButton;
    procedure btnSetBadgeNumberClick(Sender: TObject);
    procedure btnBadgeNumberDownClick(Sender: TObject);
    procedure btnBadgeNumberUpClick(Sender: TObject);
    procedure btnResetBadgeNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOneButtonAlertClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CalendarEdit1Change(Sender: TObject);
  private
    function GetBadgeNumber: single;
  public
    { Public declarations }
  end;

var
  SettingBadgeNumberForm: TSettingBadgeNumberForm;

implementation

{$R *.fmx}
uses
iOSapi.UIKit;

procedure TSettingBadgeNumberForm.btnSetBadgeNumberClick(Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;

begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  { set Icon Badge Number }
  if Assigned(NotificationService) then
    NotificationService.SetIconBadgeNumber(Trunc(nbBadgeNumber.Value));
end;

procedure TSettingBadgeNumberForm.Button4Click(Sender: TObject);
begin
  { Show a multiple-button alert that triggers different code blocks according to
    your input }
  case MessageDlg('Choose a button:', System.UITypes.TMsgDlgType.mtInformation,
    [
      System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo,
      System.UITypes.TMsgDlgBtn.mbCancel
    ], 0) of
    { Detect which button was pushed and show a different message }
    mrYES:
      ShowMessage('You chose Yes');
    mrNo:
      ShowMessage('You chose No');
    mrCancel:
      ShowMessage('You chose Cancel');
  end;
end;

procedure TSettingBadgeNumberForm.CalendarEdit1Change(Sender: TObject);
begin
   ListBoxItem6.Text := Format('Picked: %s', [FormatDateTime('dddd, mmmm d, yyyy', CalendarEdit1.Date)]);
end;

procedure TSettingBadgeNumberForm.ComboBox1Change(Sender: TObject);
begin
  ListBoxItem9.Text := Format('Picked: %s', [ComboBox1.Items[ComboBox1.ItemIndex]]);
end;

procedure TSettingBadgeNumberForm.FormCreate(Sender: TObject);
begin
  { display current Icon Badge Number }
  nbBadgeNumber.Value := GetBadgeNumber;
end;

procedure TSettingBadgeNumberForm.btnBadgeNumberDownClick(Sender: TObject);
begin
  nbBadgeNumber.Value := nbBadgeNumber.Value - 1;
end;

procedure TSettingBadgeNumberForm.btnBadgeNumberUpClick(Sender: TObject);
begin
  nbBadgeNumber.Value := nbBadgeNumber.Value + 1;
end;

procedure TSettingBadgeNumberForm.btnOneButtonAlertClick(Sender: TObject);
begin
  { Show a standard alert with a single OK button }
  ShowMessage('Hello World!');
end;

procedure TSettingBadgeNumberForm.btnResetBadgeNumberClick(Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;

begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  { reset Icon Badge Number }
  if Assigned(NotificationService) then
    NotificationService.ResetIconBadgeNumber;

  nbBadgeNumber.Value := 0;

end;


function TSettingBadgeNumberForm.GetBadgeNumber;
begin
  Result:= TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication).applicationIconBadgeNumber;
end;

end.
