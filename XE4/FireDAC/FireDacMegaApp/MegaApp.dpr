program MegaApp;

uses
  Forms,
  fMain in 'fMain.pas' {MainFrm},
  fEnvRep in 'fEnvRep.pas' {EnvRepFrm},
  fConDef in 'fConDef.pas' {ConDefFrm},
  fRowsetSize in 'fRowsetSize.pas' {RowsetSizeFrm},
  fBatchNext in 'fBatchNext.pas' {BatchNextFrm},
  fBatchAll in 'fBatchAll.pas' {BatchAllFrm},
  fExecSQL in 'fExecSQL.pas' {ExecSQLFrm},
  fAsync in 'fAsync.pas' {AsyncFrm},
  fMacro in 'fMacro.pas' {MacroFrm},
  fScript in 'fScript.pas' {ScriptFrm},
  fAutoInc in 'fAutoInc.pas' {AutoIncFrm},
  fQBF in 'fQBF.pas' {QBFFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
