unit fBatchAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  uADCompClient, Grids, DBGrids, DB, uADCompDataSet, StdCtrls;

type
  TBatchAllFrm = class(TForm)
    Button1: TButton;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADMemTable1: TADMemTable;
    ADMemTable2: TADMemTable;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BatchAllFrm: TBatchAllFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TBatchAllFrm.Button1Click(Sender: TObject);
begin
  ADQuery1.Open;
  ADQuery1.FetchAll;
  // assign Region records to ADMemTable1
  ADMemTable1.Data := ADQuery1.Data;

  ADQuery1.NextRecordSet;
  ADQuery1.FetchAll;
  // assign Territories records to ADMemTable2
  ADMemTable2.Data := ADQuery1.Data;
end;

procedure TBatchAllFrm.Label2Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Command_Batches.html', '');
end;

end.
