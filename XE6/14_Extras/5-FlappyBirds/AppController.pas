unit AppController;

interface

uses
  Sysutils, Classes, Math,
  System.Generics.Collections, SyncObjs, FMX.Types,
  AppData, Interfaces.Controller.GUI;

type
  TAddPipe = procedure(AYOffset: Double; Bottom: Boolean) of object ;
  TCalculator = class(TThread)
  private
   FRatio: Integer;
   FGameTicker: Integer;
   FPipeAPos: Integer;
   FPipeBPos: Integer;
   FAddPipe: TAddPipe;
  protected
   procedure Execute; override;
  public
   constructor Create(ARatio: Integer);
   property AddPipe: TAddPipe read FAddPipe write FAddPipe;
  end;

 TAppController = class(TInterfacedObject, Interfaces.Controller.GUI.IAppController)
 private
  FGUI: IAppGUI;
  FData: TAppData;
  FPipes: TPipes;
  FBird: TBird;
  FTimer: TTimer; // quick and dirty
  FUpdater: TCalculator;
  procedure RegisterGUI(const AGUI: IAppGUI);
  procedure StartGame;
  procedure StopGame;
  procedure Replay;
  procedure ResetGame;
  procedure GameOver;
  procedure Tapped;
  procedure RemovePipes;
  procedure IncScore;
  procedure SetBird(AX,AY,AAngle: Double; Flap: Boolean); overload;
  procedure SetBird(AYOffset,AAngle: Double; Flap: Boolean); overload;
  procedure AddPipe(AYOffset: Double; Bottom: Boolean);
  function HitGround: Boolean;
  function HitPipe: Boolean;
  function OvercomePipe: Boolean;
  function CheckBoundryCollision(APipe: TPipe; OffSetY : LongInt = 2; OffSetX : LongInt = 2): Boolean;

  procedure MainLoop(ASender: TObject);
 public
 end;

const
 // some of these constants should be initialized when RegisterGUI is called
 DEF_BIRD_X = 96;
 DEF_BIRD_Y = 248;
 DEF_BIRD_ANGLE = 0;

 GROUND_POS_Y = 453;

 PIPE_WIDTH = 76;
 PIPE_HEIGHT = 409;

 BIRD_WIDTH = 35;
 BIRD_HEIGHT = 35;

 SPAWN_TIME = 1.5;

var
 Mutex: TCriticalSection;
 BirdYPos: Double;
 BirdAngle: Double;
 BirdUp: Boolean;
 Flap: Boolean;
 GamePanelWidth: Integer;
 GamePanelHeight: Integer;

implementation

{ TAppController }

procedure TAppController.RegisterGUI(const AGUI: IAppGUI);
begin
 FGUI:= AGUI;
 FGUI.RegisterController(Self);
 FData:= TAppData.Create;
 Mutex:= TCriticalSection.Create;
 FPipes:= TObjectList<TPipe>.Create;
 FPipes.OwnsObjects:= true;
 FBird:= TBird.Create;

 GamePanelWidth:= FGUI.GetGamePanelWidth;
 GamePanelHeight:= FGUI.GetGamePanelHeight;

 Randomize;

 FTimer:= TTimer.Create(nil);
 FTimer.Interval:=33;
 FTimer.Enabled:= false;
 FTimer.OnTimer:= MainLoop;
end;

procedure TAppController.StartGame;
begin
 ResetGame;
 FUpdater:= TCalculator.Create(FGUI.GetHRatio);
 FUpdater.AddPipe:= AddPipe;
 FTimer.Enabled:= true;
 FUpdater.Start;
end;

procedure TAppController.StopGame;
begin
 FUpdater.Terminate;
 FUpdater.WaitFor;
 FUpdater.DisposeOf;
 FTimer.Enabled:= false;
end;

procedure TAppController.Replay;
begin
 ResetGame;
end;

procedure TAppController.ResetGame;
begin
 RemovePipes;
 BirdYPos:= DEF_BIRD_Y;
 BirdAngle:= DEF_BIRD_ANGLE;
 BirdUp:= false;
 Flap:= false;
 SetBird(DEF_BIRD_X,DEF_BIRD_Y,DEF_BIRD_ANGLE,false);

 FData.ResetScore;
 FGUI.SetScore(FData.GetScore);
 FGUI.ResetGame;
