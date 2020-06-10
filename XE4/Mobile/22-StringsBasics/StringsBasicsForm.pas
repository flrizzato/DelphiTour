unit StringsBasicsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    btnRefCount: TButton;
    Memo1: TMemo;
    procedure btnRefCountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}

var
  str2: string;

procedure TTabbedForm.btnRefCountClick(Sender: TObject);
var
  str1: string;
begin
  str2 := 'Hello';
  Memo1.Lines.Add('Initial RefCount: ' + IntToStr (StringRefCount(str2)));
  str1 := str2;
  Memo1.Lines.Add('After assign RefCount: ' + IntToStr (StringRefCount(str2)));
  str2 := str2 + ' World!';
  Memo1.Lines.Add('After change RefCount: ' + IntToStr (StringRefCount(str2)));
end;

end.
