unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, Data.DB, uADCompClient,
  uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager, uADCompDataSet,
  Datasnap.Provider, uADGUIxFormsWait, uADCompGUIx, uADPhysIB, uADGUIxFMXWait;

type
  TServerMethods1 = class(TDSServerModule)
    ADConnection1: TADConnection;
    ADQuery1: TADQuery;
    DataSetProvider1: TDataSetProvider;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{$R *.dfm}

uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

