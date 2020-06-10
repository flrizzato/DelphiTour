unit DelphiFeedsIOSClientForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.Layouts, FMX.Memo, Xml.XMLIntf, FMX.ListBox, Xml.adomxmldom,
  Xml.XMLDoc, Xml.xmldom, FMX.TabControl;

type
  TRSSFeedSource = (fsDelphiFeeds, fsEmbarcaderoBlogs);

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    XMLDocument1: TXMLDocument;
    ListBoxDelphi: TListBox;
    LabelStatusD: TLabel;
    TabControlMain: TTabControl;
    TabDelphiFeeds: TTabItem;
    TabEmbarcadero: TTabItem;
    Header2: TToolBar;
    HeaderLabel2: TLabel;
    ListBoxEmbt: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    LabelStatusE: TLabel;
    IdHTTP1: TIdHTTP;
    procedure DelphiFeedsUpdate(Sender: TObject);
    procedure ListBoxDelphiItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure EmbtBlogsUpdate(Sender: TObject);
    procedure ListBoxEmbtItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    procedure RefreshFeeds (fSource: TRSSFeedSource);
  public
    { Public declarations }
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

procedure THeaderFooterForm.DelphiFeedsUpdate(Sender: TObject);
begin
  RefreshFeeds (fsDelphiFeeds);
end;

procedure THeaderFooterForm.RefreshFeeds (fSource: TRSSFeedSource);
var
  strUrl: string;
  strXml: string;
  title, author, pubDate, url: string;
  I: Integer;
  ChannelNode, ItemNode: IXMLNode;
  ListBoxItem: TListBoxItem;
  TargetList: TListBox;
  LabelStatus: Tlabel;
begin
  case fSource of
    fsDelphiFeeds:
    begin
      strUrl := 'http://feeds.delphifeeds.com/delphifeeds';
      TargetList := ListBoxDelphi;
      LabelStatus := LabelStatusD;
    end;
    fsEmbarcaderoBlogs:
    begin
      strUrl := 'http://blogs.embarcadero.com/feeds/wpmu-feed/';
      TargetList := ListBoxEmbt;
      LabelStatus := LabelStatuse;
    end;
  end;

  //ShowMessage ('About to get data from ' + strUrl);
  try
    strXml := IdHTTP1.Get (strUrl);
  except
    on E: Exception do
    begin
      ShowMessage ('Error: ' + E.Message);
      Exit;
    end;
  end;
  //ShowMessage ('Processing XML');
  XMLDocument1.LoadFromXML(strXml);
  XMLDocument1.Active := True;

  LabelStatus.Text := 'Processing RSS';
  LabelStatus.Repaint;
  TargetList.BeginUpdate;
  try
    TargetList.Clear;

    ChannelNode := XMLDocument1.DocumentElement.ChildNodes.FindNode ('channel');
    for I := 0 to ChannelNode.ChildNodes.Count - 1 do
    begin
      ItemNode := ChannelNode.ChildNodes[I];
      if ItemNode.NodeName = 'item' then
      begin
        LabelStatus.Text := 'Processing Node ' + I.ToString;
        title := ItemNode.ChildValues ['title'];
        pubDate := ItemNode.ChildValues ['pubDate'];
        case fSource of
          fsDelphiFeeds: author := ItemNode.ChildValues ['author'];
          fsEmbarcaderoBlogs: author := ItemNode.ChildValues ['creator'];
        end;
        url := ItemNode.ChildValues ['link'];
        ListBoxItem := TListBoxItem.Create(TargetList);
        ListBoxItem.Text := title;
        ListBoxItem.ItemData.Detail := author + ' - ' + Copy(pubDate, 1, 11);
        ListBoxItem.TagString := url;
        TargetList.AddObject(ListBoxItem);
      end;
    end;
  finally
    TargetList.EndUpdate;
  end;
  LabelStatus.Text := 'RSS Processed';
end;



procedure THeaderFooterForm.EmbtBlogsUpdate(Sender: TObject);
begin
  RefreshFeeds (fsEmbarcaderoBlogs);
end;

procedure THeaderFooterForm.ListBoxDelphiItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  LabelStatusD.Text := Item.TagString;
end;

procedure THeaderFooterForm.ListBoxEmbtItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  LabelStatusE.Text := Item.TagString;
end;

end.
