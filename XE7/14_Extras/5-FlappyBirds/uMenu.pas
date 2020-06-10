unit uMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Ani, FMX.Effects, FMX.Platform, fOpen;

type
  TMenuForm = class(TForm)
    PlayBTN: TButton;
    Image1: TImage;
    GroundA: TImage;
    Ground: TRectangle;
    StyleBookW: TStyleBook;
    Image2: TImage;
    Rectangle1: TRectangle;
    LogoLBL: TLabel;
    GlowEffect3: TGlowEffect;
    FMonkeyA: TImage;
    FloatAnimation1: TFloatAnimation;
    procedure PlayBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    function HandleAppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
  end;

var
  MenuForm: TMenuForm;

implementation

{$R *.fmx}

uses uGame;

procedure TMenuForm.PlayBTNClick(Sender: TObject);
begin
 GameForm.Run;
 MenuForm.Hide;
 {$IFDEF MSWINDOWS}
 GameForm.ShowModal;
 {$ELSE}
 GameForm.Show;
 {$ENDIF}
end;

function TMenuForm.HandleAppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
begin
 case AAppEvent of
  aeFinishedLaunching: begin end;
  aeBecameActive:
  begin
  end;
  aeWillBecomeInactive:
  begin
  end;
  aeEnteredBackground:
  begin
  end;
  aeWillBecomeForeground:
  begin
  end;
  aeWillTerminate: begin
  end;
  aeLowMemory: begin end;
  aeTimeChange: begin end;
  aeOpenURL: begin end;
 end;
 Result := True;
end;

end.
