unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Phys.MongoDBDataSet, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    memStatus: TMemo;
    Panel1: TPanel;
    btnCnn: TButton;
    FDPhysMongoDriverLink1: TFDPhysMongoDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    btnFind: TButton;
    memResult: TMemo;
    Mongodb_demo: TFDConnection;
    dbgQuery: TDBGrid;
    DataSource1: TDataSource;
    FDMongoQuery1: TFDMongoQuery;
    btnQuery: TButton;
    dbgDataSet: TDBGrid;
    FDMongoDataSet1: TFDMongoDataSet;
    DataSource2: TDataSource;
    btnStart: TButton;
    btnCommit: TButton;
    btnRollback: TButton;
    procedure btnCnnClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnRollbackClick(Sender: TObject);
  private
    { Private declarations }
    FCon: TMongoConnection;
    oCrs: IMongoCursor;
    oSes: TMongoSession;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.Threading;

procedure TForm1.btnCnnClick(Sender: TObject);
begin
  try
    Mongodb_demo.Open;
    memStatus.Text := 'Connected!';
    FCon := TMongoConnection(Mongodb_demo.CliObj);
  except
    on E: Exception do
    begin
      memStatus.Text := E.Message;
    end;
  end;
end;

procedure TForm1.btnFindClick(Sender: TObject);
begin
  memResult.Text := '';
  FDMongoDataSet1.Close;

  oCrs := FCon.Databases['sample_restaurants'].Collections['restaurants'].Find()
    .Match().Add('cuisine', 'Italian').&End;

  var
  aTask := TTask.Create(
    Procedure
    begin
      Screen.Cursor := crHourGlass;
      memResult.Lines.BeginUpdate;
      try
        while oCrs.Next do
          memResult.Lines.Add(oCrs.Doc.AsJSON);
      finally
        Screen.Cursor := crDefault;
        memResult.Lines.EndUpdate;
        memResult.SelStart := 0;
        memResult.SelLength := 1;
      end;
    end);
  aTask.Start;

  FDMongoDataSet1.Cursor := oCrs;
  FDMongoDataSet1.Open;
end;

procedure TForm1.btnQueryClick(Sender: TObject);
begin
  FDMongoQuery1.Close;
  FDMongoQuery1.QMatch := '{"cuisine": "Italian", "address.zipcode": "10075"}';
  FDMongoQuery1.Open;
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  if not Mongodb_demo.InTransaction then
    Mongodb_demo.StartTransaction;
end;

procedure TForm1.btnCommitClick(Sender: TObject);
begin
  if Mongodb_demo.InTransaction then
    begin
      if FDMongoQuery1.State in [dsEdit, dsInsert] then
        FDMongoQuery1.Post;
      Mongodb_demo.Commit;
    end;
end;

procedure TForm1.btnRollbackClick(Sender: TObject);
begin
  if Mongodb_demo.InTransaction then
    begin
      if FDMongoQuery1.State in [dsEdit, dsInsert] then
        FDMongoQuery1.Cancel;
      Mongodb_demo.Rollback;
    end;
end;

end.
