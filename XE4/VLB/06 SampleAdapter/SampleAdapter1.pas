unit SampleAdapter1;

interface

uses Data.Bind.ObjectScope, System.Classes, Generics.Collections, System.SysUtils;

type
  TContact = class
  private
    FFirstName: string;
    FLastName: string;
    FAddress1: string;
    FAddress2: string;
    FState: string;
    FZip: string;
    FID: uint32;
    procedure SetID(const Value: uint32);
    function GetID: uint32;
  public
    constructor Create;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Address1: string read FAddress1 write FAddress1;
    property Address2: string read FAddress2 write FAddress2;
    property State: string read FState write FState;
    property Zip: string read FZip write FZip;
    property ID: uint32 read GetID write SetID;
  end;

  TContactsAdapter = class(TListBindSourceAdapter<TContact>)
  private
    FLoaded: Boolean;
    FLoading: Boolean;
    FHasUpdates: Boolean;
    FFileName: TFileName;
    FAutoLoad: Boolean; // TFileName supports file open in object inspector
    function GetList: TList<TContact>;
    procedure SetFileName(const Value: TFileName);
    function QueryCancelUpdates: Boolean;
    procedure SetAutoLoad(const Value: Boolean);
  protected
    procedure DoBeforeOpen; override;
    procedure DoOnAfterSetList; override;
    function GetCanActivate: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ApplyUpdates; override;
    procedure CancelUpdates; override;
    function GetCanApplyUpdates: Boolean; override;
    function GetCanCancelUpdates: Boolean; override;
    procedure Insert; override;
    procedure Post; override;
    procedure Delete; override;
    procedure Load; overload;
    procedure Save; overload;
    procedure SaveAs(const AFileName: string);
    procedure LoadFrom(const AFileName: string);
    property List: TList<TContact> read GetList;
    property HasUpdates: Boolean read FHasUpdates write FHasUpdates;

  published
    property Options;
    property FileName: TFileName read FFileName write SetFileName;
    property AutoLoad: Boolean read FAutoLoad write SetAutoLoad;
    property AutoEdit;
    property Active;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnDeleteError;
    property OnInsertError;
    property OnEditError;
    property OnPostError;
    property OnApplyUpdates;
    property OnCancelUpdates;
  end;

implementation

uses
  Xml.XmlDoc, XML.XMLIntf;

type
  TCustomerDocumentService = class
  private const
    sXMLCustomer = 'customer';
    sXMLCustomers = 'customers';
    sXMLFirstName = 'firstname';
    sXMLLastName = 'lastname';
    sXMLAddress1 = 'address1';
    sXMLAddress2 = 'address2';
    sXMLState = 'state';
    sXMLZip = 'zip';
    sXMLID = 'id';
  public
    class procedure Save(const AFileName: string; AList: TList<TContact>); static;
    class function Load(const AFileName: string): TList<TContact>; static;
  end;


{ TCustomerAdapter }

procedure TContactsAdapter.ApplyUpdates;
begin
  Save;

end;

function TContactsAdapter.GetCanApplyUpdates: Boolean;
begin
  Result := FLoaded and FHasUpdates;
end;

function TContactsAdapter.GetCanCancelUpdates: Boolean;
begin
  Result := FLoaded and FHasUpdates;
end;

function TContactsAdapter.QueryCancelUpdates: Boolean;
begin
  Result := True; // TODO: Need event handler here
end;

function TContactsAdapter.GetCanActivate: Boolean;
begin
  // Allow even if no list because we create it on demand
  Result := True;
end;

procedure TContactsAdapter.CancelUpdates;
begin
  if QueryCancelUpdates then
  begin
    Load;
    Active := True;
  end;
end;

constructor TContactsAdapter.Create(AOwner: TComponent);
//var
//  LList: TList<TContact>;
begin
  inherited Create(AOwner);
  Options := Options + [loptAllowApplyUpdates, loptAllowCancelUpdates];
//  LList := TObjectList<TContact>.Create;
//  SetList(LList);
end;

procedure TContactsAdapter.Delete;
begin
  FHasUpdates := True;
  inherited;

end;

procedure TContactsAdapter.DoBeforeOpen;
begin
  inherited;
  if GetList = nil then
  begin
    if AutoLoad and (FFileName <> '') then
      Load
    else
      SetList(TObjectList<TContact>.Create);
  end;
end;

procedure TContactsAdapter.DoOnAfterSetList;
begin
  inherited;
  FHasUpdates := False;
  if FLoading then
  begin
    FLoaded := GetList <> nil;
  end;
  DataSetChanged;  // Update navigator
end;

function TContactsAdapter.GetList: TList<TContact>;
begin
  Result := inherited List as TList<TContact>;
end;

procedure TContactsAdapter.Insert;
begin
  FHasUpdates := True;
  inherited;
end;

procedure TContactsAdapter.Load;
var
  LList: TList<TContact>;
