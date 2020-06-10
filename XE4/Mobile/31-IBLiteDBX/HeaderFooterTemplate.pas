unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.ListBox,
  FMX.StdCtrls, Data.DBXInterbase, Data.DB, Data.SqlExpr,
  iOSApi.Foundation, Data.DBXCommon, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    SQLQuery1: TSQLQuery;
    SQLQuery1CUST_NO: TIntegerField;
    SQLQuery1CUSTOMER: TStringField;
    SQLQuery1CONTACT_FIRST: TStringField;
    SQLQuery1CONTACT_LAST: TStringField;
    SQLQuery1PHONE_NO: TStringField;
    SQLQuery1ADDRESS_LINE1: TStringField;
    SQLQuery1ADDRESS_LINE2: TStringField;
    SQLQuery1CITY: TStringField;
    SQLQuery1STATE_PROVINCE: TStringField;
    SQLQuery1COUNTRY: TStringField;
    SQLQuery1POSTAL_CODE: TStringField;
    SQLQuery1ON_HOLD: TStringField;
    EMPLOYEE: TSQLConnection;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure Button1Click(Sender: TObject);
    procedure EMPLOYEEBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.Button1Click(Sender: TObject);
begin
  SQLQuery1.Open;
end;

procedure THeaderFooterForm.EMPLOYEEBeforeConnect(Sender: TObject);
begin
  EMPLOYEE.Params.Values[TDBXPropertyNames.Database] := GetHomePath +
    PathDelim + 'Documents' + PathDelim + 'EMPLOYEE.GDB';
end;

end.