end;

procedure TAppController.GameOver;
begin
 StopGame;
 FGUI.GameOver(FData.GetScore, FData.GetHighscore);
end;

procedure TAppController.Tapped;
begin
 Mutex.Enter;
 BirdUp:= true;
 Mutex.Leave;
end;

procedure TAppController.RemovePipes;
var n: Integer;
begin
 for n:= 0 to FPipes.Count-1 do
  FGUI.RemovePipe(TPipe(FPipes.Items[n]));
 FPipes.Clear;
end;

procedure TAppController.IncScore;
begin
 FData.IncScore;
 FGUI.SetScore(FData.GetScore);
end;

procedure TAppController.SetBird(AX,AY,AAngle: Double; Flap: Boolean);
begin
 FBird.X:= AX;
 FBird.Y:= AY;
 FBird.Width:= BIRD_WIDTH;
 FBird.Heigth:= BIRD_HEIGHT;
 FBird.Angle:= AAngle;
 FBird.Flap:= Flap;
 FGUI.SetBird(FBird);
end;

procedure TAppController.SetBird(AYOffset,AAngle: Double; Flap: Boolean);
begin
 FBird.X:= DEF_BIRD_X;
 FBird.Y:= FBird.Y+AYOffset;
 FBird.Width:= BIRD_WIDTH;
 FBird.Heigth:= BIRD_HEIGHT;
 FBird.Angle:= AAngle;
 FBird.Flap:= Flap;
 FGUI.SetBird(FBird);
end;

procedure TAppController.AddPipe(AYOffset: Double; Bottom: Boolean);
begin
 FPipes.Add(TPipe.Create);
 {$IFDEF IOS}
 TPipe(FPipes.Last).X:= FGUI.GetGamePanelWidth+PIPE_WIDTH;
 {$ELSE}
 TPipe(FPipes.Last).X:= GamePanelWidth+PIPE_WIDTH;
 {$ENDIF}
 if Bottom then
 begin
 {$IFDEF IOS}
  TPipe(FPipes.Last).Y:= (FGUI.GetGamePanelWidth-PIPE_HEIGHT)+AYOffset;
 {$ELSE}
  TPipe(FPipes.Last).Y:= (GamePanelWidth-PIPE_HEIGHT)+AYOffset;
 {$ENDIF}
  TPipe(FPipes.Last).Angle:= 180;
 end
 else
 begin
  TPipe(FPipes.Last).Y:= AYOffset;
  TPipe(FPipes.Last).Angle:= 0;
 end;
 TPipe(FPipes.Last).Width:= PIPE_WIDTH;
 TPipe(FPipes.Last).Heigth:= PIPE_HEIGHT;
 TPipe(FPipes.Last).Tag:= Integer(Bottom)+1;
 TPipe(FPipes.Last).TagFloat:= 0;
 TPipe(FPipes.Last).Added:= false;
 TPipe(FPipes.Last).Layout:= nil;
end;

procedure TAppController.MainLoop(ASender: TObject);
var n: Integer;
    aPipe: TPipe;
    GameOverCheck: Boolean;
begin
 GameOverCheck:= false;
 if HitGround then
  GameOverCheck:= true;

 Mutex.Enter;
 // this should be also threaded
 for n:= FPipes.Count-1 downto 0 do
 begin
  aPipe:= TPipe(FPipes.Items[n]);
  aPipe.X:= aPipe.X-5;
  if not aPipe.Added then
  begin
   FGUI.AddPipe(aPipe);
   aPipe.Added:= true;
  end;
  FGUI.MovePipe(aPipe);

  // is pipe outside the visible area? - then delete it
  if (aPipe.X<((aPipe.Width*-1)-10)) then
  begin
   FGUI.RemovePipe(aPipe);
   FPipes.Delete(n);
  end;
 end;
 if HitPipe then
  GameOverCheck:= true
 else
  if OvercomePipe then
   IncScore;

 SetBird(BirdYPos,BirdAngle,Flap);
 Mutex.Leave;

 if GameOverCheck then
  GameOver;
