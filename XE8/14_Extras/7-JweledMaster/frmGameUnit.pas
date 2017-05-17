unit frmGameUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Generics.Collections, System.IOUtils, System.Actions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Objects, FMX.Layouts,
  FMX.Ani, FMX.StdCtrls, FMX.Effects, FMX.TabControl,
  FMX.ActnList, FMX.ListBox, FMX.Edit;

resourcestring
  cYourScoreWas = 'Your score was %d points';

const
  cHallOfFameFileName = 'Hall.txt';
  cInitialInterval = 500;
  cTransitionAnimation = 0.2;
  cFallAnimation = 0.1;
  cRowCount = 9;
  cColCount = 9;
  cMinToMatch = 3;
  cCellPoints = 50;
  cMaxScores = 11;
  cMaxTimeMultiplier = 3;

type
  TJewels = (jEmpty, jEmerald, jRuby, jPearl, jDiamond, jSapphire, jAmber, jAmethyst);
  TTextType = (ttScore, ttMultiplier);

const
  cJewels: array[Low(TJewels) .. High(TJewels)] of string =
    ('Empty',
     'Emerald',
     'Ruby',
     'Pearl',
     'Diamond',
     'Sapphire',
     'Amber',
     'Amethyst'
     );

type
  TBoardArray = array[0 .. cColCount - 1, 0 .. cRowCount - 1] of TJewels;

type
  TCell = class(TImage)
  public
    X, Y: Byte;
    VerticalAnimation, HorizontalAnimation: TFloatAnimation;
    SelectionEffect: TFloatAnimation;
  end;

  TCellList = TList<TCell>;

