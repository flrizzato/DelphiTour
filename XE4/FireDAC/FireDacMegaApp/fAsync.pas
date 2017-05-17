unit fAsync;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  StdCtrls, Grids, DBGrids, DB, uADCompDataSet, uADCompClient;

type
  TAsyncFrm = class(TForm)
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    procedure ADQuery1AfterOpen(DataSet: TDataSet);
    procedure ADQuery1BeforeOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AsyncFrm: TAsyncFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TAsyncFrm.ADQuery1BeforeOpen(DataSet: TDataSet);
begin
  // When execution is asynchronous, then the datasources must be
  // disconnected before opening the dataset ...
  DataSource1.DataSet := nil;
end;

procedure TAsyncFrm.ADQuery1AfterOpen(DataSet: TDataSet);
begin
  // ... and connected back after the dataset is really open
  DataSource1.DataSet := ADQuery1;
end;

procedure TAsyncFrm.Button1Click(Sender: TObject);
begin
  ADQuery1.Close;
  if CheckBox1.Checked then
    ADQuery1.ResourceOptions.CmdExecMode := amCancelDialog
  else
    ADQuery1.ResourceOptions.CmdExecMode := amAsync;
  ADQuery1.Open;
end;

procedure TAsyncFrm.Label2Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Asynchronous_Execution.html', '');
end;

end.
