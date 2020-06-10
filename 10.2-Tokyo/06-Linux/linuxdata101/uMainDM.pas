unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin;

type
  TMainDM = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InternalDisplayData;
    procedure InternalSaveData;
  end;

procedure DisplayData;
procedure SaveDataTXT;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

uses
  IOUtils;

procedure DisplayData;
var
  DataModule14: TMainDM;
begin
  DataModule14 := TMainDM.Create(nil);
  DataModule14.InternalDisplayData;
  DataModule14.Free;
end;

procedure SaveDataTXT;
var
  DataModule14: TMainDM;
begin
  DataModule14 := TMainDM.Create(nil);
  DataModule14.InternalSaveData;
  DataModule14.Free;
end;

procedure TMainDM.DataModuleCreate(Sender: TObject);
var
  filename: string;
begin
  filename := './employee.fds';
  if not FileExists(filename) then
    writeln('Missing file ' + filename)
  else
  begin
    FDMemTable1.LoadFromFile(filename);
    FDMemTable1.Open;
  end;
end;

procedure TMainDM.InternalDisplayData;
begin
  if FDMemTable1.Active = False then
    Exit;

  FDMemTable1.First;
  while not FDMemTable1.EOF do
  begin
    writeln(FDMemTable1['FirstName'] + ' ' + FDMemTable1['LastName']);
    FDMemTable1.Next;
  end;
end;

procedure TMainDM.InternalSaveData;
var
  sl: TStringList;
begin
  if FDMemTable1.Active = False then
    Exit;

  sl := TStringList.Create;

  FDMemTable1.First;
  while not FDMemTable1.EOF do
  begin
    sl.Add(FDMemTable1['FirstName'] + ' ' + FDMemTable1['LastName']);
    FDMemTable1.Next;
  end;

  sl.SaveToFile(TPath.GetHomePath + PathDelim + 'list.txt');
  writeln('Data saved to' + TPath.GetHomePath);
end;

end.
