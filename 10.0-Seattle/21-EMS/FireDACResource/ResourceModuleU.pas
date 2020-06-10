//---------------------------------------------------------------------------

// This software is Copyright (c) 2014 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit ResourceModuleU;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Stan.StorageJSON, FireDAC.Comp.DataSet;

type
  [ResourceName('test')]  // Url segment.  For example, use http://localhost:8080/test
  TResourceModule = class(TDataModule)
    dsOrders: TDataSource;
    dsCustomers: TDataSource;
    qOrders: TFDQuery;
    qCustomers: TFDQuery;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection1: TFDConnection;
  published
    [EndpointName('GetRecords')] // Name to show in analytics
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [EndpointName('PostUpdates')] // Name to show in  analytics
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

procedure Register;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TResourceModule));
end;

// Get table data
procedure TResourceModule.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  oStr: TMemoryStream;
begin
  oStr := TMemoryStream.Create;
  try
    qCustomers.Open;
    qOrders.Open;
    FDSchemaAdapter1.SaveToStream(oStr, TFDStorageFormat.sfJSON);
    // Response owns stream
    AResponse.Body.SetStream(oStr, 'application/json', True);
  except
    oStr.Free;
  end;
end;

// Apply updates
procedure TResourceModule.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LStream: TStream;
begin
  if not SameText(ARequest.Body.ContentType, 'application/json') then
    AResponse.RaiseBadRequest('content type');
  if not ARequest.Body.TryGetStream(LStream) then
    AResponse.RaiseBadRequest('no stream');
  LStream.Position := 0;
  FDSchemaAdapter1.LoadFromStream(LStream, TFDStorageFormat.sfJSON);
  FDSchemaAdapter1.ApplyUpdates
end;

end.


