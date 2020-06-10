unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Components, Data.Bind.Grid,
  FMX.Grid, Data.Bind.DBScope;

type
  TForm4 = class(TForm)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CUST_NO: TIntegerField;
    ClientDataSet1CUSTOMER: TStringField;
    ClientDataSet1CONTACT_FIRST: TStringField;
    ClientDataSet1CONTACT_LAST: TStringField;
    ClientDataSet1PHONE_NO: TStringField;
    ClientDataSet1ADDRESS_LINE1: TStringField;
    ClientDataSet1ADDRESS_LINE2: TStringField;
    ClientDataSet1CITY: TStringField;
    ClientDataSet1STATE_PROVINCE: TStringField;
    ClientDataSet1COUNTRY: TStringField;
    ClientDataSet1POSTAL_CODE: TStringField;
    ClientDataSet1ON_HOLD: TStringField;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button1: TButton;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSourceBindSourceDB13: TLinkGridToDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
