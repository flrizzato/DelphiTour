unit fEnvRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TEnvRepFrm = class(TForm)
    Memo1: TMemo;
    Run: TButton;
    Label8: TLabel;
    procedure RunClick(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnvRepFrm: TEnvRepFrm;

implementation

{$R *.dfm}

uses
  fMain,
  uADCompClient, uADStanUtil;

procedure TEnvRepFrm.RunClick(Sender: TObject);
begin
  MainFrm.ADConnection1.GetInfoReport(Memo1.Lines, [riConnDef .. riKeepConnected]);
end;

procedure TEnvRepFrm.Label8Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/DBMS_Environment_Reports.html', '');
end;

end.
