unit Unit1;

interface

uses
  FMX.Forms, FMX.Edit, FMX.StdCtrls, System.Sensors.Components, FMX.Controls,
  System.Classes,
  FMX.Types, System.Sensors,
{$IFDEF MSWINDOWS}
  Winapi.ShellAPI, Winapi.Windows;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
Posix.Stdlib;
{$ENDIF POSIX}

type
  TForm1 = class(TForm)
    LocationSensor1: TLocationSensor;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    AniIndicator1: TAniIndicator;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fOpenURL: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.SysUtils;

procedure TForm1.Button1Click(Sender: TObject);
begin
  AniIndicator1.Visible := True;
  AniIndicator1.Enabled := True;

  LocationSensor1.OnLocationChanged := LocationSensor1LocationChanged;
  LocationSensor1.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  ShellExecute(0, 'OPEN', PChar(fOpenURL), '', '', SW_SHOWNORMAL);
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  _system(PAnsiChar('open ' + AnsiString(fOpenURL)));
{$ENDIF POSIX}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  System.SysUtils.FormatSettings.DecimalSeparator := '.';
end;

procedure TForm1.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
const
  GoogleMapsURL: String = 'https://maps.google.com/maps?q=%s,%s';
begin
  AniIndicator1.Enabled := False;
  AniIndicator1.Visible := False;
  Edit1.Text := FloatToStr(NewLocation.Latitude);
  Edit2.Text := FloatToStr(NewLocation.Longitude);

  fOpenURL := Format(GoogleMapsURL, [NewLocation.Latitude.ToString,
    NewLocation.Longitude.ToString]);
end;

end.
