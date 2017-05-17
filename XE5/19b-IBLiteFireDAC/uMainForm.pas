unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1CUST_NO: TIntegerField;
    FDQuery1CUSTOMER: TStringField;
    FDQuery1CONTACT_FIRST: TStringField;
    FDQuery1CONTACT_LAST: TStringField;
    FDQuery1PHONE_NO: TStringField;
    FDQuery1ADDRESS_LINE1: TStringField;
    FDQuery1ADDRESS_LINE2: TStringField;
    FDQuery1CITY: TStringField;
    FDQuery1STATE_PROVINCE: TStringField;
    FDQuery1COUNTRY: TStringField;
    FDQuery1POSTAL_CODE: TStringField;
    FDQuery1ON_HOLD: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm1.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDConnection1.Params.Values['Database'] :=
    TPath.GetDocumentsPath + PathDelim + 'EMPLOYEE.GDB';
  FDConnection1.Params.Values['Server'] := '';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  FDQuery1.Open;
end;

end.
