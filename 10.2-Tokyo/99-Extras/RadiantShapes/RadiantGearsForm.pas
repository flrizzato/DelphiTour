{===============================================================================
  RadiantGearsForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantGearsForm;

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
  FMX.Objects,
  FMX.Ani,
  Radiant.Shapes;

type
  TfrmGears = class(TForm)
    chkAnimate: TCheckBox;
    RadiantGear1: TRadiantGear;
    RadiantGear2: TRadiantGear;
    RadiantGear3: TRadiantGear;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    RadiantGear4: TRadiantGear;
    FloatAnimation4: TFloatAnimation;
    RadiantGear5: TRadiantGear;
    FloatAnimation5: TFloatAnimation;
    RadiantGear7: TRadiantGear;
    FloatAnimation7: TFloatAnimation;
    RadiantGear8: TRadiantGear;
    FloatAnimation8: TFloatAnimation;
    RadiantGear6: TRadiantGear;
    FloatAnimation6: TFloatAnimation;
    RadiantGear9: TRadiantGear;
    FloatAnimation9: TFloatAnimation;
    procedure chkAnimateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGears: TfrmGears;

implementation

{$R *.fmx}

procedure TfrmGears.chkAnimateChange(Sender: TObject);
begin
  FloatAnimation1.Enabled := chkAnimate.IsChecked;
  FloatAnimation2.Enabled := chkAnimate.IsChecked;
  FloatAnimation3.Enabled := chkAnimate.IsChecked;
  FloatAnimation4.Enabled := chkAnimate.IsChecked;
  FloatAnimation5.Enabled := chkAnimate.IsChecked;
  FloatAnimation6.Enabled := chkAnimate.IsChecked;
  FloatAnimation7.Enabled := chkAnimate.IsChecked;
  FloatAnimation8.Enabled := chkAnimate.IsChecked;
  FloatAnimation9.Enabled := chkAnimate.IsChecked;
end;

end.
