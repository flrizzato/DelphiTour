unit fAutoInc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Grids,
  DBGrids, DB, uADCompDataSet, uADCompClient, StdCtrls;

type
  TAutoIncFrm = class(TForm)
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    procedure Label2Click(Sender: TObject);
    procedure ADQuery1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoIncFrm: TAutoIncFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TAutoIncFrm.ADQuery1BeforeOpen(DataSet: TDataSet);
begin
  // Oracle, Interbase, PostgreSQL do not have auto-incrementing column types.
  // Corresponding columns are not recognizing automatically. So, we have to
  // specify, that a column is auto-incrementing one.
  case ADQuery1.Connection.RDBMSKind of
  mkOracle,
  mkInterbase:
    ADQuery1.UpdateOptions.AutoIncFields := 'auto';
  end;
end;

procedure TAutoIncFrm.Label2Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Auto-Incremental_Fields.html', '');
end;

end.
