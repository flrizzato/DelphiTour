unit fBatchNext;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Grids,
  DBGrids, DB, StdCtrls, uADCompDataSet, uADCompClient;

type
  TBatchNextFrm = class(TForm)
    ADQuery1: TADQuery;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BatchNextFrm: TBatchNextFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TBatchNextFrm.Button1Click(Sender: TObject);
begin
  ADQuery1.Open;
end;

procedure TBatchNextFrm.Button2Click(Sender: TObject);
begin
  ADQuery1.NextRecordSet;
end;

procedure TBatchNextFrm.Button3Click(Sender: TObject);
begin
  ADQuery1.Close;
end;

procedure TBatchNextFrm.Label2Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Command_Batches.html', '');
end;

end.
