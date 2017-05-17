unit MBD.DataModule;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient,
  REST.Backend.KinveyProvider, REST.Backend.ServiceTypes,
  REST.Backend.MetaTypes, System.JSON, REST.Backend.ParseProvider,
  REST.Backend.Providers, REST.Backend.ServiceComponents,
  REST.Backend.KinveyServices, Rest.OpenSSL, REST.Backend.ParseServices;

type
  Tdm = class(TDataModule)
    KinveyProvider: TKinveyProvider;
    BackendStorage: TBackendStorage;
    ParseProvider: TParseProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation
uses
  MBD.Credentials;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  /// prepare the client-component for usage
  KinveyProvider.AppKey := KINVEY_App_Key;
  KinveyProvider.AppSecret := KINVEY_App_Secret;
  KinveyProvider.MasterSecret := KINVEY_Master_Secret;

  ParseProvider.ApplicationID := PARSE_App_Id;
  ParseProvider.RestApiKey := PARSE_RESTApi_Key;
  ParseProvider.MasterKey := PARSE_Master_Key;
end;

end.