begin
  FLoading := True;
  try
    LList := TCustomerDocumentService.Load(FFileName);
    if LList <> nil then
    begin
      FHasUpdates := False;
      SetList(LList);
      if not FLoaded then
      begin
        FLoaded := True;
        DataSetChanged;
      end;
    end;
  finally
    FLoading := False;
  end;
end;

procedure TContactsAdapter.Save;
begin
  CheckList;
  TCustomerDocumentService.Save(FFileName, GetList);
  if FHasUpdates then
  begin
    FHasUpdates := False;
    DataSetChanged; //Update navigator
  end;
end;

procedure TContactsAdapter.SaveAs(const AFileName: string);
begin
  CheckList;
  TCustomerDocumentService.Save(AFileName, GetList);
  FFileName := AFileName;
  if FHasUpdates then
  begin
    FHasUpdates := False;
    DataSetChanged; //Update navigator
  end;
end;

procedure TContactsAdapter.LoadFrom(const AFileName: string);
var
  LList: TList<TContact>;
begin
  FLoading := True;
  try
    LList := TCustomerDocumentService.Load(AFileName);
    try
      if LList <> nil then
      begin
        FFileName := AFileName;
        SetList(LList);
      end;
    except
      LList.Free;
    end;
  finally
    FLoading := False;
  end;
end;


procedure TContactsAdapter.Post;
begin
  FHasUpdates := True;
  inherited;
end;

procedure TContactsAdapter.SetAutoLoad(const Value: Boolean);
begin
  if FAutoLoad <> Value then
  begin
    FAutoLoad := Value;
    if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    begin
      SetList(nil);
    end;
  end;
end;

procedure TContactsAdapter.SetFileName(const Value: TFileName);
begin
  if FFileName <> Value then
  begin
    Active := False;
    SetList(nil);
    FFileName := Value;
  end;
end;

{ TCustomerDocument }

class function TCustomerDocumentService.Load(const AFileName: string): TList<TContact>;
var
  LDocument: IXMLDocument;
  LList: TList<TContact>;
  LCustomer: TContact;
  LRoot: IXMLNode;
  LNode: IXMLNode;
begin
  Assert(AFileName <> '');
  if not FileExists(AFileName) then
    raise EFileNotFoundException.CreateFmt('File "%s" not found', [AFileName]);
  LList := TObjectList<TContact>.Create;
  try
    LDocument := TXMLDocument.Create(nil) as IXMLDocument;
    LDocument.LoadFromFile(AFileName);
    begin
      LRoot := LDocument.Node.ChildNodes.First;
      Assert(LRoot.NodeName = sXMLCustomers);
      LNode := LRoot.ChildNodes.First;
      while LNode <> nil do
      begin
        Assert(LNode.NodeName = sXMLCustomer);
        LCustomer := TContact.Create;
        try
          LCustomer.FirstName := LNode.GetAttribute(sXMLFirstName);
          LCustomer.LastName := LNode.GetAttribute(sXMLLastName);
          LCustomer.Address1 := LNode.GetAttribute(sXMLAddress1);
          LCustomer.Address2 := LNode.GetAttribute(sXMLAddress2);
          LCustomer.State := LNode.GetAttribute(sXMLState);
          LCustomer.Zip := LNode.GetAttribute(sXMLZip);
          LCustomer.ID := LNode.GetAttribute(sXMLID);
        except
          LCustomer.Free;
          raise;
        end;
        LList.Add(LCustomer);
        LNode := LNode.NextSibling;
      end;
    end;
    Result := LList;
  except
    LList.Free;
    raise;
  end;

end;

class procedure TCustomerDocumentService.Save(const AFileName: string; AList: TList<TContact>);
var
  LDocument: IXMLDocument;
  LCustomer: TContact;
  LRoot: IXMLNode;
  LRecordNode: IXMLNode;
begin
  Assert(AFileName <> '');
  LDocument := TXMLDocument.Create(nil) as IXMLDocument;
  LDocument.Active := True;
  LRoot := LDocument.AddChild(sXMLCustomers);
  for LCustomer in AList do
  begin
    LRecordNode := LRoot.AddChild(sXMLCustomer);
    LRecordNode.SetAttribute(sXMLFirstName, LCustomer.FirstName);
    LRecordNode.SetAttribute(sXMLLastName, LCustomer.LastName);
    LRecordNode.SetAttribute(sXMLAddress1, LCustomer.Address1);
    LRecordNode.SetAttribute(sXMLAddress2, LCustomer.Address2);
    LRecordNode.SetAttribute(sXMLState, LCustomer.State);
    LRecordNode.SetAttribute(sXMLZip, LCustomer.Zip);
    LRecordNode.SetAttribute(sXMLID, LCustomer.ID);
  end;
  LDocument.SaveToFile(AFileName);
end;

{ TContact }

constructor TContact.Create;
begin
//
end;

function TContact.GetID: uint32;
begin
  Result := FID;
end;

procedure TContact.SetID(const Value: uint32);
begin
  FID := Value;
end;

end.
