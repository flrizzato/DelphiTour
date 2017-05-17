//
// Created by the DataSnap proxy generator.
// 5/19/2014 11:33:04 PM
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetCustomersCommand: TDSRestCommand;
    FGetCustomersCommand_Cache: TDSRestCommand;
    FApplyCustomersCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetCustomers(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetCustomers_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyCustomers(ADelta: TFDJSONDeltas);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetCustomers: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetCustomers_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_ApplyCustomers: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADelta'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetCustomers(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetCustomersCommand = nil then
  begin
    FGetCustomersCommand := FConnection.CreateCommand;
    FGetCustomersCommand.RequestType := 'GET';
    FGetCustomersCommand.Text := 'TServerMethods1.GetCustomers';
    FGetCustomersCommand.Prepare(TServerMethods1_GetCustomers);
  end;
  FGetCustomersCommand.Execute(ARequestFilter);
  if not FGetCustomersCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetCustomersCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetCustomersCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetCustomersCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetCustomers_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetCustomersCommand_Cache = nil then
  begin
    FGetCustomersCommand_Cache := FConnection.CreateCommand;
    FGetCustomersCommand_Cache.RequestType := 'GET';
    FGetCustomersCommand_Cache.Text := 'TServerMethods1.GetCustomers';
    FGetCustomersCommand_Cache.Prepare(TServerMethods1_GetCustomers_Cache);
  end;
  FGetCustomersCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetCustomersCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TServerMethods1Client.ApplyCustomers(ADelta: TFDJSONDeltas);
begin
  if FApplyCustomersCommand = nil then
  begin
    FApplyCustomersCommand := FConnection.CreateCommand;
    FApplyCustomersCommand.RequestType := 'POST';
    FApplyCustomersCommand.Text := 'TServerMethods1."ApplyCustomers"';
    FApplyCustomersCommand.Prepare(TServerMethods1_ApplyCustomers);
  end;
  if not Assigned(ADelta) then
    FApplyCustomersCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyCustomersCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyCustomersCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADelta), True);
      if FInstanceOwner then
        ADelta.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyCustomersCommand.Execute;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetCustomersCommand.DisposeOf;
  FGetCustomersCommand_Cache.DisposeOf;
  FApplyCustomersCommand.DisposeOf;
  inherited;
end;

end.

