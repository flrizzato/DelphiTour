unit OthelloBoard;

interface

uses FMX.Objects3D, System.Classes, FMX.MaterialSources, FMX.Dialogs, OthelloCounters, System.UITypes;

type
  TOthelloTile = class;

  TOthelloTileClick = procedure(Sender : TOthelloTile) of object;

  TOthelloTile = class(TRectangle3D)
  private
    FX: Integer;
    FY: Integer;
  public
    constructor Create(aOwner : TComponent; aX, aY : Integer); reintroduce;
  published
    property X : Integer read FX;
    property Y : Integer read FY;
  end;

  TOthelloBoard = class(TDummy)
  strict private
    GridSize: Integer;
    TileSize: Single;
    procedure InternalOnTileClick(Sender: TObject);
  private
    Tiles: Array of Array of TOthelloTile;
    BoardEdge: TRectangle3D;
    BoardEdgeColor: TColorMaterialSource;
    FOnTileClick: TOthelloTileClick;
  public
    constructor Create(aOwner : TComponent; aGridSize: Integer; aTileSize: Single;
                       aLightMaterial, aDarkMaterial: TMaterialSource); reintroduce;
    destructor Destroy; override;
    property OnTileClick : TOthelloTileClick read FOnTileClick write FOnTileClick;
  end;

implementation

uses OthelloGame;

constructor TOthelloBoard.Create(aOwner: TComponent; aGridSize: Integer; aTileSize: Single;
                                 aLightMaterial, aDarkMaterial: TMaterialSource);
var
  i: Integer;
  j: Integer;
  Rect : TOthelloTile;
begin
  inherited Create(aOwner);
  GridSize := aGridSize;
  TileSize := aTileSize;

  SetLength(Tiles, GridSize, GridSize);
  for i := 0 to High(Tiles) do
    for j := 0 to High(Tiles) do
    begin
      Rect := TOthelloTile.Create(Self,i,j);
      Rect.Parent := Self;
      Rect.Position.X := i * TileSize;
      Rect.Position.Y := j * TileSize;
      Rect.Width := TileSize;
      Rect.Height := TileSize;
      Rect.Depth := 0.5;
      Rect.OnClick := InternalOnTileClick;

      if ((i MOD 2 = 0) AND (j MOD 2 = 0)) OR ((i MOD 2 <> 0) AND (j MOD 2 <> 0)) then
      begin
        Rect.MaterialSource := aLightMaterial;
        Rect.MaterialShaftSource := aDarkMaterial;
      end
      else
      begin
        Rect.MaterialSource := aDarkMaterial;
        Rect.MaterialShaftSource := aLightMaterial;
      end;


      Tiles[i][j] := Rect;

    end;

    BoardEdgeColor := TColorMaterialSource.Create(Self);
    BoardEdgeColor.Color := TAlphaColorRec.Black;

    BoardEdge := TRectangle3D.Create(Self);
    BoardEdge.Parent := Self;
    BoardEdge.Width := TileSize*GridSize*1.1;
    BoardEdge.Height := TileSize*GridSize*1.1;
    BoardEdge.Position.X := ((TileSize*GridSize)-1)/2;
    BoardEdge.Position.Y := ((TileSize*GridSize)-1)/2;
    BoardEdge.Position.Z := 0.2;
    BoardEdge.Depth := 0.5;
    BoardEdge.MaterialSource := BoardEdgeColor;


end;

destructor TOthelloBoard.Destroy;
var
  i: Integer;
  j: Integer;
begin
  for i := 0 to High(Tiles) do
    for j := 0 to High(Tiles) do begin
      Tiles[i][j].DisposeOf;
      Tiles[i][j] := nil;
    end;

  SetLength(Tiles,0,0);

  inherited;
end;

procedure TOthelloBoard.InternalOnTileClick(Sender: TObject);
var
  i: Integer;
  j: Integer;
begin
  for i := 0 to High(Tiles) do
    for j := 0 to High(Tiles) do
    begin
      if Tiles[i][j] = TOthelloTile(Sender) then begin
        if Assigned(OnTileClick) then begin
          OnTileClick( Tiles[i][j] );
          Exit;
        end;
      end;
    end;
end;

{ TOthelloTile }

constructor TOthelloTile.Create(aOwner: TComponent; aX, aY: Integer);
begin
  Inherited Create(aOwner);
  FX := aX;
  FY := aY;
end;

end.
