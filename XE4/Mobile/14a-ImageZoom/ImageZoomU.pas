unit ImageZoomU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects,
  FMX.Gestures;

type
  TPinchZoom = class(TForm)
    GestureManager1: TGestureManager;
    Image1: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLastDistance : Integer;
  PinchZoom: TPinchZoom;

implementation

{$R *.fmx}

procedure TPinchZoom.Button1Click(Sender: TObject);
var
  I : Integer;
  Start,
  Stop : TTime;
begin
  Start := Now;
  for I := 1 to 1000 do
  begin
    while Image1.Scale.X < 2 do
    begin
      Image1.Position.X := ClientWidth/2 - (Image1.Width * Image1.Scale.X)/2;
      Image1.Position.Y := ClientHeight - ClientWidth/2 - (Image1.Height * Image1.Scale.Y)/2;
      Image1.Scale.X := Image1.Scale.X + 0.1;
      Image1.Scale.Y := Image1.Scale.Y + 0.1;
    end;
    Image1.Scale.X := 0;
    Image1.Scale.Y := 0;
  end;
  Stop := Now;
  ShowMessage(FormatDateTime('nn:ss.zzz',Stop-Start)+ ' for 1000 non visual zooms');
end;

procedure TPinchZoom.Button2Click(Sender: TObject);
var
  I : Integer;
  Start,
  Stop : TTime;
begin
  Start := Now;
  for I := 1 to 10 do
  begin
    while Image1.Scale.X < 2 do
    begin
      Image1.Position.X := ClientWidth/2 - (Image1.Width * Image1.Scale.X)/2;
      Image1.Position.Y := ClientHeight - ClientWidth/2 - (Image1.Height * Image1.Scale.Y)/2;
      Image1.Scale.X := Image1.Scale.X + 0.1;
      Image1.Scale.Y := Image1.Scale.Y + 0.1;
      Application.ProcessMessages;
    end;
    Image1.Scale.X := 0;
    Image1.Scale.Y := 0;
  end;
  Stop := Now;
  ShowMessage(FormatDateTime('nn:ss.zzz',Stop-Start)+ ' for 10 visual zooms');

end;

procedure TPinchZoom.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  LObj: IControl;
  image: TImage;
begin
  LObj := Self.ObjectAtPoint(ClientToScreen(EventInfo.Location));
  if LObj is TImage then
  begin
    if not(TInteractiveGestureFlag.gfBegin in EventInfo.Flags) and (not(TInteractiveGestureFlag.gfEnd in EventInfo.Flags)) then
    begin
      image := TImage(LObj.GetObject);
      image.Width := image.Width + 2*((EventInfo.Distance - FLastDIstance)/3);
      image.Height := image.Height + 2*((EventInfo.Distance - FLastDIstance)/3);
      image.Position.X := image.Position.X - (EventInfo.Distance - FLastDIstance)/3;
      image.Position.Y := image.Position.Y - (EventInfo.Distance - FLastDIstance)/3;
    end;
    FLastDistance := EventInfo.Distance;
  end;
end;

end.