end;

function TAppController.HitGround: Boolean;
begin
 Result:= ((FBird.Y+BIRD_HEIGHT)>GROUND_POS_Y);
end;

function TAppController.HitPipe: Boolean;
var n: Integer;
begin
 Result:= false;

 for n:= 0 to FPipes.Count-1 do
 begin
  if CheckBoundryCollision(TPipe(FPipes.Items[n])) then
  begin
   Result:= true;
   break;
  end;
 end;
end;

function TAppController.OvercomePipe: Boolean;
var n: Integer;
    aPipe: TPipe;
begin
 Result:= false;

 for n:= 0 to FPipes.Count-1 do
 begin
  aPipe:= TPipe(FPipes.Items[n]);
  if (((aPipe.X+(aPipe.Width/2))<FBird.X) AND (aPipe.Tag=1) AND (aPipe.TagFloat=0)) then
  begin
   aPipe.TagFloat:= 1;
   Result:= true;
  end;
 end;
end;

function TAppController.CheckBoundryCollision(APipe: TPipe; OffSetY : LongInt = 2; OffSetX : LongInt = 2): Boolean;
begin
 Result:=(not((FBird.GetRect.Bottom - (OffSetY * 2) < APipe.GetRect.Top + OffSetY)
          or(FBird.GetRect.Top + OffSetY > APipe.GetRect.Bottom - (OffSetY * 2))
          or(FBird.GetRect.Right - (OffSetX * 2) < APipe.GetRect.Left + OffSetX)
          or(FBird.GetRect.Left + OffSetX > APipe.GetRect.Right - (OffSetX * 2))));
end;


{ TUpdater }

constructor TCalculator.Create(ARatio: Integer);
begin
 inherited Create(true);
 FRatio:= ARatio;
 BirdAngle:= DEF_BIRD_ANGLE;
 BirdYPos:= DEF_BIRD_Y;
 FGameTicker:= 0;
end;

procedure TCalculator.Execute;
const BIRD_UP_HEIGHT = 42;
      BIRD_UP_SPEED = 5;
      BIRD_DOWN_SPEED = 5;
var POffset, WOffset: Integer;
    BirdUpCount: Integer;
    IsBirdUp: Boolean;
begin
 inherited;
 BirdUpCount:= 0;
 while not Terminated do
 begin
  // if user tapped several times in succession
  if BirdUp then
  begin
   BirdUpCount:= 0;
   IsBirdUp:= true;
   BirdUp:= false;
  end;

  if FGameTicker = 0 then
  begin
  {$IFDEF MSWINDOWS}
   if (Random<0.5) then
    WOffset:= (300*FRatio)
   else
    WOffset:= (350*FRatio);
  {$ENDIF}
  {$IFDEF IOS}
   if (Random<0.5) then
    WOffset:= (200*FRatio)
   else
    WOffset:= (250*FRatio);
  {$ENDIF}

   if (Random<0.5) then
    POffset:= (-125*FRatio)
   else
    POffset:= (-25*FRatio);

   FPipeAPos:= (-WOffset)+POffset;
   FPipeBPos:= WOffset+POffset;
   FAddPipe(FPipeAPos,false);
   FAddPipe(FPipeBPos,true);
  end;

  if FGameTicker>(SPAWN_TIME*30) then
   FGameTicker:= 0
  else
   Inc(FGameTicker);

   // for a smooth rising
  if IsBirdUp and (BirdUpCount <= BIRD_UP_SPEED)then
  begin
   if BirdAngle > -15 then
    BirdAngle:= BirdAngle-(90/(BIRD_UP_SPEED));
   BirdYPos:= -Round(BIRD_UP_HEIGHT/BIRD_UP_SPEED);
   Inc(BirdUpCount);
  end
  else
  begin
   IsBirdUp:= false;
   BirdUpCount:= 0;

   if BirdAngle<90 then
    BirdAngle:= BirdAngle+5;
   BirdYPos:= Max(BirdAngle,1)/BIRD_DOWN_SPEED;
  end;

  if FGameTicker mod 4 = 0 then
   Flap:= true
  else
   Flap:= false;

  Sleep(35);
 end;
end;

end.
