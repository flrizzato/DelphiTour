(*
  Copyright (c) 2013 Cary Jensen

  This sample was designed to accompany the Embarcadero Webinar
  Universal Enterprise Data Connectivity using FireDAC,
  presented on October 30th, 2013 by Cary Jensen

  No guarantees or warranties are expressed or implied concerning
  the applicability of techniques or code included in this example.
  If you wish to use techniques or code included in this example,
  it is your responsibility to test and certify any code, 
  techniques, or design adopted as a result of this project.

  For consulting, training, and development services,
  visit http://www.JensenDataSystems.com


  For information about Delphi Developer Days with Bob Swart and Cary Jensen,
  visit http://www.DelphiDeveloperDays.com

*)
unit datamodu;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.DBClient, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLiteVDataSet,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.SQLite, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc, Forms;

type
  TDataModule2 = class(TDataModule)
    SQLiteConnection: TFDConnection;
    FDLocalSQL1: TFDLocalSQL;
    OrdersQuery: TFDQuery;
    EmployeeCDS: TClientDataSet;
    LocalQuery: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    AccessConnection: TFDConnection;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  DataDir: string;
begin
  DataDir := 'C:\DTOURXE6\data\';

  EmployeeCDS.FileName := DataDir + 'employee.xml';

  AccessConnection.Params.Clear;
  AccessConnection.Params.Add('Database=' + DataDir + 'dbdemos.mdb');
  AccessConnection.Params.Add('DriverID=MSAcc');

  SQLiteConnection.Open;
  LocalQuery.Open;
end;

end.
