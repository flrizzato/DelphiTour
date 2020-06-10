unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.IB;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FDConnection1Recover(ASender: TObject;
      const AInitiator: IFDStanObject; AException: Exception;
      var AAction: TFDPhysConnectionRecoverAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  FDTable1.Active := CheckBox1.Checked;
end;

procedure TForm1.FDConnection1Recover(ASender: TObject;
  const AInitiator: IFDStanObject; AException: Exception;
  var AAction: TFDPhysConnectionRecoverAction);
var iRes: Integer;
begin
  iRes := MessageDlg('Connection is lost. Offline - yes, Retry - ok, Fail - Cancel',
    mtConfirmation, [mbYes, mbOK, mbCancel], 0);
  case iRes of
    mrYes:    AAction := faOfflineAbort;
    mrOk:     AAction := faRetry;
    mrCancel: AAction := faFail;
  end;
end;

end.
