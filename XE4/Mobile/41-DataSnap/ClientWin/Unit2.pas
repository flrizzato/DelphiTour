unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Datasnap.DBClient, Datasnap.DSConnect, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
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
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
