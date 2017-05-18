{===============================================================================
  RadiantTicTacToeForm Unit

  Radiant Shapes - Demo Source Unit

  Copyright © 2012-2014 by Raize Software, Inc.  All Rights Reserved.

  Modification History
  ------------------------------------------------------------------------------
  1.0    (29 Oct 2014)
    * Initial release.
===============================================================================}

unit RadiantTicTacToeForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  Radiant.Shapes;

type
  TPlayerMove = ( PlayerX, PlayerO );

  TfrmTicTacToe = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    RadiantRectangle1: TRadiantRectangle;
    RadiantRectangle2: TRadiantRectangle;
    RadiantRectangle3: TRadiantRectangle;
    RadiantRectangle4: TRadiantRectangle;
    Layout1: TLayout;
    RadiantRing1: TRadiantRing;
    RadiantX1: TRadiantX;
    Layout2: TLayout;
    RadiantRing2: TRadiantRing;
    RadiantX2: TRadiantX;
    Layout3: TLayout;
    RadiantRing3: TRadiantRing;
    RadiantX3: TRadiantX;
    Layout4: TLayout;
    RadiantRing4: TRadiantRing;
    RadiantX4: TRadiantX;
    Layout5: TLayout;
    RadiantRing5: TRadiantRing;
    RadiantX5: TRadiantX;
    Layout6: TLayout;
    RadiantRing6: TRadiantRing;
    RadiantX6: TRadiantX;
    Layout7: TLayout;
    RadiantRing7: TRadiantRing;
    RadiantX7: TRadiantX;
    Layout8: TLayout;
    RadiantRing8: TRadiantRing;
    RadiantX8: TRadiantX;
    Layout9: TLayout;
    RadiantRing9: TRadiantRing;
    RadiantX9: TRadiantX;
    Layout10: TLayout;
    btnNewGame: TButton;
    StyleBook1: TStyleBook;
    procedure CellClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewGameClick(Sender: TObject);
  private
    { Private declarations }
    FNextMove: TPlayerMove;
    FGameOver: Boolean;
    FRadiantXs: array[ 1..9 ] of TRadiantX;
    FRadiantRings: array[ 1..9 ] of TRadiantRing;

    procedure NewGame;
    procedure CheckForWinner;
    function CheckX( Cell1, Cell2, Cell3: Integer ): Boolean;
    function CheckO( Cell1, Cell2, Cell3: Integer ): Boolean;
    procedure ShowWinnerX( Cell1, Cell2, Cell3: Integer );
    procedure ShowWinnerO( Cell1, Cell2, Cell3: Integer );
  public
    { Public declarations }
  end;

var
  frmTicTacToe: TfrmTicTacToe;

implementation

{$R *.fmx}

const
  FillColorX: TAlphaColor = $4432CDFF;
  StrokeColorX: TAlphaColor = $FF32CDFF;
  FillColorO: TAlphaColor = $44EB6FFF;
  StrokeColorO: TAlphaColor = $FFEB6FFF;
  FillColorWin: TAlphaColor = $4439FF32;
  StrokeColorWin: TAlphaColor = $FF39FF32;


procedure TfrmTicTacToe.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 9 do
  begin
    FRadiantXs[ I ] := FindComponent( 'RadiantX' + IntToStr( I ) ) as TRadiantX;
    FRadiantXs[ I ].Fill.Kind := TBrushKind.Solid;
    FRadiantXs[ I ].Fill.Color := FillColorX;
    FRadiantXs[ I ].Stroke.Color := StrokeColorX;

    FRadiantRings[ I ] := FindComponent( 'RadiantRing' + IntToStr( I ) ) as TRadiantRing;
    FRadiantRings[ I ].Fill.Kind := TBrushKind.Solid;
    FRadiantRings[ I ].Fill.Color := FillColorO;
    FRadiantRings[ I ].Stroke.Color := StrokeColorO;
  end;
  NewGame;
end;


procedure TfrmTicTacToe.NewGame;
var
  I: Integer;
