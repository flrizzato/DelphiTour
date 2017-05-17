unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient;

type
  TForm7 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    Button1: TButton;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
  FDQuery1.CommitUpdates;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  FDQuery1.CancelUpdates;
end;

procedure TForm7.CheckBox1Click(Sender: TObject);
begin
  FDQuery1.CachedUpdates := True;
  FDQuery1.Active := CheckBox1.Checked;
  FDQuery1.FilterChanges := [rtUnmodified, rtModified, rtInserted, rtHasErrors, rtDeleted];
end;

procedure TForm7.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if FDQuery1.UpdateStatus in [usInserted] then
    DBGrid1.Canvas.Font.Color := clGreen;
  if FDQuery1.UpdateStatus in [usModified, usDeleted] then
    DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);  if (FDQuery1.UpdateStatus = usDeleted) and (FDQuery1.State <> dsInsert) then  begin    DBGrid1.Canvas.Pen.Color := clRed;    DBGrid1.Canvas.MoveTo(Rect.Left+3,Rect.Top+10);    DBGrid1.Canvas.LineTo(Rect.Right-3,Rect.Top+10);  end;
end;

end.
