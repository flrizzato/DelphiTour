unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, uMainFrame;

type
  TMainForm = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    MainFrame1: TMainFrame;
    MainFrame2: TMainFrame;
    MainFrame3: TMainFrame;
    MainFrame4: TMainFrame;
    StyleBook: TStyleBook;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx MACOS}

end.
