unit TapHoldForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Gestures, FMX.Objects,
  FMX.StdCtrls;

type
  TTapHold = class(TForm)
    Image1: TImage;
    ToolBar1: TToolBar;
    Title: TLabel;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TapHold: TTapHold;

implementation

{$R *.fmx}

procedure TTapHold.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = System.UITypes.igiLongTap then
  begin
  ShowMessage(Format('Tap and Hold detected at %d, %d',
  [Round(EventInfo.Location.X), Round(EventInfo.Location.Y)]
  ));
  end;
end;

end.
