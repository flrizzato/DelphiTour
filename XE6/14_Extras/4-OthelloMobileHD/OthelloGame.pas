unit OthelloGame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Controls, FMX.StdCtrls, FMX.Controls3D,
  FMX.Objects3D,FMX.Forms3D ,FMX.Types, FMX.Ani, FMX.MaterialSources,
  OthelloCounters, OthelloBoard, OthelloCounterSet, FMX.Layers3D, FMX.Media,
  FMX.Objects, FMX.Dialogs;

type

  TOthello = class(TForm3D)
    TileColorDark: TColorMaterialSource;
    TileColorLight: TColorMaterialSource;
    Dummy1: TDummy;
    CameraComponent1: TCameraComponent;
    Light1: TLight;
    Camera1: TCamera;
    CurrentTurnTXT: TText3D;
    CurrentTurnColorSource: TColorMaterialSource;
    CurrentTurnColorShaftSource: TColorMaterialSource;
    BottomBar: TLayer3D;
    WhiteScore: TText;
    BlackScore: TText;
    NewGameBTN: TButton;
    TopBar: TLayer3D;
    Background: TLayer3D;
    Text1: TText;
    procedure Form3DCreate(Sender: TObject);
    procedure NewGameBTNClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FCounterColorDark: TMaterialSource;
    FCounterColorLight: TMaterialSource;
    Board: TOthelloBoard;
    CounterSet: TOthelloCounterSet;

    procedure CreateCounterSet;

    { Private declarations }
  public
    procedure OnTileClick(Sender : TOthelloTile);
  end;


var
  Othello: TOthello;
  const GridSize = 8;
  const TileSize = 1;

implementation

{$R *.fmx}


procedure TOthello.Form3DCreate(Sender: TObject);
begin
  FCounterColorDark := TOthelloBlackMaterial.Create(Self);
  FCounterColorLight:= TOthelloWhiteMaterial.Create(Self);

  Self.BeginUpdate;
  try
    Board := TOthelloBoard.Create(Self,GridSize,TileSize,TileColorLight,TileColorDark);
    Board.Parent := Dummy1;
    Board.Position.X := -3.5;
    Board.Position.Y := -3;
    Board.Position.Z := 0.7;
    Board.OnTileClick := OnTileClick;
    Dummy1.RotationAngle.X := -35;

    CreateCounterSet;
  finally
    Self.EndUpdate;
  end;
end;

procedure TOthello.NewGameBTNClick(Sender: TObject);
begin
  CreateCounterSet;

  CounterSet.CurrentTurn := Black;
  CurrentTurnTXT.Text := 'Blacks Turn';
  CurrentTurnColorSource.Color := TAlphaColor($FF202020);
  CurrentTurnColorShaftSource.Color := TAlphaColor($FFEEEEEEE);
  WhiteScore.Text := 'White 2';
  BlackScore.Text := 'Black 2';

end;

procedure TOthello.Button1Click(Sender: TObject);
begin
  Othello.Close;
end;

procedure TOthello.CreateCounterSet;
begin
  Dummy1.BeginUpdate;
  try

    if Assigned(CounterSet) then
    begin
      {$IFDEF NEXTGEN}
        CounterSet.DisposeOf();
      {$ENDIF}

      FreeAndNil(CounterSet);
    end;

    CounterSet := TOthelloCounterSet.Create(Self,GridSize,TileSize,FCounterColorDark,FCounterColorLight);
    CounterSet.Parent := Dummy1;
    CounterSet.Position.X := -3.5;
    CounterSet.Position.Y := -3;
  finally
    Dummy1.EndUpdate;
  end;
end;

procedure TOthello.OnTileClick(Sender: TOthelloTile);
var
  TotalWhiteCounters, TotalBlackCounters: Integer;
begin
  CounterSet.AddCounter(Sender.X, Sender.Y);

  TotalWhiteCounters := CounterSet.GetScore(TOthelloState.White);
  TotalBlackCounters := CounterSet.GetScore(TOthelloState.Black);
  
  WhiteScore.Text := 'White '+IntToStr(TotalWhiteCounters);
  BlackScore.Text := 'Black '+IntToStr(TotalBlackCounters);

  //CurrentTurnTXT.AnimateFloat('RotationAngle.Y', 360, 1, TAnimationType.atInOut, TInterpolationType.itBack);

  if CounterSet.CurrentTurn = Black then
  begin
    CurrentTurnColorSource.Color := TAlphaColor($FF202020);
    CurrentTurnColorShaftSource.Color := TAlphaColor($FFEEEEEEE);
    CurrentTurnTXT.Text := 'Blacks Turn';
  end
  else
  begin
    CurrentTurnColorSource.Color := TAlphaColor($FFEEEEEE);
    CurrentTurnColorShaftSource.Color := TAlphaColor($FF202020);
    CurrentTurnTXT.Text := 'Whites Turn';
  end;

  if TotalWhiteCounters + TotalBlackCounters = 64 then
  begin
    CurrentTurnColorSource.Color := TAlphaColor($FFEEEEEE);
    CurrentTurnColorShaftSource.Color := TAlphaColor($FF202020);
    CurrentTurnTXT.AnimateFloat('RotationAngle.Y', 360, 1, TAnimationType.atInOut, TInterpolationType.itBack);

    if TotalWhiteCounters > TotalBlackCounters then
    begin
      CurrentTurnTXT.Text := 'White Wins!';
    end
    else if TotalBlackCounters > TotalWhiteCounters then
    begin
      CurrentTurnTXT.Text := 'Black Wins!';
    end
    else
    begin
      CurrentTurnTXT.Text := 'A Draw!';
    end;

  end;

end;




end.