begin
  FNextMove := PlayerX;
  FGameOver := False;

  for I := 1 to 9 do
  begin
    FRadiantXs[ I ].Visible := False;
    FRadiantXs[ I ].Fill.Color := FillColorX;
    FRadiantXs[ I ].Stroke.Color := StrokeColorX;

    FRadiantRings[ I ].Visible := False;
    FRadiantRings[ I ].Fill.Color := FillColorO;
    FRadiantRings[ I ].Stroke.Color := StrokeColorO;
  end;
end;


procedure TfrmTicTacToe.btnNewGameClick(Sender: TObject);
begin
  NewGame;
end;


procedure TfrmTicTacToe.CellClick(Sender: TObject);
var
  Idx: Integer;
begin
  Idx := TLayout( Sender ).Tag;

  if FGameOver or FRadiantXs[ Idx ].Visible or FRadiantRings[ Idx ].Visible then
    Exit;

  if FNextMove = PlayerX then
    FRadiantXs[ Idx ].Visible := True
  else
    FRadiantRings[ Idx ].Visible := True;

  if FNextMove = PlayerX then
    FNextMove := PlayerO
  else
    FNextMove := PlayerX;

  CheckForWinner;
end;


procedure TfrmTicTacToe.CheckForWinner;
begin
  if CheckX( 1, 5, 9 ) or
     CheckX( 3, 5, 7 ) or
     CheckX( 1, 2, 3 ) or
     CheckX( 4, 5, 6 ) or
     CheckX( 7, 8, 9 ) or
     CheckX( 1, 4, 7 ) or
     CheckX( 2, 5, 8 ) or
     CheckX( 3, 6, 9 ) then
  begin
    FGameOver := True;
    Exit;
  end;

  if CheckO( 1, 5, 9 ) or
     CheckO( 3, 5, 7 ) or
     CheckO( 1, 2, 3 ) or
     CheckO( 4, 5, 6 ) or
     CheckO( 7, 8, 9 ) or
     CheckO( 1, 4, 7 ) or
     CheckO( 2, 5, 8 ) or
     CheckO( 3, 6, 9 ) then
  begin
    FGameOver := True;
    Exit;
  end;
end;


function TfrmTicTacToe.CheckX( Cell1, Cell2, Cell3: Integer ): Boolean;
begin
  Result := FRadiantXs[ Cell1 ].Visible and
            FRadiantXs[ Cell2 ].Visible and
            FRadiantXs[ Cell3 ].Visible;
  if Result then
    ShowWinnerX( Cell1, Cell2, Cell3 );
end;


function TfrmTicTacToe.CheckO( Cell1, Cell2, Cell3: Integer ): Boolean;
begin
  Result := FRadiantRings[ Cell1 ].Visible and
            FRadiantRings[ Cell2 ].Visible and
            FRadiantRings[ Cell3 ].Visible;
  if Result then
    ShowWinnerO( Cell1, Cell2, Cell3 );
end;


procedure TfrmTicTacToe.ShowWinnerX( Cell1, Cell2, Cell3: Integer );
begin
  FRadiantXs[ Cell1 ].Fill.Color := FillColorWin;
  FRadiantXs[ Cell1 ].Stroke.Color := StrokeColorWin;

  FRadiantXs[ Cell2 ].Fill.Color := FillColorWin;
  FRadiantXs[ Cell2 ].Stroke.Color := StrokeColorWin;

  FRadiantXs[ Cell3 ].Fill.Color := FillColorWin;
  FRadiantXs[ Cell3 ].Stroke.Color := StrokeColorWin;
end;


procedure TfrmTicTacToe.ShowWinnerO( Cell1, Cell2, Cell3: Integer );
begin
  FRadiantRings[ Cell1 ].Fill.Color := FillColorWin;
  FRadiantRings[ Cell1 ].Stroke.Color := StrokeColorWin;

  FRadiantRings[ Cell2 ].Fill.Color := FillColorWin;
  FRadiantRings[ Cell2 ].Stroke.Color := StrokeColorWin;

  FRadiantRings[ Cell3 ].Fill.Color := FillColorWin;
  FRadiantRings[ Cell3 ].Stroke.Color := StrokeColorWin;
end;

end.
