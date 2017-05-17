unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uADStanIntf,
  uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADStanAsync, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, Data.DB, uADCompDataSet, uADCompClient,
  FMX.Layouts, FMX.ListBox, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Edit, uADCompGUIx, uADGUIxFMXWait, uADPhysIB;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    ADConnection1: TADConnection;
    ADQuery1: TADQuery;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    ADQuery1CUST_NO: TIntegerField;
    ADQuery1CUSTOMER: TStringField;
    ADQuery1CONTACT_FIRST: TStringField;
    ADQuery1CONTACT_LAST: TStringField;
    ADQuery1PHONE_NO: TStringField;
    ADQuery1ADDRESS_LINE1: TStringField;
    ADQuery1ADDRESS_LINE2: TStringField;
    ADQuery1CITY: TStringField;
    ADQuery1STATE_PROVINCE: TStringField;
    ADQuery1COUNTRY: TStringField;
    ADQuery1POSTAL_CODE: TStringField;
    ADQuery1ON_HOLD: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    Button1: TButton;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure ADConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.ADConnection1BeforeConnect(Sender: TObject);
begin
  //ADConnection1.Params.Values['Database'] := '$(DOC)/EMPLOYEE.GDB'
  ADConnection1.Params.Values['Database'] := GetHomePath + PathDelim +
    'Documents' + PathDelim + 'EMPLOYEE.GDB';
end;

procedure THeaderFooterForm.Button1Click(Sender: TObject);
begin
  ADConnection1.Open;
  ADQuery1.Open;
end;

end.
