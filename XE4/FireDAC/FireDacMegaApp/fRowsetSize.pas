unit fRowsetSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, DB,
  uADCompDataSet, uADCompClient, StdCtrls;

type
  TRowsetSizeFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    ADQuery1: TADQuery;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RowsetSizeFrm: TRowsetSizeFrm;

implementation

uses
  fMain,
  uADStanUtil;

{$R *.dfm}

procedure TRowsetSizeFrm.Button1Click(Sender: TObject);
var
  i, iFrom, iTo, iStep: Integer;
  t: LongWord;
begin
  Memo1.Lines.Clear;

  iFrom := StrToInt(Edit1.Text);
  iTo := StrToInt(Edit2.Text);
  iStep := StrToInt(Edit3.Text);

  i := iFrom;
  while i <= iTo do begin
    ADQuery1.Disconnect();
    ADQuery1.FetchOptions.RowsetSize := i;

    t := GetTickCount();
    ADQuery1.Open;
    ADQuery1.FetchAll;
    Memo1.Lines.Add('RS size ' + IntToStr(i) + ' - ' + FloatToStr((GetTickCount() - t) / 1000));
    Application.ProcessMessages;

    Inc(i, iStep);
  end;
end;

procedure TRowsetSizeFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Fetching_Rows.html', '');
end;

end.
