unit fMacro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Grids,
  DBGrids, DB, uADCompDataSet, uADCompClient;

type
  TMacroFrm = class(TForm)
    Button1: TButton;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MacroFrm: TMacroFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TMacroFrm.Button1Click(Sender: TObject);
begin
  ADQuery1.Open(
    'select {left({ucase(RegionDescription)}, 3)}, RegionDescription ' +
    'from {id Region}');
end;

procedure TMacroFrm.Button2Click(Sender: TObject);
begin
  ADQuery1.Open(
    '{IF Oracle} SELECT * FROM "Region" {fi} ' +
    '{IF MSSQL} SELECT * FROM [Territories] {fi}' +
    '{IF IB} SELECT * FROM "Employees" {fi}');
end;

procedure TMacroFrm.Button3Click(Sender: TObject);
begin
  ADQuery1.SQL.Text := 'select * from &TabName';
  ADQuery1.MacroByName('TabName').AsIdentifier := Edit1.Text;
  ADQuery1.Open;
end;

procedure TMacroFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Preprocessing_Command_Text.html', '');
end;

end.
