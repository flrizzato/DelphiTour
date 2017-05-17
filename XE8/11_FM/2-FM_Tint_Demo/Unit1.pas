unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Layouts;

type
  TForm13 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton6: TSpeedButton;
    Button1: TButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GridPanelLayout1: TGridPanelLayout;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.fmx}

procedure TForm13.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
  SpeedButton3.TextSettings.FontColor := $FF000000;
  SpeedButton4.TextSettings.FontColor := $FF000000;
  SpeedButton5.TextSettings.FontColor := $FF000000;
  {$ENDIF}
end;

end.
