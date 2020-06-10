unit dataModuleMain;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DbxHTTPLayer, Data.SqlExpr, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Data.Bind.GenData, Data.Bind.Components,
  Data.Bind.ObjectScope, DataSnapServerConnectionObj;

type
  TDataModule1 = class(TDataModule)
    cdsEmployeeProjects: TClientDataSet;
    cdsEmployeeProjectsEMP_NO: TSmallintField;
    cdsEmployeeProjectsPROJ_ID: TStringField;
    cdsEmployeeProjectsProject_name: TStringField;
    cdsEmployeeProjectsProduct: TStringField;
    cdsProjects: TClientDataSet;
    cdsProjectsPROJ_ID: TStringField;
    cdsProjectsPROJ_NAME: TStringField;
    cdsProjectsPROJ_DESC: TMemoField;
    cdsProjectsTEAM_LEADER: TSmallintField;
    cdsProjectsPRODUCT: TStringField;
    cdsEmployee: TClientDataSet;
    cdsEmployeeEMP_NO: TSmallintField;
    cdsEmployeeFIRST_NAME: TStringField;
    cdsEmployeeLAST_NAME: TStringField;
    cdsEmployeePHONE_EXT: TStringField;
    cdsEmployeeHIRE_DATE: TSQLTimeStampField;
    cdsEmployeeDEPT_NO: TStringField;
    cdsEmployeeJOB_CODE: TStringField;
    cdsEmployeeJOB_GRADE: TSmallintField;
    cdsEmployeeJOB_COUNTRY: TStringField;
    cdsEmployeeSALARY: TBCDField;
    cdsEmployeeFULL_NAME: TStringField;
    cdsEmployeeqryEmployeeProjects: TDataSetField;
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    cdsEmployeeProjectsLeadEmployee: TStringField;
    cdsProjectEmployess: TClientDataSet;
    cdsProjectsFULL_NAME: TStringField;
    cdsProjectsqryProjectEmployees: TDataSetField;
    cdsProjectEmployessEMP_NO: TSmallintField;
    cdsProjectEmployessPROJ_ID: TStringField;
    cdsProjectEmployessFULL_NAME: TStringField;
    pbsServerSettings: TPrototypeBindSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure pbsServerSettingsCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure SQLConnection1AfterConnect(Sender: TObject);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FServerDetails : TDataSnapConnectionDetails;
  public
    { Public declarations }
    procedure FilterEmployees(const SearchString : string);
    property ServerDetails : TDataSnapConnectionDetails read FServerDetails;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses System.IOUtils;

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  // Load Server Settings
  FServerDetails := TDataSnapConnectionDetails.Create;
  TDataSnapConnectionDetailsServices.Load(FServerDetails,TPath.GetDocumentsPath+PathDelim+'Server.ini');

  // Activate the BindSource for Settings
  pbsServerSettings.Active := False;
  pbsServerSettings.Active := True;
end;

procedure TDataModule1.FilterEmployees(const SearchString: string);
var
  Work : string;
begin
  // Search
  Work := '%'+UpperCase(SearchString)+'%';
  cdsEmployee.Filter := 'UPPER(FULL_NAME) LIKE '+Work.QuotedString;
  cdsEmployee.Filtered := SearchString > '';
end;

procedure TDataModule1.pbsServerSettingsCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Binding Object Association
  Assert(Self.FServerDetails <> nil);
  ABindSourceAdapter := TObjectBindSourceAdapter<TDataSnapConnectionDetails>.Create(Self,Self.FServerDetails,False);
end;

procedure TDataModule1.SQLConnection1AfterConnect(Sender: TObject);
begin
  // After connection, Close and Reopen datasets.
  cdsProjects.Close;
  cdsProjectEmployess.Close;
  cdsEmployee.Close;
  cdsEmployeeProjects.Close;

  cdsProjects.Open;
  cdsProjectEmployess.Open;
  cdsEmployee.Open;
  cdsEmployeeProjects.Open;
  // Save last successful remote path
  TDataSnapConnectionDetailsServices.Save(FServerDetails,TPath.GetDocumentsPath+PathDelim+'Server.ini');
end;

procedure TDataModule1.SQLConnection1BeforeConnect(Sender: TObject);
begin
  TDataSnapConnectionDetailsServices.SetParams(SQLConnection1.Params,FServerDetails);
end;

end.
