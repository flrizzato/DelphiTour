unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Phys.Oracle,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.IB, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient, FireDAC.Phys.IBDef, FireDAC.Phys.OracleDef,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TForm1 = class(TForm)
    ADConnection1: TFDConnection;
    ADQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADPhysIBDriverLink1: TFDPhysIBDriverLink;
    ADGUIxWaitCursor1: TFDGUIxWaitCursor;
    Panel1: TPanel;
    ADPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    ADPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    ADQuery1CUSTNO: TFloatField;
    ADQuery1COMPANY: TStringField;
    ADQuery1ADDR1: TStringField;
    ADQuery1ADDR2: TStringField;
    ADQuery1CITY: TStringField;
    ADQuery1STATE: TStringField;
    ADQuery1ZIP: TStringField;
    ADQuery1COUNTRY: TStringField;
    ADQuery1PHONE: TStringField;
    ADQuery1FAX: TStringField;
    ADQuery1TAXRATE: TFloatField;
    ADQuery1CONTACT: TStringField;
    ADQuery1LASTINVOICEDATE: TSQLTimeStampField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StatusBar1: TStatusBar;
    Button1: TButton;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    SpeedButton4: TSpeedButton;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ADQuery1UpdateError(ASender: TDataSet; AException: EFDException;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupIB;
    procedure SetupMSSQl;
    procedure SetupORA;
    procedure SetupPG;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ADQuery1UpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
  ShowMessage(AException.Message);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ADConnection1.ApplyUpdates([ADQuery1]);
end;

procedure TForm1.SetupIB;
begin
  ADConnection1.DriverName := 'IB';
  ADConnection1.Params.Add('Server=RIZZATOX64');
  ADConnection1.Params.Add('Database=C:\DB_INTERBASE\MASTSQL.GDB');
  ADConnection1.Params.Add('User_Name=sysdba');
  ADConnection1.Params.Add('Password=masterkey');
  ADConnection1.Params.Add('CharacterSet=win1252');
  ADConnection1.Params.Add('ExtendedMeTFData=True');
  ADConnection1.Params.Add('MonitorBy=Remote');
end;

procedure TForm1.SetupMSSQl;
begin
  ADConnection1.DriverName := 'MSSQL';
  ADConnection1.Params.Add('Server=RIZZATO2K3');
  ADConnection1.Params.Add('Database=MASTSQL');
  ADConnection1.Params.Add('User_name=sa');
  ADConnection1.Params.Add('Password=embT');
  ADConnection1.Params.Add('MonitorBy=Remote');
end;

procedure TForm1.SetupORA;
begin
  ADConnection1.DriverName := 'Ora';
  ADConnection1.Params.Add('Database=ORA_RIZZATO2K3');
  ADConnection1.Params.Add('User_Name=MASTSQL');
  ADConnection1.Params.Add('Password=embT');
  ADConnection1.Params.Add('MonitorBy=Remote');
end;

procedure TForm1.SetupPG;
begin
  ADConnection1.DriverName := 'PG';
  ADConnection1.Params.Add('Server=RIZZATO2K3');
  ADConnection1.Params.Add('Port=5432');
  ADConnection1.Params.Add('Database=dvdrental');
  ADConnection1.Params.Add('User_Name=postgres');
  ADConnection1.Params.Add('Password=postgres');
  ADConnection1.Params.Add('CharacterSet=utf8');
  ADConnection1.Params.Add('MetaDefSchema=Public');
  ADConnection1.Params.Add('ExtendedMetadata=True');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if ADQuery1.Active then
    ADQuery1.Close;

  if ADConnection1.Connected then
    ADConnection1.Connected := False;

  ADConnection1.Params.Clear;
  case TComponent(Sender).Tag of
    1: SetupIB;
    2: SetupMSSQL;
    3: SetupORA;
    4: SetupPG;
  end;

  try
    ADConnection1.Connected := True;
    ADQuery1.Open;

    StatusBar1.SimpleText := '  FireDAC is connected using ' + ADConnection1.DriverName + ' driver.';
  except
    on E: EFDDBEngineException do
      case E.Kind of
      ekUserPwdInvalid: ShowMessage('Usuário ou senha inválidos!');
      ekUserPwdExpired: ShowMessage('Password expirado!');
      ekServerGone: ShowMessage('Servidor encontra-se inacessível!');
      else
        ShowMessage(E.Message);
      end;
  end;
end;

end.
