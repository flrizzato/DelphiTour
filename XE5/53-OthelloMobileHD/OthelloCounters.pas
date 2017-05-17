unit OthelloCounters;

interface

uses FMX.Objects3D, System.Classes, FMX.MaterialSources, FMX.Ani, FMX.Types, FMX.Types3D, FMX.Dialogs;

type
  TOthelloBlackMaterial = class(TLightMaterialSource)
  public
    constructor Create(aOwner : TComponent);
  end;

  TOthelloWhiteMaterial = class(TLightMaterialSource)
  public
    constructor Create(aOwner : TComponent);
  end;

  TOthelloState = (Unset, Black, White);

  TOthelloCounter = class(TDummy)
  type
    TOthelloCylinder = class(TCylinder)
    private
      FSphere : TSphere;
      procedure SetDepth(const Value: Single);
      procedure SetHeight(const Value: Single);
      procedure SetSubdivisionsAxes(const Value: Integer);
      procedure SetWidth(const Value: Single);
      function GetDepth: Single;
      function GetHeight: Single;
      function GetSubdivisionsAxes: Integer;
      function GetWidth: Single;
      function GetMaterialSource: TMaterialSource;
      procedure SetMaterialSource(const Value: TMaterialSource);
    public
      constructor Create(aOwner : TComponent; aOffset: Single); reintroduce;
      destructor Destroy; override;
      property Width : Single read GetWidth write SetWidth;
      property Height : Single read GetHeight write SetHeight;
      property Depth : Single read GetDepth write SetDepth;
      property SubdivisionsAxes : Integer read GetSubdivisionsAxes write SetSubdivisionsAxes;
      property MaterialSource : TMaterialSource read GetMaterialSource write SetMaterialSource;
    end;
  //const CylinderHeight = 0.2;
  strict private
     FBlackSide,
     FWhiteSide : TOthelloCylinder;
     FCounterState: TOthelloState;

  private
    function GetBlackMaterialSource: TMaterialSource;
    function GetWhiteMaterialSource: TMaterialSource;
    procedure SetBlackMaterialSource(const Value: TMaterialSource);
    procedure SetWhiteMaterialSource(const Value: TMaterialSource);
    procedure SetCounterState(const Value: TOthelloState);

  public
    constructor Create(aOwner : TComponent; aTileSize:Single; aBlackMaterial, aWhiteMaterial : TMaterialSource); reintroduce;
    property BlackMaterialSource : TMaterialSource read GetBlackMaterialSource write SetBlackMaterialSource;
    property WhiteMaterialSource : TMaterialSource read GetWhiteMaterialSource write SetWhiteMaterialSource;

    property CounterState : TOthelloState read FCounterState write SetCounterState;
  end;

implementation

uses System.UITypes, System.SysUtils;

{ TOthelloCounter }

constructor TOthelloCounter.Create(aOwner: TComponent; aTileSize:Single; aBlackMaterial, aWhiteMaterial : TMaterialSource);

  function CreateCylinder(aPosition : Single): TOthelloCylinder;
  begin
    // Sort position in Dummy
    Result := TOthelloCylinder.Create(aOwner,aPosition);
    REsult.Parent := Self;
    Result.Height := aTileSize;
    Result.Width := aTileSize*4;
    Result.Depth := aTileSize;
    Result.SubdivisionsAxes := 32;
  end;


begin
  inherited Create(aOwner);

  // The Counter is made up of two cylinders with 2 spheres.
  FBlackSide := CreateCylinder(aTileSize/2);
  FWhiteSide := CreateCylinder(-aTileSize/2);

  BlackMaterialSource := aBlackMaterial;
  WhiteMaterialSource := aWhiteMaterial;

  Self.Scale.X := 0.25;
  Self.Scale.Y := 0.25;

  Self.RotationAngle.X := -90;
end;

function TOthelloCounter.GetBlackMaterialSource: TMaterialSource;
begin
  Assert(FBlackSide <> nil);
  Result := FBlackSide.MaterialSource;
end;

function TOthelloCounter.GetWhiteMaterialSource: TMaterialSource;
begin
  Assert(FWhiteSide <> nil);
  Result := FWhiteSide.MaterialSource;
end;

