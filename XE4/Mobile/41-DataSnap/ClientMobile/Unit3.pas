unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FMX.Layouts, FMX.ListBox, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, FMX.StdCtrls;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    ListBox1: TListBox;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
