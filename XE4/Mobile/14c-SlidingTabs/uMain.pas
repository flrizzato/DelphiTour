unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.TabControl,
  FMX.Gestures, FMX.StdCtrls;

type
  TTabSlidingForm = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Image1: TImage;
    Image2: TImage;
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
  TabSlidingForm: TTabSlidingForm;

implementation

{$R *.fmx}

procedure TTabSlidingForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  { decide in whether to advance or devance the tab index }
  case EventInfo.GestureID of
    sgiLeft:
      if TabControl1.TabIndex < TabControl1.TabCount - 1 then
      begin
        TabControl1.TabIndex := TabControl1.TabIndex + 1;
        Handled := True;
      end;

    sgiRight:
      if TabControl1.TabIndex > 0 then
      begin
        TabControl1.TabIndex := TabControl1.TabIndex - 1;
        Handled := True;
      end;
  end;
end;

end.
