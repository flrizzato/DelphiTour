unit OthelloCounterSet;

interface

uses FMX.Objects3D, System.Classes, OthelloCounters, FMX.MaterialSources, System.SysUtils;

type

  TOthelloCounterSet = class(TDummy)

  private
    GridSize: Integer;
    TileSize: Single;
    Counters: Array of Array of TOthelloCounter;
    procedure CheckDirection(startX, startY, currentX, currentY, dirX,
      dirY: Integer; startState: TOthelloState);
    procedure FlipLine(startX, startY, endX, endY: Integer;
      cState: TOthelloState);
  public
    CurrentTurn: TOthelloState;
    constructor Create(aOwner: TComponent; aGridSize: Integer; aTileSize: Single;
                       aBlackMaterial, aWhiteMaterial : TMaterialSource);
    destructor Destroy; override;
    procedure AddCounter(i,j: Integer);
    function GetScore(ScoreState: TOthelloState): Integer;
  end;


implementation

constructor TOthelloCounterSet.Create(aOwner: TComponent; aGridSize: Integer; aTileSize: Single;
                                      aBlackMaterial, aWhiteMaterial : TMaterialSource);
var
  i: Integer;
  j: Integer;
begin

  inherited Create(aOwner);
  GridSize := aGridSize;
  TileSize := aTileSize;

  //Create 2D array of counters
  SetLength(Counters, GridSize, GridSize);
  for i := 0 to High(Counters) do
    for j := 0 to High(Counters) do
    begin
      Counters[i][j] := TOthelloCounter.Create(Self, TileSize, aBlackMaterial, aWhiteMaterial);
      Counters[i][j].Parent := Self;
      Counters[i][j].Position.X := TileSize * i;
      Counters[i][j].Position.Y := TileSize * j;

      Counters[i][j].Visible := False;
    end;

  //Show starting four counters
  Counters[GridSize DIV 2][GridSize DIV 2].Visible := True;
  Counters[-1+GridSize DIV 2][GridSize DIV 2].Visible := True;
  Counters[GridSize DIV 2][-1+GridSize DIV 2].Visible := True;
  Counters[-1+GridSize DIV 2][-1+GridSize DIV 2].Visible := True;

  //Set the states of starting four counters
  Counters[GridSize DIV 2][GridSize DIV 2].CounterState := TOthelloState.Black;
  Counters[-1+GridSize DIV 2][GridSize DIV 2].CounterState := TOthelloState.White;
  Counters[GridSize DIV 2][-1+GridSize DIV 2].CounterState := TOthelloState.White;
  Counters[-1+GridSize DIV 2][-1+GridSize DIV 2].CounterState := TOthelloState.Black;

  //Set who goes first
  CurrentTurn := TOthelloState.Black;


end;

destructor TOthelloCounterSet.Destroy;
var
  i: Integer;
  j: Integer;
begin
  for i := 0 to High(Counters) do
    for j := 0 to High(Counters) do
    begin
      Counters[i][j].Free;
    end;

  SetLength(Counters,0,0);

  inherited;
end;


procedure TOthelloCounterSet.AddCounter(i,j: Integer);
var
  ValidPosition: Boolean;
begin

  ValidPosition := False;

  if i<High(Counters) then
    if Counters[i+1][j].Visible = True then ValidPosition := True;

  if i>0 then
    if Counters[i-1][j].Visible = True then ValidPosition := True;

  if j<High(Counters) then
    if Counters[i][j+1].Visible = True then ValidPosition := True;

  if j>0 then
    if Counters[i][j-1].Visible = True then ValidPosition := True;

  if (i<High(Counters)) AND (j<High(Counters)) then
    if Counters[i+1][j+1].Visible = True then ValidPosition := True;

  if (i>0) AND (j>0) then
    if Counters[i-1][j-1].Visible = True then ValidPosition := True;

  if (i<High(Counters)) AND (j>0) then
    if Counters[i+1][j-1].Visible = True then ValidPosition := True;

  if (i>0) AND (j<High(Counters)) then
    if Counters[i-1][j+1].Visible = True then ValidPosition := True;


  if ValidPosition = False then Exit;


  Counters[i][j].CounterState := CurrentTurn;
  Counters[i][j].Visible := True;

  CheckDirection(i,j,i,j,1,0,CurrentTurn);
  CheckDirection(i,j,i,j,-1,0,CurrentTurn);
  CheckDirection(i,j,i,j,0,1,CurrentTurn);
  CheckDirection(i,j,i,j,0,-1,CurrentTurn);

  CheckDirection(i,j,i,j,1,1,CurrentTurn);
  CheckDirection(i,j,i,j,-1,-1,CurrentTurn);
  CheckDirection(i,j,i,j,1,-1,CurrentTurn);
  CheckDirection(i,j,i,j,-1,1,CurrentTurn);

  case CurrentTurn of
    Black: CurrentTurn := White;
    White: CurrentTurn := Black;
  end;
end;


procedure TOthelloCounterSet.CheckDirection(startX,startY,currentX,currentY, dirX, dirY: Integer; startState : TOthelloState);
var
  i: Integer;
  j: Integer;
  lowX, lowY: Integer;
  highX, highY: Integer;
begin

  if (currentX+dirX < 0) OR (currentX+dirX > High(Counters)) OR (currentY+dirY < 0) OR (currentY+dirY > High(Counters)) then Exit;


  if Counters[currentX+dirX][currentY+dirY].Visible = False then Exit;


  if Counters[currentX+dirX][currentY+dirY].CounterState = startState then
  begin
    (*
    if startX > currentX then
    begin
      highX := startX;
      lowX := currentX;
    end
    else
    begin
      lowX := startX;
      highX := currentX;
    end;

    if startY > currentY then
    begin
      highY := startY;
      lowY := currentY;
    end
    else
    begin
      lowY := startY;
      highY := currentY;
    end;

    for i := lowX to highX do
      for j := lowY to highY do
      begin
        Counters[i][j].CounterState := startState;
      end;  *)
    //ShowMessage(IntToStr(currentY));
    FlipLine(startX, startY, currentX, currentY, startState);
  end
  else
  begin
    CheckDirection(startX,startY,currentX+dirX,currentY+dirY,dirX,dirY,startState);
  end;

end;

procedure TOthelloCounterSet.FlipLine(startX,startY,endX,endY: Integer; cState: TOthelloState);
var
  dirX, dirY: Integer;
  cx, cy: Integer;
begin

  if endX > startX then
    dirX := 1
  else if endX < startX then
    dirX := -1
  else
    dirX := 0;
  if endY > startY then
    dirY := 1
  else if endY < startY then
    dirY := -1
  else
    dirY := 0;

  cx := startX;
  cy := startY;

  while (cx <> endX+dirX) OR (cy <> endY+dirY) do
  begin
    Counters[cx][cy].CounterState := cState;
    cx := cx + dirX;
    cy := cy + dirY;
  end;
end;

function TOthelloCounterSet.GetScore(ScoreState: TOthelloState): Integer;
var
  i: Integer;
  j: Integer;
  n: Integer;
begin 
  n := 0;
  for i := 0 to High(Counters) do
    for j := 0 to High(Counters) do
    begin
      if Counters[i][j].CounterState = ScoreState then Inc(n)
    end;

  Result := n;
end;


end.
