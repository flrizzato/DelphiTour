unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.StrUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Beacon,
  System.Beacon.Components, FMX.Colors, FMX.ScrollBox, FMX.Memo;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    BeaconArea: TBeacon;
    butStart: TButton;
    butStop: TButton;
    TimerArea: TTimer;
    panArea: TColorBox;
    labelArea: TLabel;
    memArea: TMemo;
    procedure butStartClick(Sender: TObject);
    procedure butStopClick(Sender: TObject);
    procedure BeaconAreaBeaconProximity(const Sender: TObject;
      const ABeacon: IBeacon; Proximity: TBeaconProximity);
    procedure TimerAreaTimer(Sender: TObject);
    procedure BeaconAreaBeaconEnter(const Sender: TObject;
      const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
  private
    { Private declarations }
    fBeacon: IBeacon;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

const
  aBeaconList: array of string = ['30784', '29597', '30708', '29788', '1'];

implementation

{$R *.fmx}
{$R *.iPad.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TMainForm.BeaconAreaBeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  if ABeacon <> nil then;
end;

procedure TMainForm.BeaconAreaBeaconProximity(const Sender: TObject;
  const ABeacon: IBeacon; Proximity: TBeaconProximity);
var sMinor: string;
begin
  if (Proximity = TBeaconProximity.Near) then
   begin
    sMinor := ABeacon.Minor.ToString;
    if MatchStr(sMinor, aBeaconList) then
      fBeacon := ABeacon;
   end
  else fBeacon := nil;
end;

procedure TMainForm.butStartClick(Sender: TObject);
begin
  BeaconArea.StartScan;
  TimerArea.Enabled := True;
  butStart.Enabled := not TimerArea.Enabled;
  butStop.Enabled := TimerArea.Enabled;
end;

procedure TMainForm.butStopClick(Sender: TObject);
begin
  BeaconArea.StopScan;
  TimerArea.Enabled := False;
  butStart.Enabled := not TimerArea.Enabled;
  butStop.Enabled := TimerArea.Enabled;
end;

procedure TMainForm.TimerAreaTimer(Sender: TObject);
begin
  if fBeacon <> nil then
  begin
    memArea.Text := 'Beacon Details: ' + fBeacon.GUID.ToString + '  Major:' +
      fBeacon.Major.ToString + ' Minor:' + fBeacon.Minor.ToString +
      '  Distance: ' + fBeacon.Distance.ToString + 'm';
    labelArea.Text := 'Area #' + fBeacon.Minor.ToString;
    panArea.Color := ($FF000000 or TAlphaColor(random($FFFFFF)));;
  end;
end;

end.
