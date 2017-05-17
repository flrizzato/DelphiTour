unit MainMDIForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdActns, MDIChild, jpeg;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    FileOpen1: TFileOpen;
    Open1: TMenuItem;
    procedure FileOpen1Accept(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FileOpen1Accept(Sender: TObject);
begin
  with TFrMDIChild.Create(Self) do
  begin
    Visible := true;
    Image1.Picture.LoadFromFile(FileOpen1.Dialog.FileName);
  end;
end;

end.
