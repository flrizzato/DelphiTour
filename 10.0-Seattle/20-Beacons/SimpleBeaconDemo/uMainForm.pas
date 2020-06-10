//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon, FMX.Layouts, FMX.Memo,
  System.Beacon.Components, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TMainForm = class(TForm)
    Beacon1: TBeacon;
    Memo1: TMemo;
    ToolBar1: TToolBar;
    butStart: TButton;
    butStop: TButton;
    procedure butStartClick(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
    procedure butStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TMainForm.Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
  const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('New Beacon');
  Memo1.Lines.Add(Format( 'UUID: %s Major: %d Minor: %d',[ABeacon.GUID.ToString, ABeacon.Major, ABeacon.Minor]));
  Memo1.Lines.Add('Current Beacons count :' + Length(CurrentBeaconList).toString);
end;

procedure TMainForm.Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('Beacon exited');
  Memo1.Lines.Add(Format( 'UUID: %s Major: %d Minor: %d',[ABeacon.GUID.ToString, ABeacon.Major, ABeacon.Minor]));
  Memo1.Lines.Add('Current Beacons count :' + Length(CurrentBeaconList).toString);
end;

procedure TMainForm.butStartClick(Sender: TObject);
begin
  Beacon1.Enabled := True;
  butStart.Enabled := not Beacon1.Enabled;
  butStop.Enabled := Beacon1.Enabled;
end;

procedure TMainForm.butStopClick(Sender: TObject);
begin
  Beacon1.Enabled := False;
  butStart.Enabled := not Beacon1.Enabled;
  butStop.Enabled := Beacon1.Enabled;
end;

end.
