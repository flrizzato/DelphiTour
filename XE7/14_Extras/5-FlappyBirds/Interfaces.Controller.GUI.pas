unit Interfaces.Controller.GUI;

interface

uses System.Generics.Collections, Classes, Sysutils, System.Types, FMX.Layouts;

type
  TBird = class
  private
   FX: Double;
   FY: Double;
   FWidth: Integer;
   FHeigth: Integer;
   FAngle: Double;
   FFlap: Boolean;
   FLayout: TLayout;
  public
   function GetRect: TRect;
   property X: Double read FX write FX;
   property Y: Double read FY write FY;
   property Width: Integer read FWidth write FWidth;
   property Heigth: Integer read FHeigth write FHeigth;
   property Angle: Double read FAngle write FAngle;
   property Flap: Boolean read FFlap write FFlap;
   property Layout: TLayout read FLayout write FLayout;
  end;

type
  TPipe = class
  private
   FX: Double;
   FY: Double;
   FWidth: Integer;
   FHeigth: Integer;
   FAngle: Double;
   FTag: Integer;
   FTagFloat: Double;
   FAdded: Boolean;
   FDelete: Boolean;
   FLayout: TLayout;
  public
   function GetRect: TRect;
   property X: Double read FX write FX;
   property Y: Double read FY write FY;
   property Width: Integer read FWidth write FWidth;
   property Heigth: Integer read FHeigth write FHeigth;
   property Angle: Double read FAngle write FAngle;
   property Tag: Integer read FTag write FTag;
   property TagFloat: Double read FTagFloat write FTagFloat;
   property Added: Boolean read FAdded write FAdded;
   property Delete: Boolean read FDelete write FDelete;
   property Layout: TLayout read FLayout write FLayout;
  end;

  TPipes = TObjectList<TPipe>;

type
  IAppGUI = interface;

  IAppController = interface
   procedure RegisterGUI(const AGUI: IAppGUI);
   procedure StartGame;
   procedure StopGame;
   procedure Replay;
   procedure Tapped;
  end;

  IAppGUI = interface
   procedure RegisterController(const AController: IAppController);
   function GetGamePanelWidth: Integer;
   function GetGamePanelHeight: Integer;
   procedure ResetGame;
   procedure SetScore(AScore: Integer);
   procedure GameOver(AScore, ABestScore: Integer);
   function GetHRatio: Integer;
   function GetScreenScale: Single;
   procedure SetBird(ABird: TBird);
   procedure AddPipe(APipe: TPipe);
   procedure RemovePipe(APipe: TPipe);
   procedure MovePipe(APipe: TPipe);
  end;

implementation

{ TBird }

function TBird.GetRect: TRect;
begin
 Result:= Rect(Trunc(X),Trunc(Y),Trunc(X+Width),Trunc(Y+Heigth));
end;


{ TPipe }

function TPipe.GetRect: TRect;
begin
 Result:= Rect(Trunc(X),Trunc(Y),Trunc(X+Width),Trunc(Y+Heigth));
end;

end.


