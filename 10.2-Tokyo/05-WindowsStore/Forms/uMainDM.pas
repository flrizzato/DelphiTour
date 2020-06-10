unit uMainDM;

interface

uses
  SysUtils, Classes, DB, WideStrings, Forms, FireDAC.Phys.IB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.DBX.Migrate, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBLiteDef, FireDAC.Phys.IBDef, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI;

type
  TMainDM = class(TDataModule)
    SQLConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

uses uMainForm, System.IOUtils;

{$R *.dfm}

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  try
    if not SQLConnection.Connected then
      SQLConnection.Open;
    TMainForm(Application.MainForm).DBConnection := SQLConnection;
  except
    on E: Exception do
      raise Exception.Create('Error Message: ' + E.Message);
  end;
end;

procedure TMainDM.SQLConnectionBeforeConnect(Sender: TObject);
var
  fDBTemplate, fDBFile: string;
const
  PackageID: string = 'MeetingOrganizer_5qpzh03rg74sm';
begin
  fDBTemplate := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
    'MEETINGORGANIZER.IB';

  if Pos('WindowsApp', ExtractFilePath(ParamStr(0))) > 0 then
    fDBFile := TPath.GetCachePath + PathDelim + 'Packages' + PathDelim +
      PackageID + PathDelim + 'AppData' + PathDelim + 'MEETINGORGANIZER.IB'
  else
    fDBFile := fDBTemplate;

  try
    if not TFile.Exists(fDBFile) then
      TFile.Copy(fDBTemplate, fDBFile);

    if TFile.Exists(fDBFile) then
      SQLConnection.Params.Values['Database'] := fDBFile
    else
      raise Exception.Create('Error Message: ' + fDBFile + ' not found.');
  except
    on E: Exception do
      raise Exception.Create('Error Message' + E.Message);
  end;
end;

end.
