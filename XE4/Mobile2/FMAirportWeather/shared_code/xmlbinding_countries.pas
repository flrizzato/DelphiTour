
{*****************************************************************************************}
{                                                                                         }
{                                    XML Data Binding                                     }
{                                                                                         }
{         Generated on: 11-7-2013 12:51:11                                                }
{       Generated from: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\countries.xml   }
{   Settings stored in: Z:\pg\Documents\pgdemos\FMWeather\src\sample_data\countries.xdb   }
{                                                                                         }
{*****************************************************************************************}

unit xmlbinding_countries;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLNewDataSetType = interface;
  IXMLTableType = interface;

{ IXMLNewDataSetType }

  IXMLNewDataSetType = interface(IXMLNodeCollection)
    ['{2EE9A63C-4F41-42C9-AADE-96F123DB5967}']
    { Property Accessors }
    function Get_Table(Index: Integer): IXMLTableType;
    { Methods & Properties }
    function Add: IXMLTableType;
    function Insert(const Index: Integer): IXMLTableType;
    property Table[Index: Integer]: IXMLTableType read Get_Table; default;
  end;

{ IXMLTableType }

  IXMLTableType = interface(IXMLNode)
    ['{073A4984-5D9F-4A52-9E53-51B9F1CB586E}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
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
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
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

function TXMLTableType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['Name'].Text;
end;

procedure TXMLTableType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['Name'].NodeValue := Value;
end;

end.