unit fExecSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, DB,
  uADCompDataSet, uADCompClient;

type
  TExecSQLFrm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Memo1: TMemo;
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
  ExecSQLFrm: TExecSQLFrm;

implementation

uses
  fMain, uADStanUtil;

{$R *.dfm}

procedure TExecSQLFrm.Button1Click(Sender: TObject);
var
  n, i: Integer;
  t: LongWord;
begin
  ADQuery1.ExecSQL('delete from {id ADQA_TransTable}');

  n := StrToInt(Edit1.Text);
  t := GetTickCount();
  ADQuery1.Connection.StartTransaction;
  try

    if CheckBox1.Checked then begin
      ADQuery1.SQL.Text := 'insert into {id ADQA_TransTable} values (:p1, :p2)';
      ADQuery1.Params.ArraySize := n;
      for i := 1 to n do begin
        ADQuery1.Params[0].AsIntegers[i - 1] := i;
        ADQuery1.Params[1].AsStrings[i - 1] := 'Str' + IntToStr(i);
      end;
      ADQuery1.Execute(n, 0);
    end

    else begin
      ADQuery1.SQL.Text := 'insert into {id ADQA_TransTable} values (:p1, :p2)';
      for i := 1 to n do begin
        ADQuery1.Params[0].AsInteger := i;
        ADQuery1.Params[1].AsString := 'Str' + IntToStr(i);
        ADQuery1.ExecSQL;
      end;
    end;

    ADQuery1.Connection.Commit;
    if CheckBox1.Checked then
      Memo1.Lines.Add('Array DML Execute size ' + IntToStr(n) + ' - ' + FloatToStr((GetTickCount() - t) / 1000))
    else
      Memo1.Lines.Add('Normal ExecSQL size ' + IntToStr(n) + ' - ' + FloatToStr((GetTickCount() - t) / 1000));
  except
    on E: Exception do begin
      Memo1.Lines.Add(E.Message);
      ADQuery1.Connection.Rollback;
      raise;
    end;
  end;
end;

procedure TExecSQLFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Array_DML.html', '');
end;

end.
