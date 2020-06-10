program RotatingImage;

uses
  System.StartUpCopy,
  FMX.Forms,
  ImageRotationU in 'ImageRotationU.pas' {ImageRotation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TImageRotation, ImageRotation);
  Application.Run;
end.