type
  TfrmGame = class(TForm)
    MainLayout: TLayout;
    imPearl: TImage;
    imDiamond: TImage;
    imEmerald: TImage;
    imRuby: TImage;
    Button1: TButton;
    imBackground: TImage;
    btnShuffle: TButton;
    imSapphire: TImage;
    imAmber: TImage;
    imAmethyst: TImage;
    lblScore: TLabel;
    lblScoreTitle: TLabel;
    lblTimeTitle: TLabel;
    barTime: TProgressBar;
    timerCountDown: TTimer;
    StatusLayout: TLayout;
    lblGameOver: TLabel;
    lblShuffing: TLabel;
    btnPlay: TButton;
    aniShuffle: TFloatAnimation;
    ShufflingEffect: TGlowEffect;
    AniShufflingGlow: TFloatAnimation;
    GameOverEffect: TGlowEffect;
    BoardLayout: TLayout;
    BottomLayout: TLayout;
    TabControl: TTabControl;
    tiGame: TTabItem;
    tiHall: TTabItem;
    ActionList: TActionList;
    acToHall: TChangeTabAction;
    acToGame: TChangeTabAction;
    Label1: TLabel;
    lblName09: TLabel;
    lblName02: TLabel;
    lblName03: TLabel;
    lblName04: TLabel;
    lblName05: TLabel;
    lblName06: TLabel;
    lblName07: TLabel;
    lblName08: TLabel;
    lblScore07: TLabel;
    lblScore08: TLabel;
    lblScore02: TLabel;
    lblScore03: TLabel;
    lblScore01: TLabel;
    lblScore09: TLabel;
    lblScore06: TLabel;
    lblScore10: TLabel;
    lblScore05: TLabel;
    lblScore04: TLabel;
    lblName10: TLabel;
    lblName01: TLabel;
    lblHallOfFame: TLabel;
    HallOfFameGlowEffect: TGlowEffect;
    HallOfFameGlowAnimation: TFloatAnimation;
    lblScore00: TLabel;
    lblName00: TLabel;
    pnPlay: TPanel;
    tiNewHiScore: TTabItem;
    lblYouMadeIt: TLabel;
    lblPrompt: TLabel;
    lblYourScore: TLabel;
    Panel1: TPanel;
    ebName: TEdit;
    Panel2: TPanel;
    btnSave: TButton;
    acToNewScore: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure DoImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure DoImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure DoImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure DoMouseLeave(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnShuffleClick(Sender: TObject);
    procedure timerCountDownTimer(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure aniShuffleFinish(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    fCellWidth: Single;
    fCellHeight: Single;
    fDragging: Boolean;
    fCellList: TCellList;
    fScore: Cardinal;
    fConsecutiveFalls: Integer;
    fMultiplierShown: Boolean;
    fSimultaneousMatches: Integer;
    fInit: Boolean;
    fDebug: Boolean;
    fMoving: Boolean;
    fSelected: TPoint;
    fTarget: TPoint;
    FOnFinish: TNotifyEvent;
    fFallingCells: Integer;
    fWorkingArray,
    fJewels: TBoardArray;
    fTesting: Boolean;
    fScoreAnimationList: TList<TFloatAnimation>;
    fHallOfFame: TStringList;
    fLastName: string;
    fTimeMultiplier: Single;
    procedure AddScore(const aName: string; aScore: Cardinal; Sort: Boolean = False);
    procedure SetOnFinish(const Value: TNotifyEvent);
    procedure InitGame;
    procedure InitLevel(aLevel: Integer);
    procedure RefreshBoard;
    procedure RefreshCellImage(i, j: Byte);
    function SelectionAvailable: Boolean;
    procedure SwitchCells(aSource, aTarget: TPoint);
    function ValidateMovement(aSource, aTarget: TPoint; RestoreMovement: Boolean = True): Boolean;
    procedure DoMove(aSource, aTarget: TPoint);
    procedure MatchCells;
    function CheckHorizontal(i, j: Integer): Integer;
    function CheckVertical(i, j: Integer): Integer;
    procedure FallCells;
    function SameMatrices: Boolean;
    procedure DumpMatrix;
    procedure RestoreMatrix;
    procedure FillBoard;
    function RandomCell: TJewels;
    procedure CompleteMovement;
    function CheckAvailables: Boolean;
    procedure Shuffle;
    function CheckMovements(i, j: Byte): Boolean;
    procedure DoFinishSourceAnimation(Sender: TObject);
    procedure SetScore(const Value: Cardinal);
    procedure KillHorizontal(i, j, aCount: Integer);
    procedure KillVertical(i, j, aCount: Integer);
    procedure CreateTextAnimation(i, j: Integer; const aValue: string; aTextType: TTextType);
    procedure DoTextFinish(Sender: TObject);
    procedure GameOver;
    procedure SetTime(const Value: Single);
    procedure SetMaxTime(const Value: Single);
    function GetCellByPos(i, j: Byte): TCell; overload;
    function GetCellByPos(aCell: TPoint): TCell; overload;
    procedure StartSwitchAnimation(aSource, aTarget: TPoint; Reverse: Boolean);
    procedure StartFallingAnimation(aSource: TPoint);
    procedure ClearSelection;
    procedure ClearTarget;
    function GetMaxTime: Single;
    function GetTime: Single;
    procedure SwitchImageCoordinates(aSource, aTarget: TPoint);
    procedure DoFinishFallingAnimation(Sender: TObject);
    procedure StartCellFalling;
    procedure MoveToTopAndFall(aSource: TPoint);
    function ImageFor(aCellType: TJewels): TImage;
    procedure RandomBoard;
    procedure UpdateScore(i, j: Byte; aScore: Cardinal);
    function CheckMatches: Boolean;
    procedure SwitchSelectionEffectOn(aSelected: TPoint; Enabled: Boolean);
    function AdjacentCells(aCell, anotherCell: TPoint): Boolean;
    procedure InitializeScoreAnimation;
    procedure RefreshScores;
    procedure DefaultHallOfFame;
    function GetHallOfFameFileName: string;
    function CheckForHiScore: Boolean;
    procedure SaveScores;
    procedure SortScores;

    property Score: Cardinal read FScore write SetScore;
    property Time: Single read GetTime write SetTime;
    property MaxTime: Single read GetMaxTime write SetMaxTime;
  public
    { Public declarations }
    property OnFinish: TNotifyEvent read FOnFinish write SetOnFinish;
  end;

var
  FrmGame: TFrmGame;

implementation

{$R *.fmx}

uses
  System.Math;

{ TfrmGame }

function SortBackwards(aList: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := - AnsiCompareText(aList[Index1], aList[Index2]);
end;

{$REGION 'Initialization'}

procedure TfrmGame.FormCreate(Sender: TObject);
begin
  {$IFDEF MSWINDOWS}
  BorderStyle := TFmxFormBorderStyle.bsSizeable;
  {$ENDIF}
  fScore := 0;
  fTesting := False;
  fDebug := True;
  fMoving := False;
  imBackground.Width := ClientWidth;
  imBackground.Height := ClientHeight;
  lblShuffing.Visible := False;
  lblGameOver.Visible := False;
  fHallOfFame := TStringList.Create;
  try
    fHallOfFame.LoadFromFile(GetHallOfFameFilename);
  except
    DefaultHallOfFame;
    SortScores;
    SaveScores;
  end;
  InitGame;
end;

procedure TfrmGame.InitGame;
var
  c: Single;
  i, j: Byte;
  lCell: TCell;
  lSelectionEffect: TGlowEffect;
  lSelectionAnimation: TFloatAnimation;
  lLabel: TLabel;

  function CreateAnimation(aLabel: TLabel): TFloatAnimation;
  begin
    Result := TFloatAnimation.Create(aLabel);
    Result.AutoReverse := False;
    Result.Enabled := False;
    Result.AnimationType := TAnimationType.atIn;
    Result.Loop := False;
    Result.Inverse := False;
    Result.StopValue := aLabel.Position.Y;
    Result.StartValue := Result.StopValue + TControl(aLabel.Parent).Height; // To be sure that it starts from outside
    Result.PropertyName := 'Position.Y';
    Result.StartFromCurrent := False;
    Result.Parent := aLabel;
  end;

begin
  fInit := True;
  fLastName := 'None';
  ClearSelection;
  ClearTarget;

  fCellList := TCellList.Create;

  BoardLayout.BeginUpdate;
  c := Min(BoardLayout.Height / cRowCount, Boardlayout.Width / cColCount);
  fCellWidth := c;
  fCellHeight := c;
  BoardLayout.Width := fCellWidth * cColCount;
  BoardLayout.Height := fCellHeight * cRowCount;
  BoardLayout.Position.X := (MainLayout.Width / 2) - (BoardLayout.Width / 2);
  BoardLayout.Position.Y := (MainLayout.Height / 2) - (BoardLayout.Height / 2);
  fScoreAnimationList := TList<TFloatAnimation>.Create;
  try
    for i := 0 to cMaxScores - 1 do
    begin
      lLabel := TLabel(Self.FindComponent(Format('lblName%.2d', [i])));
      if Assigned(lLabel) then
        fScoreAnimationList.Add(CreateAnimation(lLabel));
      lLabel := TLabel(Self.FindComponent(Format('lblScore%.2d', [i])));
      if Assigned(lLabel) then
        fScoreAnimationList.Add(CreateAnimation(lLabel));
    end;

    for i := 0 to cColCount - 1 do
      for j := 0 to cRowCount - 1 do
      begin
        lCell := TCell.Create(BoardLayout);
        lCell.Parent := BoardLayout;
        lCell.X := i;
        lCell.Y := j;
        lCell.Width := fCellWidth;
        lCell.Height := fCellHeight;
        lCell.WrapMode := TImageWrapMode.iwStretch;
        lCell.Position.X := i * lCell.Width;
        lCell.Position.Y := j * lCell.Height;
        lCell.OnMouseDown := DoImageMouseDown;
        lCell.OnMouseUp := DoImageMouseUp;
        lCell.OnMouseMove := DoImageMouseMove;
        lCell.OnMouseLeave := DoMouseLeave;

        fCellList.Add(lCell);

        lCell.HorizontalAnimation := TFloatAnimation.Create(lCell);
        lCell.HorizontalAnimation.Parent := lCell;
        lCell.HorizontalAnimation.PropertyName := 'Position.X';
        lCell.HorizontalAnimation.StartValue := lCell.Position.X;
        lCell.HorizontalAnimation.StopValue := lCell.Position.X;
        lCell.HorizontalAnimation.Duration := cTransitionAnimation;

        lCell.VerticalAnimation := TFloatAnimation.Create(lCell);
        lCell.VerticalAnimation.Parent := lCell;
        lCell.VerticalAnimation.PropertyName := 'Position.Y';
        lCell.VerticalAnimation.StartValue := lCell.Position.X;
        lCell.VerticalAnimation.StopValue := lCell.Position.X;
        lCell.VerticalAnimation.Duration := cTransitionAnimation;

        lSelectionEffect := TGlowEffect.Create(lCell);
        lSelectionEffect.Parent := lCell;
        lSelectionEffect.GlowColor := TAlphaColorRec.Red;
        lSelectionEffect.Softness := 0.2;
        lSelectionEffect.Opacity := 0;

        lSelectionAnimation := TFloatAnimation.Create(lCell);
        lSelectionAnimation.Parent := lSelectionEffect;
        lSelectionAnimation.PropertyName := 'Opacity';
        lSelectionAnimation.StopValue := 1;

        lCell.SelectionEffect := lSelectionAnimation;

      end;
  finally
    BoardLayout.EndUpdate;
  end;
  fInit := False;
  if (TabControl.ActiveTab <> tiHall) then
    TabControl.ActiveTab := tiHall
  else
    InitializeScoreAnimation;
end;

procedure TfrmGame.InitLevel(aLevel: Integer);
begin
  pnPlay.Visible := False;
  lblGameOver.Visible := False;
  lblShuffing.Visible := False;

  RandomBoard;

  fInit := True;
  CompleteMovement;
  fInit := False;
  fMoving := False;
  RefreshBoard;
  Score := 0;
  MaxTime := 60;
  fTimeMultiplier := 1;
  Time := MaxTime;
  timerCountDown.Interval := cInitialInterval;
  timerCountDown.Enabled := True;
end;

procedure TfrmGame.FormDestroy(Sender: TObject);
begin
  fCellList.DisposeOf;
  fScoreAnimationList.DisposeOf;
  fHallOfFame.DisposeOf;
end;

{$ENDREGION}

{$REGION 'Hall Of Fame'}

procedure TfrmGame.InitializeScoreAnimation;
var
  lFloatAnimation: TFloatAnimation;
begin
  RefreshScores;
  for lFloatAnimation in fScoreAnimationList do
  begin
    lFloatAnimation.Duration := (Random(1500) / 1000) + 1;
    lFloatAnimation.Enabled := True;
    lFloatAnimation.Start;
  end;
end;

procedure TfrmGame.SaveScores;
begin
  fHallOfFame.SaveToFile(GetHallOfFameFilename);
end;

procedure TfrmGame.btnSaveClick(Sender: TObject);
begin
  AddScore(ebName.Text, Score, True);
  SaveScores;
  RefreshScores;
  acToHall.ExecuteTarget(Self);
end;

procedure TfrmGame.SortScores;
begin
  fHallOfFame.CustomSort(SortBackwards);
end;

procedure TfrmGame.AddScore(const aName: string; aScore: Cardinal; Sort: Boolean);
begin
  fHallOfFame.Add(Format('%.10d=%s', [aScore, aName]));
  if Sort then
    SortScores;
  // Delete values in excess
  while (fHallOfFame.Count > cMaxScores) do
    fHallOfFame.Delete(cMaxScores);
end;

procedure TfrmGame.DefaultHallOfFame;
var
  n: Integer;

  function RandomName: string;
  const
    NameCount = 8;
    Names: array[0..NameCount] of string = (
      'Benito',
      'Pablo',
      'Fran',
      'Juan',
      'Eva',
      'Minguez',
      'Adrian',
      'Miguel',
      'Ernest'
      );
  begin
    Result := Names[Random(NameCount + 1)];
  end;

begin
  for n := 0 to cMaxScores do
  begin
    AddScore(RandomName, Random(10000));
  end;
end;

function TfrmGame.GetHallOfFameFileName: string;
begin
  Result := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetHomePath) +
                  cHallOfFameFileName;
end;

function TfrmGame.CheckForHiScore: Boolean;
var
  n: Integer;
  lScore: Cardinal;
begin
  for n := 0 to cMaxScores - 1 do
  begin
    lScore := StrToIntDef(fHallOfFame.Names[n], 0);
    if (Score > lScore) then
    begin
      acToNewScore.ExecuteTarget(Self);
      Exit(True);
    end;
  end;
  Result := False;
end;

procedure TfrmGame.RefreshScores;
var
  n: Integer;
  lblLabel: TLabel;
begin
  for n := 0 to cMaxScores do
  begin
    lblLabel := TLabel(FindComponent(Format('lblName%.2d', [n])));
    if Assigned(lblLabel) then
      lblLabel.Text := fHallOfFame.ValueFromIndex[n];
    lblLabel := TLabel(FindComponent(Format('lblScore%.2d', [n])));
    if Assigned(lblLabel) then
      lblLabel.Text := IntToStr(StrToIntDef(fHallOfFame.Names[n], 0));
  end;
end;

{$ENDREGION}

function TfrmGame.SelectionAvailable: Boolean;
begin
  Result := not ((fSelected.X = -1) or (fSelected.Y = -1));
end;

procedure TfrmGame.SwitchCells(aSource: TPoint; aTarget: TPoint);
var
  lJewel: TJewels;
begin
  lJewel := fJewels[aSource.X, aSource.Y];
  fJewels[aSource.X, aSource.Y] := fJewels[aTarget.X, aTarget.Y];
  fJewels[aTarget.X, aTarget.Y] := lJewel;
  SwitchImageCoordinates(aSource, aTarget);
end;

procedure TfrmGame.GameOver;
begin
  if not fMoving then
  begin
    timerCountdown.Enabled := False;
    timerCountDown.Interval := cInitialInterval;
    fTimeMultiplier := 1;
    lblGameOver.Visible := True;
    fMoving := True; // to avoid moving while game over
    if not CheckForHiScore then
      acToHall.ExecuteTarget(Self);
  end
  else
    // There's a movement in process, give an additional pulse in case the movement provides additional time
    Time := Time + 1;
end;

procedure TfrmGame.timerCountDownTimer(Sender: TObject);
begin
  Time := Time - ((timerCountdown.Interval / 1000) * FTimeMultiplier);
  if (Time = 0) then
    GameOver;
end;

procedure TfrmGame.CompleteMovement;
begin
  if not SameMatrices or fInit then
  begin
    // Fill the board
    repeat
      if fMultiplierShown then
        Inc(fConsecutiveFalls);
      fMultiplierShown := False;
      repeat
        DumpMatrix;
        FallCells;
        FillBoard;
      until SameMatrices;
      DumpMatrix;
      MatchCells;
    until SameMatrices;
  end;
end;

function TfrmGame.ValidateMovement(aSource, aTarget: TPoint; RestoreMovement: Boolean): Boolean;
begin
  if (aSource.X >= 0) and (aSource.X < cColCount) and
        (aSource.Y >= 0) and (aSource.Y < cRowCount) and
        (aTarget.X >= 0) and (aTarget.X < cColCount) and
        (aTarget.Y >= 0) and (aTarget.Y < cRowCount) then
  begin
    fMultiplierShown := False;
    fConsecutiveFalls := 1;
    // Try movement
    SwitchCells(aSource, aTarget);
    // Try match
    DumpMatrix;
    MatchCells;
    // Changed?
    Result := not SameMatrices;
    if Result and RestoreMovement or not Result then
    begin
      // Restore movement if Invalid or Valid but RestoreMovement was True
      RestoreMatrix;
      // Restore movement
      SwitchCells(aSource, aTarget);
    end;
  end
  else
    Result := False;
end;

procedure TfrmGame.ClearTarget;
begin
  fTarget := Point(-1, -1);
end;

procedure TfrmGame.ClearSelection;
begin
  fSelected := Point(-1, -1);
end;

procedure TfrmGame.DoFinishSourceAnimation(Sender: TObject);
begin
  DoMove(fSelected, fTarget);
  ClearSelection;
  ClearTarget;
end;

procedure TfrmGame.SwitchImageCoordinates(aSource, aTarget: TPoint);
var
  lSelected, lTarget: TCell;
  lX, lY: Byte;
begin
  if not fInit then
  begin
    lSelected := GetCellByPos(aSource);
    lTarget := GetCellByPos(aTarget);
    lX := lSelected.X; lY := lSelected.Y;
    lSelected.X := lTarget.X; lSelected.Y := lTarget.Y;
    lTarget.X := lX; lTarget.Y := lY;
  end;
end;

procedure TfrmGame.DoMove(aSource, aTarget: TPoint);
begin
  SwitchSelectionEffectOn(aSource, False);
  if ValidateMovement(aSource, aTarget, False) then
  begin
    fConsecutiveFalls := 1;
    StartCellFalling;
  end
  else
  begin
    // Invalid movement, move cells to where they were before
    StartSwitchAnimation(aSource, aTarget, True);
    fMoving := False;
  end;
end;

function TfrmGame.CheckMovements(i, j: Byte): Boolean;
begin
  Result := ValidateMovement(Point(i, j), Point(i, j + 1), True) or
              ValidateMovement(Point(i, j), Point(i, j - 1), True) or
              ValidateMovement(Point(i, j), Point(i + 1, j), True) or
              ValidateMovement(Point(i, j), Point(i - 1, j), True);
end;

function TfrmGame.CheckMatches: Boolean;
begin
  DumpMatrix;
  fTesting := True;
  MatchCells;
  fTesting := False;
  Result := not SameMatrices;
  RestoreMatrix;
end;

function TfrmGame.CheckAvailables: Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;
  fTesting := True;
  try
    for i := 0 to cColCount - 1 do
    begin
      for j := 0 to cRowCount - 1 do
      begin
        if CheckMovements(i, j) then
          Exit(True);
      end;
    end;
  finally
    fTesting := False;
  end;
end;

{$REGION 'Falling Cells'}
procedure TfrmGame.DoFinishFallingAnimation(Sender: TObject);
var
  i, j: Integer;
  lCell: TCell;
begin
  Dec(fFallingCells);
  if (fFallingCells = 0) then
  begin
    // Update Matrix
    for i := 0 to cColCount - 1 do
    begin
      for j := cRowCount - 2 downto 0 do
        if (fJewels[i, j] <> jEmpty) and (fJewels[i, j + 1] = jEmpty) then
        begin
          SwitchCells(Point(i, j), Point(i, j + 1));
        end;
      if (fJewels[i, 0] = jEmpty) then
      begin
        lCell := GetCellByPos(i, 0);
        fJewels[i, 0] := TJewels(lCell.Tag);
      end;
    end;
    // Something felt, repeat
    StartCellFalling;
  end;
end;

procedure TfrmGame.StartFallingAnimation(aSource: TPoint);
var
  lSource: TCell;
  lAniSource: TFloatAnimation;
begin
  Inc(fFallingCells);
  lSource := GetCellByPos(aSource);

  lAniSource := lSource.VerticalAnimation;
  lAniSource.StartValue := lSource.Position.Y;
  lAniSource.StopValue := lSource.Position.Y + fCellHeight;
  lAniSource.Inverse := False;
  lAniSource.OnFinish := DoFinishFallingAnimation;
  lAniSource.Duration := cFallAnimation;
  lAniSource.Start;
end;

procedure TfrmGame.MoveToTopAndFall(aSource: TPoint);
var
  lSource: TCell;
  lAniSource: TFloatAnimation;
  lJewel: TJewels;
begin
  Inc(fFallingCells);
  // Move empty square to the top for incoming cells
  lSource := GetCellByPos(aSource.X, aSource.Y);
  lJewel := RandomCell;
  lSource.Tag := Integer(lJewel);

  lAniSource := lSource.VerticalAnimation;
  lAniSource.StopValue := 0;
  lAniSource.StartValue := 0 - fCellHeight;
    // Move image to its starting place before refreshing will avoid flickering
  lSource.Position.Y := lAniSource.StartValue;
  // lSource.Y := 0;
  {$IFDEF VER250}
  lSource.Bitmap.Assign(ImageFor(lJewel).Bitmap);
  {$ELSE}
  lSource.MultiResBitmap.Assign(ImageFor(lJewel).MultiResBitmap);
  {$ENDIF}
  // RefreshCellImage(aSource.X, aSource.Y);
  lAniSource.Inverse := False;
  lAniSource.OnFinish := DoFinishFallingAnimation;
  lAniSource.Duration := cFallAnimation;
  lAniSource.Start;
end;

procedure TfrmGame.StartCellFalling;
var
  i, j, n: Integer;
  lSame: Boolean;
  lPromoted: Boolean;
begin
  lSame := False;
  repeat
    // Only increment fall count if a multiplier was shown (this means there were a match in previous fall)
    if fMultiplierShown then
    begin
      Inc(fConsecutiveFalls);
      fMultiplierShown := False;
    end;

    DumpMatrix;
    fFallingCells := 0;
    for i := 0 to cColCount - 1 do
    begin
      for j := cRowCount - 2 downto 0 do
      begin
        if (fWorkingArray[i, j] <> jEmpty) and (fWorkingArray[i, j + 1] = jEmpty) then
        begin
          lPromoted := False;
          // Move make the whole column fall
          for n := 0 to j do
            if (fWorkingArray[i, n] = jEmpty) and not lPromoted then
            begin
              // Move empty cell to top
              MoveToTopAndFall(Point(i, n));
              lPromoted := True;
            end
            else
              StartFallingAnimation(Point(i, n));
            if not lPromoted then
              // Move empty cell to top
              MoveToTopAndFall(Point(i, j + 1));
          Break;
        end;
        if (j = 0) and (fWorkingArray[i, 0] = jEmpty) then
        begin
          // If first cell is empty move it to top
          MoveToTopAndFall(Point(i, 0));
        end;
      end;
    end;

    if (fFallingCells = 0) then
    begin
      // Nothing felt, check matches
      DumpMatrix;
      // Check matches
      MatchCells;
      // If not matches
      lSame := SameMatrices;
      if lSame then
      begin
        // Check availability
        if not CheckAvailables then
          // If not, shuffle
          Shuffle // This will make SameMatrices be false
      end;
    end;
  // Repeat StartCellFalling while fFallingCells <> 0 (this means there are falling cells)
  // / or SameMatrices when fFallingCells = 0, which mean
  // / that there were matches or shuffles after a falling and need to check matches again
  until (fFallingCells > 0) or ((fFallingCells = 0) and lSame);

  fMoving := not (lSame and (fFallingCells = 0));
end;
{$ENDREGION}

procedure TFrmGame.StartSwitchAnimation(aSource, aTarget: TPoint; Reverse: Boolean);
var
  lSource, lTarget: TCell;
  lAniSource, lAniTarget: TFloatAnimation;
begin
  lSource := GetCellByPos(aSource);
  lTarget := GetCellByPos(aTarget);
  if not Reverse then
  begin
    fMoving := True;
    if (aSource.X = aTarget.X) then
    begin
      // Vertical animation
      lAniSource := lSource.VerticalAnimation;
      lAniTarget := lTarget.VerticalAnimation;
      lAniSource.StartValue := lSource.Position.Y;
      lAniSource.StopValue := lTarget.Position.Y;
      lAniTarget.StartValue := lTarget.Position.Y;
      lAniTarget.StopValue :=  lSource.Position.Y;
    end
    else
    begin
      // Horizontal animation
      lAniSource := lSource.HorizontalAnimation;
      lAniTarget := lTarget.HorizontalAnimation;
      lAniSource.StartValue := lSource.Position.X;
      lAniSource.StopValue := lTarget.Position.X;
      lAniTarget.StartValue := lTarget.Position.X;
      lAniTarget.StopValue :=  lSource.Position.X;
    end;
    lAniSource.Inverse := False;
    lAniTarget.Inverse := False;
    lAniSource.OnFinish := DoFinishSourceAnimation;
    lAniTarget.OnFinish := nil;
  end
  else
  begin
    if (aSource.X = aTarget.X) then
    begin
      // Vertical animation
      lAniSource := lSource.VerticalAnimation;
      lAniTarget := lTarget.VerticalAnimation;
    end
    else
    begin
      lAniSource := lSource.HorizontalAnimation;
      lAniTarget := lTarget.HorizontalAnimation;
    end;
    lAniSource.Inverse := True;
    lAniTarget.Inverse := True;
    lAniSource.OnFinish := nil;
    lAniTarget.OnFinish := nil;
  end;
  lAniSource.Duration := cTransitionAnimation;
  lAniTarget.Duration := cTransitionAnimation;
  lAniSource.Start;
  lAniTarget.Start;
end;

{$REGION 'CellPos'}

function TfrmGame.AdjacentCells(aCell, anotherCell: TPoint): Boolean;
begin
  Result :=
       ((Abs(aCell.X - anotherCell.X) = 1) and (aCell.Y - anotherCell.Y = 0)) or
       ((Abs(aCell.Y - anotherCell.Y) = 1) and (aCell.X - anotherCell.X = 0));
end;

function TfrmGame.GetCellByPos(aCell: TPoint): TCell;
begin
  Result := GetCellByPos(aCell.X, aCell.Y);
end;

function TfrmGame.GetCellByPos(i, j: Byte): TCell;
var
  lCell: TCell;
begin
  Result := nil;
  if (i < cColCount) and (j < cRowCount) then
  begin
    for lCell in fCellList do
      if (lCell.X = i) and (lCell.Y = j) then
      begin
        Result := lCell;
        Break;
      end;
  end;
end;

function TfrmGame.ImageFor(aCellType: TJewels): TImage;
begin
  case aCellType of
    jPearl: Result := imPearl;
    jEmerald: Result := imEmerald;
    jDiamond: Result := imDiamond;
    jRuby: Result:= imRuby;
    jSapphire: Result := imSapphire;
    jAmber: Result := imAmber;
    jAmethyst: Result := imAmethyst;
  else
    Result := nil;
  end;
end;

procedure TfrmGame.RefreshCellImage(i, j: Byte);
var
  lImage: TImage;
  lCell: TCell;
begin
  if not fInit and not fTesting then
  begin
    lImage := ImageFor(fJewels[i, j]);
    lCell := GetCellByPos(i, j);
    LCell.Position.X := i * fCellWidth;
    LCell.Position.Y := j * fCellHeight;
    if Assigned(lImage) then
      {$IFDEF VER250}
      lCell.Bitmap.Assign(lImage.Bitmap)
      {$ELSE}
      lCell.MultiResBitmap.Assign(lImage.MultiResBitmap)
      {$ENDIF}
    else
      {$IFDEF VER250}
      lCell.Bitmap.SetSize(0, 0);
      {$ELSE}
      lCell.MultiResBitmap.Clear;
      {$ENDIF}
  end;
end;

procedure TfrmGame.RefreshBoard;
var
  i, j: Byte;
begin
  if SelectionAvailable then
    SwitchSelectionEffectOn(fSelected, False);
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      RefreshCellImage(i, j);
end;

function TfrmGame.RandomCell: TJewels;
begin
  Result := TJewels(Random(Integer(High(TJewels))) + 1);
end;

procedure TfrmGame.RandomBoard;
var
  i, j: Byte;
begin
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      fJewels[i, j] := RandomCell;
end;

{$ENDREGION}

{$REGION 'Mouse handling'}

procedure TfrmGame.DoMouseLeave(Sender: TObject);
begin
  //
end;

procedure TfrmGame.DoImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
  lCell: TPoint;
begin
  lCell.X := TCell(Sender).X;
  lCell.Y := TCell(Sender).Y;

  if fDragging and SelectionAvailable then
  begin

    Label1.Text := Format('dragging %s (%d, %d) over %s (%d, %d)', [cJewels[fJewels[fSelected.X, fSelected.Y]], fSelected.x, fSelected.y, cJewels[fJewels[lCell.X, lCell.Y]], lCell.X, lCell.Y]);

    if not fMoving and AdjacentCells(fSelected, lCell) then
    begin
      fTarget := lCell;
      StartSwitchAnimation(fSelected, fTarget, False);
    end;
  end
  else
  begin
    label1.Text := Format('%s (%d, %d)', [cJewels[fJewels[lCell.X, lCell.Y]], lCell.X, lCell.Y]);
  end;
end;

procedure TfrmGame.DoImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  lCell: TCell;
begin
  if not fMoving then
  begin
    Label1.Text := Format('Clicked %d, %d', [fSelected.X, fSelected.Y]);
    lCell := TCell(Sender);
    if not SelectionAvailable then
    begin
      fSelected.X := Trunc(lCell.X);
      fSelected.Y := Trunc(lCell.Y);
      ClearTarget;
      SwitchSelectionEffectOn(fSelected, True);
    end
    else
    begin
      // Something is selected
      SwitchSelectionEffectOn(fSelected, False);
      if (fSelected.X = lCell.X) and (fSelected.Y = lCell.Y) then
        // If the selected cell and the clicked cell is the same, then unselect
        ClearSelection
      else
      begin
        if AdjacentCells(fSelected, Point(LCell.X, lCell.Y)) then
        begin
          // Cells are adjacent, make movement
          fTarget.X := lCell.X;
          fTarget.Y := lCell.Y;
          StartSwitchAnimation(fSelected, fTarget, False);
        end
        else
        begin
          // Not adjacents, Mark selected as current
          ClearTarget;
          fSelected.X := lCell.X;
          fSelected.Y := lCell.Y;
          SwitchSelectionEffectOn(fSelected, True);
        end;
      end;
    end;
  end;
  fDragging := True;
end;

procedure TfrmGame.DoImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  fDragging := False;
//  Label1.Text := Format('dropped %d, %d', [fSelected.x, fSelected.y]);
//  if not TargetAvailable then
//    ClearSelection;
end;

{$ENDREGION}

procedure TfrmGame.SwitchSelectionEffectOn(aSelected: TPoint; Enabled: Boolean);
var
  lSelected: TCell;
begin
  lSelected := GetCellByPos(aSelected);
  lSelected.SelectionEffect.Inverse := not Enabled;
  if Enabled then
  begin
    lSelected.SelectionEffect.Duration := 2;
    lSelected.SelectionEffect.StartValue := 0.8;
    lSelected.SelectionEffect.Loop := True;
    lSelected.SelectionEffect.AutoReverse := True;
  end
  else
  begin
    lSelected.SelectionEffect.Loop := False;
    lSelected.SelectionEffect.Duration := 0.2;
    lSelected.SelectionEffect.StartValue := 0;
    lSelected.SelectionEffect.AutoReverse := False;
  end;

  lSelected.SelectionEffect.Start;
end;

procedure TfrmGame.TabControlChange(Sender: TObject);
begin
  if (TabControl.ActiveTab = tiHall) then
  begin
    HallOfFameGlowAnimation.Enabled := True;
    pnPlay.Visible := True;
    InitializeScoreAnimation;
  end
  else
  begin
    HallOfFameGlowAnimation.Enabled := False;
    if (TabControl.ActiveTab = tiHall) then
    begin
      lblYourScore.Text := Format(cYourScoreWas, [Score]);
    end;
  end;
end;

function TfrmGame.GetMaxTime: Single;
begin
  Result := barTime.Max;
end;

function TfrmGame.GetTime: Single;
begin
  Result := barTime.Value;
end;

procedure TfrmGame.SetMaxTime(const Value: Single);
begin
  barTime.Max := Value;
end;

procedure TfrmGame.SetOnFinish(const Value: TNotifyEvent);
begin
  FOnFinish := Value;
end;

procedure TfrmGame.SetTime(const Value: Single);
begin
  barTime.Value := Min(Value, MaxTime);
end;

procedure TfrmGame.SetScore(const Value: Cardinal);
var
  lDif: Cardinal;
begin
  if not fInit and not fTesting then
  begin
    lDif := Value - FScore;
    Time := Time + (lDif div cCellPoints);
    FScore := Value;
    lblScore.Text := IntToStr(FScore);
    fTimeMultiplier := Min(fTimeMultiplier + (lDif / 10000), cMaxTimeMultiplier);
    // 10000 means that time will run x2 at 10.000 points
  end;
end;

procedure TfrmGame.aniShuffleFinish(Sender: TObject);
begin
  lblShuffing.Visible := False;
end;

procedure TfrmGame.btnPlayClick(Sender: TObject);
begin
  InitLevel(0);
  acToGame.ExecuteTarget(Self);
end;

procedure TfrmGame.Button1Click(Sender: TObject);
begin
  RefreshBoard;
end;

procedure TfrmGame.btnShuffleClick(Sender: TObject);
begin
  Shuffle;
end;

procedure TfrmGame.Shuffle;
var
  n: Integer;
begin
  label1.Text := 'Shuffling, no more matches available';
  lblShuffing.Visible := True;
  n := 0;
  repeat
    SwitchCells(
      Point(Random(cColCount), Random(cRowCount)),
      Point(Random(cColCount), Random(cRowCount))
      );
    Inc(n);       /// Initial shuffling        /// Shuffling if not availables or matches in board
  until (n > cColCount * cRowCount - 1) and CheckAvailables and not CheckMatches;
  aniShuffle.Start;
  AniShufflingGlow.Start;
  RefreshBoard;
end;

procedure TfrmGame.FillBoard;
var
  i: Integer;
begin
  for i := 0 to cColCount - 1 do
    if (fJewels[i, 0] = jEmpty) then
    begin
      fJewels[i, 0] := RandomCell;
      RefreshCellImage(i, 0);
    end;
end;

procedure TfrmGame.FallCells;
var
  i, j: Integer;
begin
  for i := 0 to cColCount - 1 do
    for j := cRowCount - 2 downto 0 do
      if (fJewels[i, j + 1] = jEmpty) then
        SwitchCells(Point(i, j), Point(i, j + 1));
end;

function TfrmGame.SameMatrices: Boolean;
var
  i, j: Integer;
begin
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      if (fWorkingArray[i, j] <> fJewels[i, j]) then
        Exit(False);

  Result := True;
end;

procedure TfrmGame.DumpMatrix;
var
  i, j: Integer;
begin
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      fWorkingArray[i, j] := fJewels[i, j];
end;

procedure TfrmGame.RestoreMatrix;
var
  i, j: Integer;
begin
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      fJewels[i, j] := fWorkingArray[i, j];
end;

procedure TfrmGame.DoTextFinish(Sender: TObject);
begin
  if (Sender is TfmxObject) and Assigned(TFmxObject(Sender).Parent) and (TFmxObject(Sender).Parent is TText) then
  begin
    TFmxObject(Sender).Parent.DisposeOf;
  end;
end;

procedure TfrmGame.CreateTextAnimation(i, j: Integer; Const aValue: string; aTextType: TTextType);
var
  lText: TText;
  lEffect: TGlowEffect;
  lAni: TFloatAnimation;
begin
  lText := TText.Create(nil);
  lText.Parent := BoardLayout;
  lText.Text := aValue;
  lText.WordWrap := False;
  lText.AutoSize := True;
  lText.Position.X := i * fCellWidth;
  lText.Position.Y := j * fCellHeight;
  lText.HitTest := False;
  lText.Font.Style := [TFontStyle.fsBold];
  lText.BringToFront;

  lEffect := TGlowEffect.Create(lText);
  lEffect.Parent := lText;

  lAni := TFloatAnimation.Create(lText);
  lAni.Parent := lText;
  lAni.PropertyName := 'Position.Y';
  lAni.StartValue := lText.Position.Y;
  lAni.StopValue := lAni.StartValue - fCellHeight;
  lAni.OnFinish := DoTextFinish;

  case aTextType of
    ttScore:
      begin
        lText.Font.Size := 15;
        lText.Color := TAlphaColorRec.White;
        lEffect.GlowColor := TAlphaColorRec.Black;
        lEffect.Softness := 0;
        lAni.Duration := 2;
      end;
    ttMultiplier:
      begin
        lText.Font.Size := 30;
        lText.Color := TAlphaColorRec.Magenta;
        lEffect.GlowColor := TAlphaColorRec.Black;
        lEffect.Softness := 0;
        lAni.Duration := 4;
        lText.BringToFront;
      end;
  end;

  lAni.Start;
end;

procedure TfrmGame.UpdateScore(i, j: Byte; aScore: Cardinal);
begin
  if (aScore > 0) then
  begin
    Score := Score + aScore;
    CreateTextAnimation(i, j, IntToStr(aScore), ttScore);
    if not fMultiplierShown then
    begin
      if (fConsecutiveFalls > 1) then
        CreateTextAnimation(i + 1, j - 1, 'x'+IntToStr(fConsecutiveFalls), ttMultiplier);
      fMultiplierShown := True;
    end;
  end;
end;

{$REGION 'Matching'}

procedure TfrmGame.KillVertical(i, j, aCount: Integer);
var
  n: Integer;
  lScore: Integer;
begin
  // Check if there's something to kill -> it can be previously killed by a longer match
  if (fJewels[i, j] <> jEmpty) then
  begin
    lScore := 0;
    for n := j to j + aCount - 1 do
    begin
      if not fInit and not fTesting then
        lScore := lScore + cCellPoints * fConsecutiveFalls;
      fJewels[i, n] := jEmpty;
      RefreshCellImage(i, n);
    end;
    UpdateScore(i, j, lScore);
    Inc(fSimultaneousMatches);
  end;
end;

procedure TfrmGame.KillHorizontal(i, j, aCount: Integer);
var
  n: Integer;
  lScore: Integer;
begin
  // Check if there's something to kill -> it can be previously killed by a longer match
  if (fJewels[i, j] <> jEmpty) then
  begin
    lScore := 0;
    for n := i to i + aCount - 1 do
    begin
      if not fInit and not fTesting then
        lScore := lScore + cCellPoints * fConsecutiveFalls;
      fJewels[n, j] := jEmpty;
      RefreshCellImage(n, j);
    end;
    UpdateScore(i, j, lScore);
    Inc(fSimultaneousMatches);
  end;
end;

function TfrmGame.CheckVertical(i, j: Integer): Integer;
var
  lJewel: TJewels;
begin
  lJewel := fWorkingArray[i, j];
  Result := 1;
  while (j + Result < cRowCount) and (fWorkingArray[i, j + Result] = lJewel) do
    Inc(Result);
end;

function TfrmGame.CheckHorizontal(i, j: Integer): Integer;
var
  lJewel: TJewels;
begin
  lJewel := fWorkingArray[i, j];
  Result := 1;
  while (i + Result  < cColCount) and (fWorkingArray[i + Result, j] = lJewel) do
    Inc(Result);
end;

procedure TfrmGame.MatchCells;
var
  i, j: Integer;
  lCount: Integer;
begin
  fSimultaneousMatches := 0;
  for i := 0 to cColCount - 1 do
    for j := 0 to cRowCount - 1 do
      if (fWorkingArray[i, j] <> jEmpty) then
      begin
        lCount := CheckVertical(i, j);
        if (lCount >= cMinToMatch) then
          KillVertical(i, j, lCount);
        lCount := CheckHorizontal(i, j);
        if (lCount >= cMinToMatch) then
          KillHorizontal(i, j, lCount);
      end;
end;

{$ENDREGION}

initialization

Randomize;

finalization

end.
