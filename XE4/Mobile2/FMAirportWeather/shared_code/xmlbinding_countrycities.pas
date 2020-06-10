
{*********************************************************************************************}
{                                                                                             }
{                                      XML Data Binding                                       }
{                                                                                             }
{         Generated on: 11-7-2013 13:10:26                                                    }
{       Generated from: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\CountryCities.xml   }
{   Settings stored in: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\CountryCities.xdb   }
{                                                                                             }
{*********************************************************************************************}

unit xmlbinding_countrycities;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLNewDataSetType = interface;
  IXMLTableType = interface;

{ IXMLNewDataSetType }

  IXMLNewDataSetType = interface(IXMLNodeCollection)
    ['{61100614-21E5-4B6E-B2A0-42114ABDA229}']
    { Property Accessors }
    function Get_Table(Index: Integer): IXMLTableType;
    { Methods & Properties }
    function Add: IXMLTableType;
    function Insert(const Index: Integer): IXMLTableType;
    property Table[Index: Integer]: IXMLTableType read Get_Table; default;
  end;

{ IXMLTableType }

  IXMLTableType = interface(IXMLNode)
    ['{1591411A-F784-4342-83AC-D88558534005}']
    { Property Accessors }
    function Get_Country: UnicodeString;
    function Get_City: UnicodeString;
    procedure Set_Country(Value: UnicodeString);
    procedure Set_City(Value: UnicodeString);
    { Methods & Properties }
    property Country: UnicodeString read Get_Country write Set_Country;
    property City: UnicodeString read Get_City write Set_City;
  end;

{ Forward Decls }

  TXMLNewDataSetType = class;
  TXMLTableType = class;

{ TXMLNewDataSetType }

  TXMLNewDataSetType = class(TXMLNodeCollection, IXMLNewDataSetType)
  protected
    { IXMLNewDataSetType }
    function Get_Table(Index: Integer): IXMLTableType;
    function Add: IXMLTableType;
    function Insert(const Index: Integer): IXMLTableType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTableType }

  TXMLTableType = class(TXMLNode, IXMLTableType)
  protected
    { IXMLTableType }
    function Get_Country: UnicodeString;
    function Get_City: UnicodeString;
    procedure Set_Country(Value: UnicodeString);
    procedure Set_City(Value: UnicodeString);
  end;

{ Global Functions }

function GetNewDataSet(Doc: IXMLDocument): IXMLNewDataSetType;
function LoadNewDataSet(const FileName: string): IXMLNewDataSetType;
function NewNewDataSet: IXMLNewDataSetType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetNewDataSet(Doc: IXMLDocument): IXMLNewDataSetType;
begin
  Result := Doc.GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

function LoadNewDataSet(const FileName: string): IXMLNewDataSetType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

function NewNewDataSet: IXMLNewDataSetType;
begin
  Result := NewXMLDocument.GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

{ TXMLNewDataSetType }

procedure TXMLNewDataSetType.AfterConstruction;
begin
  RegisterChildNode('Table', TXMLTableType);
  ItemTag := 'Table';
  ItemInterface := IXMLTableType;
  inherited;
end;

function TXMLNewDataSetType.Get_Table(Index: Integer): IXMLTableType;
begin
  Result := List[Index] as IXMLTableType;
end;

function TXMLNewDataSetType.Add: IXMLTableType;
begin
  Result := AddItem(-1) as IXMLTableType;
end;

function TXMLNewDataSetType.Insert(const Index: Integer): IXMLTableType;
begin
  Result := AddItem(Index) as IXMLTableType;
end;

{ TXMLTableType }

function TXMLTableType.Get_Country: UnicodeString;
begin
  Result := ChildNodes['Country'].Text;
end;

procedure TXMLTableType.Set_Country(Value: UnicodeString);
begin
  ChildNodes['Country'].NodeValue := Value;
end;

function TXMLTableType.Get_City: UnicodeString;
begin
  Result := ChildNodes['City'].Text;
end;

procedure TXMLTableType.Set_City(Value: UnicodeString);
begin
  ChildNodes['City'].NodeValue := Value;
end;

end.