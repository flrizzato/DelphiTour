unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf,
  uADPhysIntf, uADStanDef, uADStanPool, uADPhysManager,
  uADGUIxFormsWait, DB, uADCompClient, uADMoniFlatFile, uADMoniBase,
  uADMoniRemoteClient, uADStanExprFuncs, uADPhysTDBX, uADPhysSQLite, uADPhysPG,
  uADPhysIB, uADPhysADS, uADPhysASA, uADPhysMySQL, uADPhysMSAcc, uADPhysODBC,
  uADPhysMSSQL, uADPhysODBCBase, uADPhysDB2, uADGUIxFormsfAsync,
  ExtCtrls, uADStanAsync, uADGUIxFMXWait, uADPhysTDBXBase,
  uADCompGUIx, uADPhysOracle;

type
  TMainFrm = class(TForm)
    Button1: TButton;
    ADConnection1: TADConnection;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADMoniRemoteClientLink1: TADMoniRemoteClientLink;
    ADMoniFlatFileClientLink1: TADMoniFlatFileClientLink;
    Button2: TButton;
    ADPhysDB2DriverLink1: TADPhysDB2DriverLink;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    ADPhysODBCDriverLink1: TADPhysODBCDriverLink;
    ADPhysMSAccessDriverLink1: TADPhysMSAccessDriverLink;
    ADPhysMySQLDriverLink1: TADPhysMySQLDriverLink;
    ADPhysASADriverLink1: TADPhysASADriverLink;
    ADPhysADSDriverLink1: TADPhysADSDriverLink;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADPhysPgDriverLink1: TADPhysPgDriverLink;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    ADPhysTDBXDriverLink1: TADPhysTDBXDriverLink;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    ADPhysOracleDriverLink1: TADPhysOracleDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

{$R *.dfm}

uses
  uADStanUtil,
  fEnvRep, fConDef, fRowsetSize, fBatchNext, fBatchAll, fExecSQL, fAsync,
    fMacro, fScript, fAutoInc, fQBF;

procedure TMainFrm.Label1Click(Sender: TObject);
begin
  case TComponent(Sender).Tag of
  1: ADShell('http://www.da-soft.com/anydac/', '');
  2: ADShell('http://www.da-soft.com/anydac/docu/Migrating_BDE_applications.html', '');
  3: ADShell('http://www.da-soft.com/anydac/docu/frames.html', '');
  4: ADShell('http://www.da-soft.com/anydac/download.html', '');
  5: ADShell('http://www.da-soft.com/anydac/order.html', '');
  end;
end;

procedure TMainFrm.FormCreate(Sender: TObject);
begin
  ADConnection1.Connected := True;
end;

procedure TMainFrm.Button1Click(Sender: TObject);
var
  oFrm: TEnvRepFrm;
begin
  oFrm := TEnvRepFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button2Click(Sender: TObject);
var
  oFrm: TConDefFrm;
begin
  oFrm := TConDefFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button3Click(Sender: TObject);
var
  oFrm: TRowsetSizeFrm;
begin
  oFrm := TRowsetSizeFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button4Click(Sender: TObject);
var
  oFrm: TBatchNextFrm;
begin
  oFrm := TBatchNextFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button5Click(Sender: TObject);
var
  oFrm: TBatchAllFrm;
begin
  oFrm := TBatchAllFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button6Click(Sender: TObject);
var
  oFrm: TExecSQLFrm;
begin
  oFrm := TExecSQLFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button7Click(Sender: TObject);
var
  oFrm: TAsyncFrm;
begin
  oFrm := TAsyncFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button8Click(Sender: TObject);
var
  oFrm: TMacroFrm;
begin
  oFrm := TMacroFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button9Click(Sender: TObject);
var
  oFrm: TScriptFrm;
begin
  oFrm := TScriptFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button10Click(Sender: TObject);
var
  oFrm: TAutoIncFrm;
begin
  oFrm := TAutoIncFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

procedure TMainFrm.Button11Click(Sender: TObject);
var
  oFrm: TQBFFrm;
begin
  oFrm := TQBFFrm.Create(nil);
  try
    oFrm.ShowModal;
  finally
    oFrm.Free;
  end;
end;

end.
