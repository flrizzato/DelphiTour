unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Controls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.ExtCtrls,
  Data.FireDACJSONReflect;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    butOpen: TButton;
    butApply: TButton;
    procedure butOpenClick(Sender: TObject);
    procedure butApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ClientModuleUnit1;

procedure TForm1.butApplyClick(Sender: TObject);
var Delta: TFDJSONDeltas;
begin
  Delta := TFDJSONDeltas.Create;
  try
     if FDMemTable1.State in [dsEdit, dsInsert] then
       FDMemTable1.Post;

     TFDJSONDeltasWriter.ListAdd(Delta, FDMemTable1);

     ClientModule1.ServerMethods1Client.ApplyCustomers(Delta);
  except on E: Exception do
    raise Exception.Create('Erro ao gravar: ' + E.Message);
  end;
end;

procedure TForm1.butOpenClick(Sender: TObject);
var
  DSList: TFDJSONDataSets;
begin
  if FDMemTable1.Active then
     FDMemTable1.Close;

  DSList := ClientModule1.ServerMethods1Client.GetCustomers;
  FDMemTable1.AppendData(TFDJSONDataSetsReader.GetListValue(DSList, 0))
end;

end.
