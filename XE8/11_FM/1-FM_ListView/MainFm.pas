unit MainFm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Dialogs, FMX.ListView.Types, FMX.ListView, FMX.StdCtrls, FMX.Objects, FMX.Graphics;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    ListView1: TListView;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    CheckMode: Boolean;

    procedure UpdateImageRects;
    procedure UpdateEditAppearance;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
{$R *.fmx}

uses
  RandomTextUtils;

procedure TMainForm.FormCreate(Sender: TObject);
var
  I: Integer;
  Item: TListViewItem;
  DateText: string;
  CurDate: TDateTime;
  NextHeader: Integer;
begin
  Randomize;

  CurDate := Now * 1.01;

  NextHeader := 0;

  for I := 0 to 99 do
  begin
    if (NextHeader < 1) or (I = 99) then
    begin
      Item := ListView1.Items.Add;
      Item.Purpose := TListItemPurpose.Header;
      Item.Text := DeparmentNames[Random(10)];

      NextHeader := 2 + Random(3);
      Continue;
    end
    else
      Dec(NextHeader);

    DateTimeToString(DateText, 'ddd d of mmm yyyy', Random * CurDate);

    Item := ListView1.Items.Add;
    Item.Text :=  CommonNames[Random(20)] + ' ' + CommonSurNames[Random(20)] + ' (' + SampleTopics[Random(10)] + ')';
    Item.Detail := DateText;
    Item.Height := 44 + Random(24);
    Item.BitmapRef := Image1.Bitmap;
    Item.ButtonText := ActionNames[Random(4)];
  end;

  CheckMode := True;
  UpdateEditAppearance;

  UpdateImageRects;
end;

procedure TMainForm.UpdateEditAppearance;
var
  Text, EditText: string;
begin
  Text := ListView1.ItemAppearance.ItemAppearance;

  if CheckMode then
  begin
    if Text = TListView.TAppearanceNames.ListItem then
      EditText := TListView.TAppearanceNames.ListItemShowCheck
    else if Text = TListView.TAppearanceNames.ListItemRightDetail then
      EditText := TListView.TAppearanceNames.ListItemRightDetailShowCheck
    else if Text = TListView.TAppearanceNames.ImageListItem then
      EditText := TListView.TAppearanceNames.ImageListItemShowCheck
    else if Text = TListView.TAppearanceNames.ImageListItemRightButton then
      EditText := TListView.TAppearanceNames.ImageListItemRightButtonShowCheck;
  end
  else
  begin
    if Text = TListView.TAppearanceNames.ListItem then
      EditText := TListView.TAppearanceNames.ListItemDelete
    else if Text = TListView.TAppearanceNames.ListItemRightDetail then
      EditText := TListView.TAppearanceNames.ListItemRightDetailDelete
    else if Text = TListView.TAppearanceNames.ImageListItem then
      EditText := TListView.TAppearanceNames.ImageListItemDelete
    else if Text = TListView.TAppearanceNames.ImageListItemRightButton then
      EditText := TListView.TAppearanceNames.ImageListItemRightButtonDelete;
  end;

  ListView1.ItemAppearance.ItemEditAppearance := EditText;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  Text: string;
begin
  Text := ListView1.ItemAppearance.ItemAppearance;

  if Text = TListView.TAppearanceNames.ListItem then
    Text := TListView.TAppearanceNames.ListItemRightDetail
  else if Text = TListView.TAppearanceNames.ListItemRightDetail then
    Text := TListView.TAppearanceNames.ImageListItem
  else if Text = TListView.TAppearanceNames.ImageListItem then
    Text := TListView.TAppearanceNames.ImageListItemRightButton
  else if Text = TListView.TAppearanceNames.ImageListItemRightButton then
    Text := TListView.TAppearanceNames.ListItem;

  ListView1.ItemAppearance.ItemAppearance := Text;

  UpdateEditAppearance;
  UpdateImageRects;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
{$IFDEF ANDROID}
  SpeedButton1Click(Sender);
{$ELSE}
  CheckMode := not CheckMode;

  ListView1.ItemAppearanceObjects.ItemEditObjects.GlyphButton.ClickOnSelect := CheckMode;

  UpdateEditAppearance;
  UpdateImageRects;
{$ENDIF}
end;

procedure TMainForm.UpdateImageRects;
const
  Colors: array[0..3] of TAlphaColor = ($FF00FF00, $FFFFFF00, $FFFF00FF, $FF00FFFF);
var
  I, Index: Integer;
  PrevSeed: Integer;
begin
  PrevSeed := RandSeed;
  RandSeed := 100;

  Index := 0;

  for I := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[I].Objects.ImageObject <> nil then
      ListView1.Items[I].Objects.ImageObject.SrcRect := TRectF.Create(PointF(Random(6) * 58, 0), 58, 58);

    if ListView1.Items[I].Objects.GlyphButton <> nil then
      ListView1.Items[I].Objects.GlyphButton.ClickOnSelect := CheckMode;

    if ListView1.Items[I].Objects.TextButton <> nil then
    begin
      ListView1.Items[I].Objects.TextButton.TintColor := Colors[Index mod 4];
      Inc(Index);
    end;
  end;

  RandSeed := PrevSeed;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  ListView1.EditMode := not ListView1.EditMode;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
  if not ListView1.SearchVisible then
  begin
    ListView1.SearchAlwaysOnTop := False;
    ListView1.SearchVisible := True;
  end
  else if not ListView1.SearchAlwaysOnTop then
    ListView1.SearchAlwaysOnTop := True
  else
    ListView1.SearchVisible := False;
end;

end.
