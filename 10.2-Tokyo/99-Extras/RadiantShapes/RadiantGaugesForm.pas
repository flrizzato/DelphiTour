{===============================================================================
  RadiantGaugesForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantGaugesForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Objects,
  FMX.Layouts,
  Radiant.Shapes;

type
  TfrmGauges = class(TForm)
    secFacePlate: TRadiantSectorRing;
    trpNeedle: TRadiantTrapezoid;
    chkAnimate: TCheckBox;
    aniNeedleAngle: TFloatAnimation;
    cirBackground: TRadiantCircle;
    lytGauge1: TLayout;
    lytGauge2: TLayout;
    sectGreen: TRadiantSector;
    sectYellow: TRadiantSector;
    sectRed: TRadiantSector;
    RadiantTrapezoid1: TRadiantTrapezoid;
    RadiantCircle1: TRadiantCircle;
    lytGauge3: TLayout;
    sect180: TRadiantSector;
    sect157: TRadiantSector;
    sect112: TRadiantSector;
    sect67: TRadiantSector;
    sect0: TRadiantSector;
    sect22: TRadiantSector;
    sect135: TRadiantSector;
    sect90: TRadiantSector;
    sect45: TRadiantSector;
    sectFrame: TRadiantSector;
    RadiantCircle2: TRadiantCircle;
    RadiantPointer1: TRadiantPointer;
    trkGauge2: TTrackBar;
    trkGauge3: TTrackBar;
    trkGauge1: TTrackBar;
    RadiantRing1: TRadiantRing;
    lytGauge4: TLayout;
    RadiantSector1: TRadiantSector;
    RadiantSector2: TRadiantSector;
    RadiantSector3: TRadiantSector;
    RadiantSector4: TRadiantSector;
    RadiantSector5: TRadiantSector;
    RadiantSector6: TRadiantSector;
    RadiantSector7: TRadiantSector;
    RadiantSector8: TRadiantSector;
    RadiantSector9: TRadiantSector;
    RadiantMarker2: TRadiantMarker;
    trkGauge4: TTrackBar;
    RadiantSector10: TRadiantSector;
    RadiantSector0: TRadiantSector;
    RadiantSector11: TRadiantSector;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    procedure chkAnimateChange(Sender: TObject);
    procedure trkGauge2Change(Sender: TObject);
    procedure trkGauge3Change(Sender: TObject);
    procedure trkGauge1Change(Sender: TObject);
    procedure trkGauge4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGauges: TfrmGauges;

implementation

{$R *.fmx}

procedure TfrmGauges.chkAnimateChange(Sender: TObject);
var
  Animate: Boolean;
begin
  Animate := chkAnimate.IsChecked;
  aniNeedleAngle.Enabled := Animate;
  FloatAnimation1.Enabled := Animate;
  FloatAnimation2.Enabled := Animate;
  FloatAnimation3.Enabled := Animate;

  if not Animate then
  begin
    trkGauge1Change( nil );
    trkGauge2Change( nil );
    trkGauge3Change( nil );
    trkGauge4Change( nil );
  end;
end;


procedure TfrmGauges.trkGauge1Change(Sender: TObject);
begin
  trpNeedle.RotationAngle := trkGauge1.Value;
end;


procedure TfrmGauges.trkGauge2Change(Sender: TObject);
begin
  RadiantTrapezoid1.RotationAngle := trkGauge2.Value;
end;


procedure TfrmGauges.trkGauge3Change(Sender: TObject);
begin
  RadiantPointer1.RotationAngle := trkGauge3.Value;
end;


procedure TfrmGauges.trkGauge4Change(Sender: TObject);
begin
  RadiantMarker2.RotationAngle := trkGauge4.Value;
end;

end.
