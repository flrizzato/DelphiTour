unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses FMX.Consts;

{$R *.fmx}

const
  SMsgDlgConfirm = 'Confirmação';

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Text := 'Welcome to XE4... ' + Edit1.Text;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(Label1.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if MessageDlg('Escolha uma opção', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
   label2.Text := 'SIM'
  else
   label2.Text := 'NÃO';
end;

end.
