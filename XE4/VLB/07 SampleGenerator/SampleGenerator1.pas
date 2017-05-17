unit SampleGenerator1;

// Sample data generator for TPrototypeBindSource or TDataGeneratorAdapter.  To make these generaters available at
// design time, add this unit to a package and install the package.
interface

implementation

uses Data.Bind.ObjectScope, Data.Bind.GenData, Generics.Collections;

type
  TZipCodeGenerator = class(TDelegateValueGenerator)
  protected
    function CreateDelegate: TValueGeneratorDelegate; override;
  end;

  TCityGenerator = class(TDelegateValueGenerator)
  protected
    function CreateDelegate: TValueGeneratorDelegate; override;
  end;

const
  sZipCodes = 'LocalZipCodes';
  sZipCodeField = 'ZipField%d';
  sCities = 'LocalCities';
  sCityField = 'CityField%d';
  sThisUnit = 'SampleGenerator1';

const
  CZipCity: array[0..2*33-1] of string =
  (
'95002','Alviso',
'95003','Aptos',
'95004','Aromas',
'95005','Ben Lomand',
'95006','Boulder Creek',
'95008','Campbell',
'95010','Capitola',
'95012','Castroville',
'95013','Coyote',
'95014','Monte Vista',
'95017','Davenport',
'95018','Felton',
'95019','Freedom',
'95020','Gilroy',
'95023','Hollister',
'95030','Monte Sereno',
'95032','Los Gatos',
'95035','Milpitas',
'95037','Morgan Hill',
'95043','Paicines',
'95045','San Juan Bautist',
'95046','San Martin',
'95050','Santa Clara',
'95051','Santa Clara',
'95054','Santa Clara',
'95060','Scotts Valley',
'95062','Santa Cruz',
'95064','Santa Cruz',
'95065','Santa Cruz',
'95066','Scotts Valley',
'95070','Saratoga',
'95073','Soquel',
'95076','La Selva Beach');

function GetStrings(AOffset: Integer): TArray<string>;
var
  LList: TList<string>;
  I: Integer;
begin
  LList := TList<string>.Create;
  try
    I := Low(CZipCity) + AOffset;
    while I <= High(CZipCity) do
    begin
      LList.Add(CZipCity[I]);
      Inc(I, 2);
    end;
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

{ TZipCodeGenerator }

function TZipCodeGenerator.CreateDelegate: TValueGeneratorDelegate;
begin
  Result := nil;
  case FieldType of
    ftString:
      Result := TTypedListValueGeneratorDelegate<string>.Create(Options,
          GetStrings(0));
  else
    Assert(False);
  end;
end;

function TCityGenerator.CreateDelegate: TValueGeneratorDelegate;
begin
  Result := nil;
  case FieldType of
    ftString:
      Result := TTypedListValueGeneratorDelegate<string>.Create(Options,
          GetStrings(1));
  else
    Assert(False);
  end;
end;

initialization
  RegisterValueGenerator(sZipCodes, [ftString],
    TValueGeneratorDescription.Create(TZipCodeGenerator, sZipCodeField, sThisUnit));
  RegisterValueGenerator(sCities, [ftString],
    TValueGeneratorDescription.Create(TCityGenerator, sCityField, sThisUnit));
finalization
  UnRegisterValueGenerator(sZipCodes, [ftString], '');
  UnRegisterValueGenerator(sCities, [ftString], '');
end.
