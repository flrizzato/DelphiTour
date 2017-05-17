unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListBox;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Clear;
  ComboBox1.Items.Add('Florianópolis');
  ComboBox1.Items.Add('Porto Alegre');
  ComboBox1.Items.Add('Recife');
  ComboBox1.Items.Add('Natal');
  ComboBox1.Items.Add('Campo Grande');
  ComboBox1.Items.Add('São Paulo');
  ComboBox1.Items.Add('Goiânia');
  ComboBox1.Items.Add('Brasilia');

  ComboBox1.ItemIndex := 0;
end;

end.
