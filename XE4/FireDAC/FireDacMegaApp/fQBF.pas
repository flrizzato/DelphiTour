unit fQBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, DB,
  uADCompDataSet, uADCompClient, Grids, DBGrids;

type
  TQBFFrm = class(TForm)
    Label1: TLabel;
    edtFirstName: TEdit;
    Label2: TLabel;
    edtLastName: TEdit;
    Label3: TLabel;
    edtTitle: TEdit;
    Button1: TButton;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QBFFrm: TQBFFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TQBFFrm.Button1Click(Sender: TObject);
begin
  ADQuery1.Close;
  ADQuery1.MacroByName('FirstName').AsRaw := edtFirstName.Text;
  ADQuery1.MacroByName('LastName').AsRaw := edtLastName.Text;
  ADQuery1.MacroByName('Title').AsRaw := edtTitle.Text;
  ADQuery1.Open;
end;

procedure TQBFFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Preprocessing_Command_Text.html', '');
end;

end.
