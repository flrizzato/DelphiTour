unit FormPlanetsUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Viewport3D,
  FMX.Objects3D, FMX.Controls3D, FMX.MaterialSources, FMX.Ani;

type
  TFormPlanets = class(TForm)
    Viewport3D1: TViewport3D;
    ToolBar1: TToolBar;
    Label1: TLabel;
    DummyMain: TDummy;
    SphereEarth: TSphere;
    SphereMars: TSphere;
    TextureMaterialSourceEarth: TTextureMaterialSource;
    TextureMaterialSourceMars: TTextureMaterialSource;
    SwitchRotation: TSwitch;
    Label2: TLabel;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    procedure SwitchRotationClick(Sender: TObject);
    procedure SphereEarthClick(Sender: TObject);
    procedure SphereMarsClick(Sender: TObject);
    procedure SwitchRotationSwitch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPlanets: TFormPlanets;

implementation

{$R *.fmx}

procedure TFormPlanets.FormCreate(Sender: TObject);
begin
//added to start app without rotation
 FloatAnimation1.Enabled := False;
 FloatAnimation2.Enabled := False;
end;

procedure TFormPlanets.SphereEarthClick(Sender: TObject);
begin
  SphereEarth.AnimateFloat('Position.Z',-SphereEarth.Position.Z);
end;

procedure TFormPlanets.SphereMarsClick(Sender: TObject);
begin
  SphereMars.AnimateFloat('Position.Z',-SphereMars.Position.Z);
end;

procedure TFormPlanets.SwitchRotationClick(Sender: TObject);
begin
//  FloatAnimation1.Enabled := not SwitchRotation.IsChecked;
// FloatAnimation2.Enabled := not SwitchRotation.IsChecked;
end;

procedure TFormPlanets.SwitchRotationSwitch(Sender: TObject);
begin
//for TSwitch, on Switch should be used
  FloatAnimation1.Enabled := SwitchRotation.IsChecked;
  FloatAnimation2.Enabled := SwitchRotation.IsChecked;
end;

end.
