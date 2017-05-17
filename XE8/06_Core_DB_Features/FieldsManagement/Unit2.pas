unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TForm2 = class(TForm)
    EmployeeConnection: TFDConnection;
    EmployeeTable: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    EmployeeTablefirstandlast: TStringField;
    Button1: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    EmployeeTableEMPNO: TIntegerField;
    procedure EmployeeTableCalcFields(DataSet: TDataSet);
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
  EmployeeTable.Open();
end;

procedure TForm2.EmployeeTableCalcFields(DataSet: TDataSet);
begin
  EmployeeTablefirstandlast.AsString := 'my name';
end;

end.
