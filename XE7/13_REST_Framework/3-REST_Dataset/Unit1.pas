unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.DB, Datasnap.DBClient, REST.Response.Adapter, System.Rtti, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Edit, Data.Bind.Grid, FMX.Layouts, FMX.Grid,
  Data.Bind.DBScope;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    LinkControlToFieldParamstitle: TLinkControlToField;
    LinkControlToFieldParamstype: TLinkControlToField;
    LinkControlToFieldParamsper_page: TLinkControlToField;
    Panel1: TPanel;
    Button1: TButton;
    EditParamsper_page: TEdit;
    LabelParamsper_page: TLabel;
    LinkControlToFieldParamsper_page2: TLinkControlToField;
    EditParamstype: TEdit;
    LabelParamstype: TLabel;
    LinkControlToFieldParamstype2: TLinkControlToField;
    EditParamstitle: TEdit;
    LabelParamstitle: TLabel;
    LinkControlToFieldParamstitle2: TLinkControlToField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  RestRequest1.Execute;
end;

end.
