unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppAnalytics;

type
  TForm2 = class(TForm)
    AppAnalytics1: TAppAnalytics;
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ListBox1.Items.Add(Edit1.Text)
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  AppAnalytics1.TrackEvent('Cat5','MyAction','MyLabel',3.0);
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  // AppAnalytics is Active is true on the form
  // toggle analytics based on CheckBox - checked to start
  AppAnalytics1.Active := CheckBox1.Checked
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  AppAnalytics1.CheckPrivacy;
end;

end.
