unit fScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uADStanIntf, uADCompScript, uADGUIxIntf, uADCompScriptCommands,
  uADStanOption, uADStanError, uADPhysIntf, uADStanDef, uADStanPool,
  uADPhysManager, uADGUIxFormsfScript, StdCtrls, DB, uADCompClient,
  uADStanAsync, uADGUIxFMXfScript, uADCompGUIx;

type
  TScriptFrm = class(TForm)
    ADScript1: TADScript;
    ADConnection1: TADConnection;
    Memo1: TMemo;
    Button1: TButton;
    Label2: TLabel;
    Label1: TLabel;
    ADGUIxScriptDialog1: TADGUIxScriptDialog;
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScriptFrm: TScriptFrm;

implementation

{$R *.dfm}

uses
  uADStanUtil;

procedure TScriptFrm.Button1Click(Sender: TObject);
begin
  ADScript1.SQLScripts.Clear;
  ADScript1.SQLScripts.Add;
  ADScript1.SQLScripts[0].SQL.Assign(Memo1.Lines);

  ADScript1.ValidateAll;
  ADScript1.ExecuteAll;
end;

procedure TScriptFrm.Label2Click(Sender: TObject);
begin
  ADShell('http://www.da-soft.com/anydac/docu/Executing_SQL_Scripts.html', '');
end;

end.
