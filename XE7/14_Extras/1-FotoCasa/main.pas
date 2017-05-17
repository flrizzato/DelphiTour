unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects,
  FMX.Effects, FMX.Filter.Effects, FMX.ListBox, FMX.Layouts, FMX.Ani, FMX.Edit,
  FMX.Styles;

type
  Tmainform = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    pnContents: TPanel;
    imDrawer: TImage;
    Panel1: TPanel;
    lbMenu: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    showDrawer: TFloatAnimation;
    hideDrawer: TFloatAnimation;
    FormLayout: TGridPanelLayout;
    edLocation: TEdit;
    Line1: TLine;
    btnMenu: TButton;
    cpPopup: TCalloutPanel;
    procedure FormCreate(Sender: TObject);
    procedure imDrawerClick(Sender: TObject);
    procedure edLocationClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure hideDrawerFinish(Sender: TObject);
    procedure showDrawerFinish(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure lbMenuChange(Sender: TObject);
  private
    { Private declarations }
    Style: TFMXObject;
  public
    { Public declarations }
    procedure ToggleDrawer;
    procedure HidePopup;
    procedure ShowPopup;
  end;

var
  mainform: Tmainform;

  // DRAWER STATUS
const
  DRAWER_HIDDEN = 0;
  DRAWER_SHOWN = 1;

implementation

{$R *.fmx}

uses uSplash, uRecentLocations;

// Checks the screen size and if it's large, then this device is considered a tablet
function isTablet: boolean;
begin
  result := (screen.Size.cx >= 480) and (screen.Size.cy >= 640);
  result := result or (screen.Size.cy >= 480) and (screen.Size.cx >= 640);
end;

procedure Tmainform.btnMenuClick(Sender: TObject);
begin
  // Switch popup status
  if (cpPopup.Visible) then
    HidePopup
  else
    ShowPopup;
end;

procedure Tmainform.edLocationClick(Sender: TObject);
begin
  showRecentLocations;
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
  // Initial UI setup
  pnContents.Align := TAlignLayout.alNone;
  pnContents.Tag := DRAWER_HIDDEN;
  pnContents.Position.x := 0;
  lbMenu.SendToBack;
  showSplash;
end;

procedure Tmainform.FormResize(Sender: TObject);
begin
  // Reorganize UI depending on form factor
  if (isTablet) then
  begin
    HidePopup;
    imDrawer.Visible := false;
    // Landscape
    if (Width > Height) then
    begin
      btnMenu.Visible := false;
      lbMenu.Align := TAlignLayout.alLeft;
      lbMenu.Width := self.Width div 3;
      pnContents.Align := TAlignLayout.alClient
    end
    // Portrait
    else
    begin
      btnMenu.Visible := true;
      lbMenu.Align := TAlignLayout.alClient;
      pnContents.Align := TAlignLayout.alNone;
      pnContents.Width := Width;
      pnContents.Height := Height;
    end;
  end
  else
  begin
    // This is supposed to be a phone
    btnMenu.Visible := false;
    lbMenu.Align := TAlignLayout.alClient;
    pnContents.Align := TAlignLayout.alNone;
    pnContents.Width := Width;
    pnContents.Height := Height;

    if (pnContents.Tag = DRAWER_SHOWN) then
    begin
      pnContents.Position.x := Width - 60;
    end;
  end;
end;

procedure Tmainform.imDrawerClick(Sender: TObject);
begin
  ToggleDrawer;
end;

procedure Tmainform.lbMenuChange(Sender: TObject);
begin
  HidePopup;
end;

procedure Tmainform.showDrawerFinish(Sender: TObject);
begin
  pnContents.Tag := DRAWER_SHOWN;
end;

procedure Tmainform.ShowPopup;
begin
  lbMenu.Parent := cpPopup;
  cpPopup.Height := Height - cpPopup.Position.Y - 40;
  cpPopup.Width := Width div 2;
  cpPopup.Visible := true;
end;

procedure Tmainform.hideDrawerFinish(Sender: TObject);
begin
  pnContents.Tag := DRAWER_HIDDEN;
end;

procedure Tmainform.HidePopup;
begin
  cpPopup.Visible := false;
  lbMenu.Parent := self;
  lbMenu.SendToBack;
end;

procedure Tmainform.ToggleDrawer;
var
  newLeft: integer;
begin
  newLeft := Width - 60;
  showDrawer.StartValue := 0;
  showDrawer.StopValue := newLeft;

  hideDrawer.StartValue := newLeft;
  hideDrawer.StopValue := 0;

  if (pnContents.Tag = DRAWER_SHOWN) then
  begin
    hideDrawer.Start;
  end
  else
  begin
    showDrawer.Start;
  end;
end;

end.
