unit UnitDataMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLiteDef, Datasnap.DBClient,
  FMX.ListView.Types;

type
  TDataModuleMain = class(TDataModule)
    FDConnectionMain: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQueryCreate: TFDQuery;
    FDTableMaster: TFDTable;
    cdsDetailCache: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateTable;
    procedure SetContent(aID: Integer; aContent: string);
    function GetContent(aID: Integer): string;
    procedure SetMark(aID: Integer; aMark: TAccessoryType);
    function GetMark(aID: Integer): TAccessoryType;
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

procedure TDataModuleMain.CreateTable;
begin
  FDConnectionMain.ExecSQL('drop table book;', True);
  FDConnectionMain.ExecSQL('create table book (ID integer, Title varchar(64));', True);
  FDConnectionMain.ExecSQL('insert into book values (0,''Neverending Story'')', True);
  FDConnectionMain.ExecSQL('insert into book values (1,''Book of Secrets'')', True);
  FDConnectionMain.ExecSQL('insert into book values (2,''Cook Book'')', True);
  FDConnectionMain.ExecSQL('insert into book values (3,''About Mice'')', True);
  FDConnectionMain.ExecSQL('insert into book values (4,''Easy Parallel Programming'')', True);
  FDConnectionMain.ExecSQL('insert into book values (5,''The Dome'')', True);
  FDConnectionMain.ExecSQL('insert into book values (6,''Library System'')', True);
  FDConnectionMain.ExecSQL('insert into book values (7,''Live long and prosper'')', True);
  FDConnectionMain.ExecSQL('insert into book values (8,''Paint some more'')', True);
  FDConnectionMain.ExecSQL('insert into book values (9,''Never less'')', True);
  FDConnectionMain.ExecSQL('drop table detail;', True);
  FDConnectionMain.ExecSQL('create table detail (ID integer, Content varchar(128));', True);
  FDConnectionMain.ExecSQL('insert into detail values (0,''The story that never ends.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (1,''Music everywhere.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (2,''How to cook an egg in ten easy steps.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (3,''Mice, big and small.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (4,''Tasking parallel futures.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (5,''Bald and shiny.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (6,''Numerical lexicon.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (7,''To boldly go where no one has gone before.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (8,''Two strokes of luck.'')', True);
  FDConnectionMain.ExecSQL('insert into detail values (9,''Or even more.'')', True);
end;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
var
  lDBFile: string;
  i: Integer;
begin
  lDBFile := TPath.Combine(TPath.GetDocumentsPath, 'LocalDB.sdb');
  FDConnectionMain.Params.Clear;
  FDConnectionMain.Params.Add('Database=' + lDBFile);
  FDConnectionMain.Params.Add('LockingMode=Normal');
  FDConnectionMain.Params.Add('DriverID=SQLite');
  if FileExists(lDBFile) then
  begin
    FDConnectionMain.Open;
    FDTableMaster.Open;
  end
  else
  begin
    FDConnectionMain.Open;
    CreateTable;
    FDTableMaster.Open;
  end;
  {Create local cache for memo}
  cdsDetailCache.FieldDefs.Add('ID', ftInteger);
  cdsDetailCache.FieldDefs.Add('Content', ftString, 128);
  cdsDetailCache.FieldDefs.Add('Mark', ftInteger);
  cdsDetailCache.CreateDataSet;
  for I := 0 to 9 do
  begin
    cdsDetailCache.InsertRecord([I, 'Loading...', 0]);
  end;
end;

function TDataModuleMain.GetContent(aID: Integer): string;
begin
  if cdsDetailCache.Locate('ID', aID, []) then
    Result := cdsDetailCache.FieldByName('Content').AsString
  else
    Result := 'No Content Available';
end;

function TDataModuleMain.GetMark(aID: Integer): TAccessoryType;
begin
  if cdsDetailCache.Locate('ID', aID, []) then
    Result := TAccessoryType(cdsDetailCache.FieldByName('Mark').AsInteger)
  else
    Result := TAccessoryType.More;
end;

procedure TDataModuleMain.SetContent(aID: Integer; aContent: string);
begin
  if cdsDetailCache.Locate('ID', aID, []) then
  begin
    cdsDetailCache.Edit;
    cdsDetailCache.FieldByName('Content').AsString := aContent;
    cdsDetailCache.Post;
  end;
end;

procedure TDataModuleMain.SetMark(aID: Integer; aMark: TAccessoryType);
begin
  if cdsDetailCache.Locate('ID', aID, []) then
  begin
    cdsDetailCache.Edit;
    cdsDetailCache.FieldByName('Mark').AsInteger := Integer(aMark);
    cdsDetailCache.Post;
  end;
end;

end.
