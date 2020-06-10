unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Platform,
  FMX.Notification;

type
  TNotificationsForm = class(TForm)
    btnSendScheduledNotification: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnSendNotificationImmediately: TButton;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btnSendScheduledNotificationClick(Sender: TObject);
    procedure btnSendNotificationImmediatelyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificationsForm: TNotificationsForm;

implementation

{$R *.fmx}

procedure TNotificationsForm.btnSendNotificationImmediatelyClick(
  Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;
  Notification: TNotification;

  begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  if Assigned(NotificationService) then
  begin
    Notification := TNotification.Create;
    try
      Notification.Name := 'MyNotification';
      Notification.AlertBody := 'Delphi for iOS is here!';
      Notification.FireDate := Now;

      { Send notification in Notification Center }
      NotificationService.ScheduleNotification(Notification);
      { also this method is equivalent }
      // NotificationService.PresentNotification(Notification);
    finally
      Notification.Free;
    end;
  end
end;

procedure TNotificationsForm.btnSendScheduledNotificationClick(Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;
  Notification: TNotification;

begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  if Assigned(NotificationService) then
  begin
    Notification := TNotification.Create;
    try
      Notification.Name := 'MyNotification';
      Notification.AlertBody := 'Delphi for iOS is here!';

      { Fired in 10 second }
      Notification.FireDate := Now + EncodeTime(0,0,10,0);

      { Send notification in Notification Center }
      NotificationService.ScheduleNotification(Notification);
    finally
      Notification.Free;
    end;
  end
end;

procedure TNotificationsForm.SpeedButton1Click(Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;

begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  if Assigned(NotificationService) then
    { providing the fact that you already have a MyNotification previously issued }
    NotificationService.CancelNotification('MyNotification');

end;

procedure TNotificationsForm.SpeedButton2Click(Sender: TObject);
var
  NotificationService: IFMXNotificationCenter;

begin
  { verify if the service is actually supported }
  if TPlatformServices.Current.SupportsPlatformService(IFMXNotificationCenter) then
    NotificationService := TPlatformServices.Current.GetPlatformService(IFMXNotificationCenter) as IFMXNotificationCenter;

  if Assigned(NotificationService) then
    NotificationService.CancelAllNotifications;
end;

end.
