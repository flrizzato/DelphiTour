unit ImageRotationU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.StdCtrls,
  FMX.Gestures;

type
  TImageRotation = class(TForm)
    Image1: TImage;
    GestureManager1: TGestureManager;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLastAngle : Double;
  ImageRotation: TImageRotation;

implementation

{$R *.fmx}

procedure TImageRotation.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  LObj: IControl;
  image: TImage;
begin
  LObj := Self.ObjectAtPoint(ClientToScreen(EventInfo.Location));

  if LObj is TImage then
  begin
    image := TImage(LObj.GetObject);
    if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) then
    begin
      FLastAngle := image.RotationAngle;
    end
    else if EventInfo.Angle <> 0 then
    begin
      image.RotationAngle := FLastAngle - (EventInfo.Angle * 180) / Pi;
    end;
  end;
end;


end.