procedure TOthelloCounter.SetBlackMaterialSource(
  const Value: TMaterialSource);
begin
  Assert(FBlackSide <> nil);
  FBlackSide.MaterialSource := Value;
end;

procedure TOthelloCounter.SetCounterState(const Value: TOthelloState);
begin
  if CounterState = Unset then
  begin
    case Value of
      Black: Self.RotationAngle.Z := 0;
      White: Self.RotationAngle.Z := 180;
    end;
    FCounterState := Value;
  end
  else if FCounterState <> Value then
  begin
    Self.AnimateFloat('RotationAngle.Z', Self.RotationAngle.Z+180, 1, TAnimationType.atInOut, TInterpolationType.itBack);
    Self.AnimateFloat('Position.Z', -2, 0.5);
    Self.AnimateFloatDelay('Position.Z', 0, 0.5, 0.5);
    FCounterState := Value;
  end;
end;

procedure TOthelloCounter.SetWhiteMaterialSource(
  const Value: TMaterialSource);
begin
  Assert(FBlackSide <> nil);
  FWhiteSide.MaterialSource := Value;
end;

{ TOthelloWhiteMaterial }

constructor TOthelloWhiteMaterial.Create(aOwner: TComponent);
begin
  inherited;
  Diffuse := TAlphaColorRec.White;
  Ambient :=  TAlphaColor($FF202020);
  Emissive := TAlphaColorRec.Null;
  Specular := TAlphaColor($FF606060);
  Shininess := 30;
end;

{ TOthelloBlackMaterial }

constructor TOthelloBlackMaterial.Create(aOwner: TComponent);
begin
  inherited;
  Diffuse := TAlphaColor($FF202020);
  Ambient := TAlphaColor($FF202020);
  Emissive := TAlphaColorRec.Null;
  Specular := TAlphaColor($FF606060);
  Shininess := 30;
end;

{ TOthelloCounter.TOthelloCylinder }

constructor TOthelloCounter.TOthelloCylinder.Create(aOwner: TComponent; aOffset: Single);
begin
  inherited Create(aOwner);
  FSphere := TSphere.Create(Self);
  FSphere.Parent := Self;

  // Setup current rotation angles
  Self.RotationAngle.X := 0;
  Self.RotationAngle.Y := 0;
  Self.RotationAngle.Z := 0;

  Self.SubdivisionsAxes := 32;
  Self.Position.Y := aOffset;
  FSphere.Position.Y := aOffset;
  FSphere.SubdivisionsHeight := 24;
end;

destructor TOthelloCounter.TOthelloCylinder.Destroy;
begin
  FreeAndNil(FSphere);
  inherited;
end;

function TOthelloCounter.TOthelloCylinder.GetDepth: Single;
begin
  Result := inherited Depth;
end;

function TOthelloCounter.TOthelloCylinder.GetHeight: Single;
begin
  Result := inherited Height;
end;

function TOthelloCounter.TOthelloCylinder.GetMaterialSource: TMaterialSource;
begin
  Result := inherited MaterialSource;
end;

function TOthelloCounter.TOthelloCylinder.GetSubdivisionsAxes: Integer;
begin
  Result := inherited SubdivisionsAxes;
end;

function TOthelloCounter.TOthelloCylinder.GetWidth: Single;
begin
  Result := inherited Width;
end;

procedure TOthelloCounter.TOthelloCylinder.SetDepth(const Value: Single);
begin
  inherited Depth := Value;
  FSphere.Depth := Value;
end;

procedure TOthelloCounter.TOthelloCylinder.SetHeight(const Value: Single);
begin
  inherited Height := Value;
  FSphere.Height := Value;
end;

procedure TOthelloCounter.TOthelloCylinder.SetMaterialSource(
  const Value: TMaterialSource);
begin
  inherited MaterialSource := Value;
  FSphere.MaterialSource := Value;
end;

procedure TOthelloCounter.TOthelloCylinder.SetSubdivisionsAxes(
  const Value: Integer);
begin
  inherited SubdivisionsAxes := Value;
  FSphere.SubdivisionsAxes := Value;
end;

procedure TOthelloCounter.TOthelloCylinder.SetWidth(const Value: Single);
begin
  inherited Width := Value;
  FSphere.Width := Value;
end;

end.
