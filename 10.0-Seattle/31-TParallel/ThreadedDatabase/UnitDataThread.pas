unit UnitDataThread;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModuleThread = class(TDataModule)
    FDConnectionThread: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQueryDetail: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetContent(aID: Integer): string;
  end;

var
  DataModuleThread: TDataModuleThread;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

{ TDataModuleThread }

function TDataModuleThread.GetContent(aID: Integer): string;
var
  lDBFile: string;
  lResult: string;
begin
  lDBFile := TPath.Combine(TPath.GetDocumentsPath, 'LocalDB.sdb');
  FDConnectionThread.Params.Clear;
  FDConnectionThread.Params.Add('Database=' + lDBFile);
  FDConnectionThread.Params.Add('LockingMode=Normal');
  FDConnectionThread.Params.Add('DriverID=SQLite');
  if FileExists(lDBFile) then
  begin
    FDConnectionThread.Open;
    try
      FDQueryDetail.ParamByName('ID').AsInteger := aID;
      FDQueryDetail.Open;
      try
        lResult := FDQueryDetail.FieldByName('Content').AsString;
      finally
        FDQueryDetail.Close;
      end;
    finally
      FDConnectionThread.Close;
    end;
  end
  else
  begin
    lResult := 'Database not found';
  end;
  {Delay returning the value - simulates a long query}
  Sleep(3000);
  Result := lResult;
end;

end.
