unit ExceptTestUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Analytics,
  FMX.Analytics.AppAnalytics, FMX.Layouts, FMX.ListBox, FMX.Edit;

type
  TForm2 = class(TForm)
    AppAnalytics1: TAppAnalytics;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.iPhone47in.fmx IOS}

uses System.Analytics, System.Analytics.AppAnalytics, System.DateUtils, System.TimeSpan;

type
  EDavidI = class(Exception);
  EUnhandledDavidI = class(Exception);

procedure TForm2.Button1Click(Sender: TObject);
begin
  try
    // this exception should be "handled" and not appear in analytics?
    raise EDavidI.Create('EDavidI Handled Exception');
  except
    on EDavidI do ShowMessage('EDavidI Exception Handled');
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // cause unhandled exception
  raise EUnhandledDavidI.Create('Unhandled DavidI Test Exception');
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  Context: TCustomEventContext;
begin
  // create custom analytics event
  if Application.TrackActivity then
  begin
    Context := TCustomEventContext.Create('Customer_Timezone', 'Recorded Locale with UTC Offset ', TTimeZone.Local.DisplayName,TTimeZone.Local.UtcOffset.Hours);
    Application.AnalyticsManager.RecordActivity(TAppActivity.Custom, Button3, Context);
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Listbox1.Items.Add(Edit1.Text)
end;

end.
