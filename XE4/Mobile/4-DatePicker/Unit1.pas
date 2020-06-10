unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.ExtCtrls;

type
  TForm1 = class(TForm)
    CalendarEdit1: TCalendarEdit;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure CalendarEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.CalendarEdit1Change(Sender: TObject);
begin
  Label2.Text := FormatDateTime('dd/mm/yyyy', CalendarEdit1.Date);
end;

end.
