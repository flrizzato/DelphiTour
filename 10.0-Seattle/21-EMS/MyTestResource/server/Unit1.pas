unit Unit1;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes;

type
  [ResourceName('MyTest')]
  TMyTestResource1 = class(TDataModule)
  private
    function MakeJSON(i: integer): TJSONObject;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

  const
    TestValues: array[0..2] of string = ('a', 'b', 'c');

procedure Register;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TMyTestResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LJSON: TJSONArray;
  I: Integer;
begin
  LJSON := TJSONArray.Create;
  for I := Low(TestValues) to High(TestValues) do
    LJSON.Add(MakeJSON(I));
  AResponse.Body.SetValue(LJSON, True)  // True causes AResponse to free JSON
end;

procedure TMyTestResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  I: Integer;
begin
  if not TryStrToInt(ARequest.Params.Values['item'], I) then
    AResponse.RaiseBadRequest('Index expected');
  if (I < 0) or (I >= Length(TestValues)) then
    AResponse.RaiseBadRequest('Index out of range');
  AResponse.Body.SetValue(MakeJSON(I), True);  // True causes AResponse to free JSON
end;

function TMyTestResource1.MakeJSON(i: integer): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('index', TJSONNumber.Create(i));
  Result.AddPair('value', TJSONString.Create(TestValues[i]));
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TMyTestResource1));
end;

end.


