unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit, FMX.StdCtrls, FMX.Platform,
  FMX.Notification, FMX.ListBox, FMX.Layouts;

type
  TSettingBadgeNumberForm = class(TForm)
    btnSetBadgeNumber: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    nbBadgeNumber: TNumberBox;
    btnBadgeNumberDown: TButton;
    btnBadgeNumberUp: TButton;
    btnResetBadgeNumber: TButton;
    procedure btnSetBadgeNumberClick(Sender: TObject);
    procedure btnBadgeNumberDownClick(Sender: TObject);
    procedure btnBadgeNumberUpClick(Sender: TObject);
    procedure btnResetBadgeNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
