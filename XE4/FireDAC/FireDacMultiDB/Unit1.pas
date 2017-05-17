unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, Data.DB, uADCompClient, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, Vcl.Grids, Vcl.DBGrids, uADCompDataSet, uADPhysIB,
  uADGUIxFormsWait, uADCompGUIx, uADPhysODBCBase, uADPhysMSSQL, uADPhysOracle,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    ADConnection1: TADConnection;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    Panel1: TPanel;
    ADPhysOracleDriverLink1: TADPhysOracleDriverLink;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
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
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetupIB;
    procedure SetupMSSQl;
    procedure SetupORA;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SetupIB;
begin
  ADConnection1.DriverName := 'IB';
  ADConnection1.Params.Add('Server=127.0.0.1');
  ADConnection1.Params.Add('Database=C:\Users\Public\Documents\RAD Studio\11.0\Samples\Data\MASTSQL.GDB');
  ADConnection1.Params.Add('User_Name=sysdba');
  ADConnection1.Params.Add('Password=masterkey');
  ADConnection1.Params.Add('CharacterSet=win1252');
  ADConnection1.Params.Add('ExtendedMetadata=True');
end;

procedure TForm1.SetupMSSQl;
begin
  ADConnection1.DriverName := 'MSSQL';
  ADConnection1.Params.Add('Server=RIZZATOX64\SQLEXPRESS');
  ADConnection1.Params.Add('Database=MASTSQL');
  ADConnection1.Params.Add('User_name=sa');
  ADConnection1.Params.Add('Password=embT');
end;

procedure TForm1.SetupORA;
begin
  ADConnection1.DriverName := 'Ora';
  ADConnection1.Params.Add('Database=XELOCAL');
  ADConnection1.Params.Add('User_Name=MASTSQL');
  ADConnection1.Params.Add('Password=embt');
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
  end;

  try
    ADConnection1.Connected := True;
    ADQuery1.Open;

    StatusBar1.SimpleText := '  FireDAC is connected using ' + ADConnection1.DriverName + ' driver.';
  except
    on E: EADDBEngineException do
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
