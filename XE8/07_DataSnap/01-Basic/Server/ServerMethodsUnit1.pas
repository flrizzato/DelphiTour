unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, Data.DB, FireDAC.Comp.Client,
  Data.FireDACJSONReflect, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    EmployeeConnection: TFDConnection;
    CustomersQuery: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetCustomers: TFDJSONDataSets;
    procedure ApplyCustomers(ADelta: TFDJSONDeltas);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

procedure TServerMethods1.ApplyCustomers(ADelta: TFDJSONDeltas);
var
  Apply: IFDJSONDeltasApplyUpdates;
begin
  EmployeeConnection.StartTransaction;
  try
    Apply := TFDJSONDeltasApplyUpdates.Create(ADelta);
    Apply.ApplyUpdates(0, CustomersQuery.Command);
    if Apply.Errors.Count > 0 then
      raise Exception.Create(Apply.Errors.Strings.Text)
    else
      EmployeeConnection.Commit;
  except
    EmployeeConnection.Rollback;
  end;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCustomers: TFDJSONDataSets;
begin
  CustomersQuery.Open;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, CustomersQuery);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.
