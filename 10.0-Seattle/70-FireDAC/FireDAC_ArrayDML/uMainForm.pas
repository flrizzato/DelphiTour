unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.IB, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Phys.IBDef;

type
  TForm7 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

const
  NUM_INSERTS = 10000;

procedure TForm7.Button1Click(Sender: TObject);
var
  i: integer;
  t: integer;
begin
  FDQuery1.ExecSQL('DELETE FROM test');
  FDQuery1.SQL.Text :=
    'INSERT INTO test(field1, field2) values (:field1, :field2)';
  t := GetTickCount;
  FDQuery1.Connection.StartTransaction;
  try
    for i := 0 to NUM_INSERTS - 1 do
    begin
      FDQuery1.Params[0].AsInteger := i;
      FDQuery1.Params[1].AsString := 'Str' + IntToStr(i);
      FDQuery1.ExecSQL;
    end;
  finally
    FDQuery1.Connection.Commit;
  end;
  (Sender as TButton).Caption := FloatToStr((GetTickCount() - t) / 1000);
end;

procedure TForm7.Button2Click(Sender: TObject);
var
  i: integer;
  t: integer;
begin
  FDQuery1.ExecSQL('DELETE FROM test');
  FDQuery1.SQL.Text :=
    'INSERT INTO test(field1, field2) values (:field1, :field2)';
  t := GetTickCount;
  FDQuery1.Connection.StartTransaction;
  try
    FDQuery1.Params.ArraySize := NUM_INSERTS;
    for i := 0 to NUM_INSERTS - 1 do
    begin
      FDQuery1.Params[0].AsIntegers[i] := i;
      FDQuery1.Params[1].AsStrings[i] := 'Str' + IntToStr(i);
    end;
    FDQuery1.Execute(NUM_INSERTS, 0);
  finally
    FDQuery1.Connection.Commit;
  end;
  (Sender as TButton).Caption := FloatToStr((GetTickCount() - t) / 1000);
end;

end.
