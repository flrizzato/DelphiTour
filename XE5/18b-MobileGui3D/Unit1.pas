unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Forms, FMX.Dialogs, FMX.Controls3D,
  FMX.Layers3D, FMX.StdCtrls, FMX.Effects;

type
  TForm1 = class(TForm3D)
    Layer3D1: TLayer3D;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Layer3D1.AnimateFloat('RotationAngle.Y', 360, 2, TAnimationType.atInOut, TInterpolationType.itBack);
  Layer3D1.AnimateFloat('Position.Z', 500, 1);
  Layer3D1.AnimateFloatDelay('Position.Z', 0, 1, 1);
end;

end.
