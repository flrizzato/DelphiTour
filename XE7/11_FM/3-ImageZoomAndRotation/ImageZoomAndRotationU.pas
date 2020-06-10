unit ImageZoomAndRotationU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.StdCtrls,
  FMX.Gestures;

type
  TImageZoomAndRotationForm = class(TForm)
    Image1: TImage;
    GestureManager1: TGestureManager;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    FLastAngle: Double;
    FLastDistance: Integer;
  public
    { Public declarations }
  end;

var
  ImageZoomAndRotationForm: TImageZoomAndRotationForm;

implementation

{$R *.fmx}

procedure TImageZoomAndRotationForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  LObj: IControl;
  LImage: TImage;
  LImageCenter: TPointF;
begin
  if EventInfo.GestureID = igiRotate then
  begin
    LObj := Self.ObjectAtPoint(ClientToScreen(EventInfo.Location));
    if LObj is TImage then
    begin
      { rotate the image }
      LImage := TImage(LObj.GetObject);
      if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) then
        FLastAngle := LImage.RotationAngle
      else if EventInfo.Angle <> 0 then
        LImage.RotationAngle := FLastAngle - (EventInfo.Angle * 180) / Pi;
    end;
  end

  else if EventInfo.GestureID = igiZoom then
  begin
    LObj := Self.ObjectAtPoint(ClientToScreen(EventInfo.Location));
    if LObj is TImage then
    begin
      if (not(TInteractiveGestureFlag.gfBegin in EventInfo.Flags)) and
        (not(TInteractiveGestureFlag.gfEnd in EventInfo.Flags)) then
      begin
        { zoom the image }
        LImage := TImage(LObj.GetObject);
        LImageCenter := LImage.Position.Point + PointF(LImage.Width / 2,
          LImage.Height / 2);
        LImage.Width := LImage.Width + (EventInfo.Distance - FLastDistance);
        LImage.Height := LImage.Height + (EventInfo.Distance - FLastDistance);
        LImage.Position.X := LImageCenter.X - LImage.Width / 2;
        LImage.Position.Y := LImageCenter.Y - LImage.Height / 2;
      end;
      FLastDistance := EventInfo.Distance;
    end;
  end;

end;

end.
