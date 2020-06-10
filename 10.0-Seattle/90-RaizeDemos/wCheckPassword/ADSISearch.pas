(* ----------------------------------------------------------------------------
 Module:  ADSI Searching in Delphi
 Author:  Marc Scheuner
 Date:    July 17, 2000

 Changes:

 Description:

   constructor Create(aOwner : TComponent); override;
     Creates a new instance of component

   destructor Destroy; override;
     Frees instance of component

   function CheckIfExists() : Boolean;
     Checks to see if the object described in the properties exists or not
     TRUE: Object exists, FALSE: object does not exist

   procedure Search;
     Launches the ADSI search - use GetFirstRow and GetNextRow to retrieve information

   function GetFirstRow() : TWideStringList;
   function GetNextRow() : TWideStringList;
     Returns the first row / next row of the result set, as a WideStringList.
     The values are stored in the string list as a <name>=<value> pair, so you
     can access the values via the FWideStringList.Values['name'] construct.

     Multivalued attributes are returned as one per line, in an array index
     manner:
            objectClass[0]=top
            objectClass[1]=Person
            objectClass[2]=organizationalPerson
            objectClass[3]=user
     and so forth. The index is zero-based.

     If there are no (more) rows, the return value will be NIL.

     It's up to the receiver to free the string list when no longer needed.

 property Attributes : WideString
   Defines the attributes you want to retrieve from the object. If you leave
   this empty, all available attributes will be returned.
   You can specify multiple attributes separated by comma:
           cn,distinguishedName,name,ADsPath
   will therefore retrieve these four attributes for all the objects returned
   in the search (if the attributes exist).

 property BaseIADs : IADs
   If you already have an interface to an IADs object, you can reuse it here
   by setting it to the BaseIADs property - in this case, ADSISearch can skip
   the step of binding to the ADSI object and will be executing faster.

 property BasePath : WideString
   LDAP base path for the search - the further down in the LDAP tree you start
   searching, the smaller the namespace to search and the quicker the search
   will return what you're looking for.

        LDAP://cn=Users,dc=stmaarten,dc=qc,dc=rnd
   is the well-known LDAP path for the Users container in the stmaarten.qc.rnd
   domain.

 property ChaseReferrals : Boolean
   If set to TRUE, the search might need to connect to other domain controllers
   and naming contexts, which is very time consuming.
   Set this property to FALSE to limit it to the current naming context, thus
   speeding up searches significantly.

 property DirSrchIntf : IDirectorySearch
   Provides access to the basic Directory Search interface, in case you need
   to do some low-level tweaking

 property Filter : WideString
   LDAP filter expression to search for. It will be ANDed together with a
   (objectClass=<ObjectClass>) filter to form the full search filter.
   It can be anything that is a valid LDAP search filter - see the appropriate
   books or online help files for details.

   It can be (among many other things):
      cn=Marc*
      badPwdCount>=0
      countryCode=49
      givenName=Steve
   and multiple conditions can be ANDed or ORed together using the LDAP syntax.

 property MaxRows : Integer
   Maximum rows of the result set you want to retrieve.
   Default is 0 which means all rows.

 property PageSize : Integer
   Maximum number of elements to be returned in a paged search. If you set this to 0,
   the search will *not* be "paged", e.g. IDirectorySearch will return all elements
   found in one big gulp, but there's a limit at 1'000 elements.
   With paged searching, you can search and find any number of AD objects. Default is
   set to 100 elements. No special need on the side of the developer / user to use
   paged searches - just set the PageSize to something non-zero.

 property ObjectClass: WideString
   ObjectClass of the ADSI object you are searching for. This allows you to
   specify e.g. just users, only computers etc.
   Be aware that ObjectClass is a multivalued attribute in LDAP, and sometimes
   has unexpected hierarchies (e.g."computer" descends from "user" and will therefore
   show up if you search for object class "user").
   This property will be included in the LDAP search filter passed to the
   search engine. If you don't want to limit the objects returned, just leave
   it at the default value of  *

 property SearchScope
   Limits the scope of the search.
   scBase: search only the base object (as specified by the LDAP path) - not very
           useful.....
   scOneLevel: search only object immediately contained by the specified base
               object (does not include baes object) - limits the depth of
               the search
   scSubtree: no limit on how "deep" the search goes, below the specified
              base object - this is the default.

---------------------------------------------------------------------------- *)

unit ADSISearch;

interface

uses
  ActiveX,
  ActiveDs_TLB,
  Classes,
  SysUtils;

type
  EADSISearchException = class(Exception);

  TSearchScope = (scBase, scOneLevel, scSubtree);

  TADSISearch = class
  private
    FBaseIADs       : IADs;
    FDirSrchIntf    : IDirectorySearch;
    FSearchHandle   : ADS_SEARCH_HANDLE;
    FAttributes,
    FFilter,
    FBasePath,
    FObjectClass    : Widestring;
    FResult         : HRESULT;
    FChaseReferrals,
    FSearchExecuted : Boolean;
    FMaxRows,
    FPageSize       : Integer;
    FSearchScope    : TSearchScope;

    procedure EnumerateColumns(aStrList : TStringList);
    function GetStringValue(oSrchColumn : ads_search_column; Index : Integer) : WideString;

    procedure SetBaseIADs(const Value: IADs);
    procedure SetBasePath(const Value: WideString);
    procedure SetFilter(const Value: WideString);
    procedure SetObjectClass(const Value: Widestring);
    procedure SetMaxRows(const Value: Integer);
    procedure SetPageSize(const Value: Integer);
    procedure SetAttributes(const Value: WideString);
    procedure SetChaseReferrals(const Value: Boolean);

  public
    constructor Create;
    destructor Destroy; override;

    function CheckIfExists() : Boolean;
    procedure Search;

    function GetFirstRow() : TStringList;
    function GetNextRow() : TStringList;

    // list of attributes to return - empty string equals all attributes
    property Attributes     : WideString read FAttributes write SetAttributes;

    // search base - both as an IADs interface, as well as a LDAP path
    property BaseIADs       : IADs read FBaseIADs write SetBaseIADs stored False;
    property BasePath       : WideString read FBasePath write SetBasePath;

    // chase possible referrals to other domain controllers?
    property ChaseReferrals : Boolean read FChaseReferrals write SetChaseReferrals default False;

    // "raw" search interface - for any low-level tweaking necessary
    property DirSrchIntf    : IDirectorySearch read FDirSrchIntf;

    // LDAP filter to limit the search
    property Filter         : WideString read FFilter write SetFilter;

    // maximum number of rows to return - 0 = all rows (no limit)
    property MaxRows        : Integer read FMaxRows write SetMaxRows default 0;
    property ObjectClass    : Widestring read FObjectClass write SetObjectClass;
    property PageSize       : Integer read FPageSize write SetPageSize default 100;
    property SearchScope    : TSearchScope read FSearchScope write FSearchScope default scSubtree;
  end;

const
  // ADSI success codes
  S_ADS_ERRORSOCCURRED = $00005011;
  S_ADS_NOMORE_ROWS    = $00005012;
  S_ADS_NOMORE_COLUMNS = $00005013;

  // ADSI error codes
  E_ADS_BAD_PATHNAME            = $80005000;
  E_ADS_INVALID_DOMAIN_OBJECT   = $80005001;
  E_ADS_INVALID_USER_OBJECT     = $80005002;
  E_ADS_INVALID_COMPUTER_OBJECT = $80005003;
  E_ADS_UNKNOWN_OBJECT          = $80005004;
  E_ADS_PROPERTY_NOT_SET        = $80005005;
  E_ADS_PROPERTY_NOT_SUPPORTED  = $80005006;
  E_ADS_PROPERTY_INVALID        = $80005007;
  E_ADS_BAD_PARAMETER           = $80005008;
  E_ADS_OBJECT_UNBOUND          = $80005009;
  E_ADS_PROPERTY_NOT_MODIFIED   = $8000500A;
  E_ADS_PROPERTY_MODIFIED       = $8000500B;
  E_ADS_CANT_CONVERT_DATATYPE   = $8000500C;
  E_ADS_PROPERTY_NOT_FOUND      = $8000500D;
  E_ADS_OBJECT_EXISTS           = $8000500E;
  E_ADS_SCHEMA_VIOLATION        = $8000500F;
  E_ADS_COLUMN_NOT_SET          = $80005010;
  E_ADS_INVALID_FILTER          = $80005014;



(*============================================================================*)
(*                           IMPLEMENTATION                                   *)
(*============================================================================*)

implementation

uses
  Windows;

var
  ActiveDSHandle : THandle;
  gADsGetObject: function(pwcPathName: PWideChar; const xRIID: TGUID; out pVoid): HResult; stdcall;
  gFreeADsMem : function(aPtr : Pointer) : BOOL; stdcall;


// Active Directory API helper functions - implemented in ActiveDs.DLL and
// dynamically loaded at time of initialization of this module

function ADsGetObject(pwcPathName: PWideChar; const xRIID: TGUID; var pVoid): HResult;
begin
  Result := gADsGetObject(pwcPathName, xRIID, pVoid);
end;

function FreeADsMem(aPtr : Pointer) : BOOL;
begin
  Result := gFreeADsMem(aPtr);
end;


// resource strings for all messages - makes localization so much easier!

resourcestring
  rc_CannotLoadActiveDS   = 'Cannot load ActiveDS.DLL';
  rc_CannotGetProcAddress = 'Cannot GetProcAddress of ';

  rc_CouldNotBind      = 'Could not bind to object %s (%x)';
  rc_CouldNotFreeSH    = 'Could not free search handle (%x)';
  rc_CouldNotGetIDS    = 'Could not obtain IDirectorySearch interface for %s (%x)';
  rc_GetFirstFailed    = 'GetFirstRow failed (%x)';
  rc_GetNextFailed     = 'GetNextRow failed (%x)';
  rc_SearchFailed      = 'Search in ADSI failed (result code %x)';
  rc_SearchNotExec     = 'Search has not been executed yet';
  rc_SetSrchPrefFailed = 'Setting the max row limit failed (%x)';
  rc_UnknownDataType   = '(unknown data type %d)';

// ---------------------------------------------------------------------------
//  Constructor and destructor
// ---------------------------------------------------------------------------

constructor TADSISearch.Create;
begin
  inherited Create;

  FBaseIADs    := nil;
  FDirSrchIntf := nil;

  FAttributes := '';
  FBasePath   := '';
  FFilter     := '';
  FObjectClass := '*';

  FMaxRows     := 0;
  FPageSize    := 100;

  FChaseReferrals := False;
  FSearchScope    := scSubtree;

  FSearchExecuted := False;
end;

destructor TADSISearch.Destroy;
begin
  if (FSearchHandle <> 0) then
    FResult := FDirSrchIntf.CloseSearchHandle(FSearchHandle);

  FBaseIADs    := nil;
  FDirSrchIntf := nil;

  inherited;
end;

// ---------------------------------------------------------------------------
// Set and Get methods
// ---------------------------------------------------------------------------

procedure TADSISearch.SetAttributes(const Value: WideString);
begin
  if (FAttributes <> Value) then begin
    FAttributes := Value;
  end;
end;

// the methods to set the search base always need to update the other property
// as well, in order to make sure the base IADs interface and the BasePath
// property stay in sync
// setting the search base will require a new search
// therefore set internal flag FSearchExecuted to false
procedure TADSISearch.SetBaseIADs(const Value: IADs);
begin
  if (FBaseIADs <> Value) then begin
    FBaseIADs := Value;
    FBasePath := FBaseIADs.ADsPath;
    FSearchExecuted := False;
  end;
end;

procedure TADSISearch.SetBasePath(const Value: WideString);
begin
  if (FBasePath <> Value) then begin
    FBasePath := Value;
    FBaseIADs := nil;
    FSearchExecuted := False;
  end;
end;

procedure TADSISearch.SetChaseReferrals(const Value: Boolean);
begin
  if (FChaseReferrals <> Value) then begin
    FChaseReferrals := Value;
  end;
end;

// setting the filter will require a new search
// therefore set internal flag FSearchExecuted to false
procedure TADSISearch.SetFilter(const Value: WideString);
begin
  if (FFilter <> Value) then begin
    FFilter := Value;
    FSearchExecuted := False;
  end;
end;

procedure TADSISearch.SetMaxRows(const Value: Integer);
begin
  if (Value >= 0) and (Value <> FMaxRows) then begin
    FMaxRows := Value;
  end;
end;

procedure TADSISearch.SetPageSize(const Value: Integer);
begin
  if (Value >= 0) and (Value <> FPageSize) then begin
    FPageSize := Value;
  end;
end;

// setting the object category will require a new search
// therefore set internal flag FSearchExecuted to false
procedure TADSISearch.SetObjectClass(const Value: Widestring);
begin
  if (FObjectClass <> Value) then begin
    if (Value = '') then
      FObjectClass := '*'
    else
      FObjectClass := Value;
    FSearchExecuted := False;
  end;
end;

// ---------------------------------------------------------------------------
// Private helper methods
// ---------------------------------------------------------------------------

// EnumerateColumns iterates through all the columns in the current row of
// the search results and builds the string list of results
procedure TADSISearch.EnumerateColumns(aStrList: TStringList);
var
  ix          : Integer;
  bMultiple   : Boolean;
  pwColName   : PWideChar;
  oSrchColumn : ads_search_column;
  wsColName, wsValue : WideString;
begin
  // determine name of next column to fetch
  FResult := FDirSrchIntf.GetNextColumnName(FSearchHandle, pwColName);

  // as long as no error occured and we still do have columns....
  while Succeeded(FResult) and (FResult <> S_ADS_NOMORE_COLUMNS) do begin
    // get the column from the result set
    FResult := FDirSrchIntf.GetColumn(FSearchHandle, pwColName, oSrchColumn);

    if Succeeded(FResult) then begin
      // check if it's a multi-valued attribute
      bMultiple := (oSrchColumn.dwNumValues > 1);

      if bMultiple then begin
        // if it's a multi-valued attribute, iterate through the values
        for ix := 0 to oSrchColumn.dwNumValues-1 do begin
          wsColName := Format('%s[%d]', [oSrchColumn.pszAttrName, ix]);
          wsValue   := GetStringValue(oSrchColumn, ix);
          aStrList.Add(wsColName + '=' + wsValue);
        end;
      end
      else begin
        // single valued attributes are quite straightforward
        wsColName := oSrchColumn.pszAttrName;
        wsValue   := GetStringValue(oSrchColumn, 0);
        aStrList.Add(wsColName + '=' + wsValue);
      end;
    end;

    // free the memory associated with the search column, and the column name
    FDirSrchIntf.FreeColumn(oSrchColumn);
    FreeADsMem(pwColName);

    // get next column name
    FResult := FDirSrchIntf.GetNextColumnName(FSearchHandle, pwColName);
  end;
end;

// Get string value will turn the supported types of data into a string representation
// for inclusion in the resulting string list
// For a complete list of possible values, see the ADSTYPE_xxx constants in the
// ActiveDs_TLB.pas file
function TADSISearch.GetStringValue(oSrchColumn: ads_search_column; Index: Integer): WideString;
var
  wrkPointer : PADSValue;
  oSysTime   : _SYSTEMTIME;
  dtDate,
  dtTime     : TDateTime;
begin
  Result := '';

  // advance the value pointer to the correct one of the potentially multiple
  // values in the "array of values" for this attribute
  wrkPointer := oSrchColumn.pADsValues;
  Inc(wrkPointer, Index);

  // depending on the type of the value, turning it into a string is more
  // or less straightforward
  case oSrchColumn.dwADsType of
    ADSTYPE_CASE_EXACT_STRING  : Result := wrkPointer^.__MIDL_0010.CaseExactString;
    ADSTYPE_CASE_IGNORE_STRING : Result := wrkPointer^.__MIDL_0010.CaseIgnoreString;
    ADSTYPE_DN_STRING          : Result := wrkPointer^.__MIDL_0010.DNString;
    ADSTYPE_OBJECT_CLASS       : Result := wrkPointer^.__MIDL_0010.ClassName;
    ADSTYPE_PRINTABLE_STRING   : Result := wrkPointer^.__MIDL_0010.PrintableString;
    ADSTYPE_NUMERIC_STRING     : Result := wrkPointer^.__MIDL_0010.NumericString;
    ADSTYPE_BOOLEAN            : Result := IntToStr(wrkPointer^.__MIDL_0010.Boolean);
    ADSTYPE_INTEGER            : Result := IntToStr(wrkPointer^.__MIDL_0010.Integer);
    ADSTYPE_LARGE_INTEGER      : Result := IntToStr(wrkPointer^.__MIDL_0010.LargeInteger);
    ADSTYPE_UTC_TIME:
      begin
        // ADS_UTC_TIME maps to a _SYSTEMTIME structure
        Move(wrkPointer^.__MIDL_0010.UTCTime, oSysTime, SizeOf(oSysTime));
        // create two TDateTime values for the date and the time
        dtDate := EncodeDate(oSysTime.wYear, oSysTime.wMonth, oSysTime.wDay);
        dtTime := EncodeTime(oSysTime.wHour, oSysTime.wMinute, oSysTime.wSecond, oSysTime.wMilliseconds);
        // add the two TDateTime's (really only a Float), and turn into a string
        Result := DateTimeToStr(dtDate+dtTime);
      end;
    else Result := Format(rc_UnknownDataType, [oSrchColumn.dwADsType]);
  end;
end;

// ---------------------------------------------------------------------------
// Public methods
// ---------------------------------------------------------------------------

// Check if any object matching the criteria as defined in the properties exists
function TADSISearch.CheckIfExists(): Boolean;
var
  slTemp : TStringList;
  iOldMaxRows     : Integer;
  wsOldAttributes : WideString;
begin
  Result := False;

  // save the settings of the MaxRows and Attributes properties
  iOldMaxRows := FMaxRows;
  wsOldAttributes := FAttributes;

  try
    // set the attributes to return just one row (that's good enough for
    // making sure it exists), and the Attribute of instanceType which is
    // one attribute that must exist for any of the ADSI objects
    FMaxRows := 1;
    FAttributes := 'instanceType';

    try
      Search;

      // did we get any results?? If so, at least one object exists!
      slTemp := GetFirstRow();
      Result := (slTemp <> nil);
      slTemp.Free;

    except
      on EADSISearchException do ;
    end;

  finally
    // restore the attributes to what they were before
    FMaxRows := iOldMaxRows;
    FAttributes := wsOldAttributes;
  end;
end;

function TADSISearch.GetFirstRow(): TStringList;
var
  slTemp : TStringList;
begin
  slTemp := nil;

  try
    if FSearchExecuted then begin
      // get the first row of the result set
      FResult := FDirSrchIntf.GetFirstRow(FSearchHandle);

      // did we succeed? ATTENTION: if we don't have any more rows,
      // we still get a "success" value back from ADSI!!
      if Succeeded(FResult) then begin
        // any more rows in the result set?
        if (FResult <> S_ADS_NOMORE_ROWS) then begin
          // create a string list
          slTemp := TStringList.Create;
          // enumerate all columns into that resulting string list
          EnumerateColumns(slTemp);
        end;
      end
      else begin
        raise EADSISearchException.CreateFmt(rc_GetFirstFailed, [FResult]);
      end;
    end
    else begin
      raise EADSISearchException.Create(rc_SearchNotExec);
    end;

  finally
    Result := slTemp;
  end;
end;

function TADSISearch.GetNextRow(): TStringList;
var
  slTemp : TStringList;
begin
  slTemp := nil;

  try
    if FSearchExecuted then begin
      // get the next row of the result set
      FResult := FDirSrchIntf.GetNextRow(FSearchHandle);

      // did we succeed? ATTENTION: if we don't have any more rows,
      // we still get a "success" value back from ADSI!!
      if Succeeded(FResult) then begin
        // any more rows in the result set?
        if (FResult <> S_ADS_NOMORE_ROWS) then begin
          // create result string list
          slTemp := TStringList.Create;
          // enumerate all columns in result set
          EnumerateColumns(slTemp);
        end;
      end
      else begin
        raise EADSISearchException.CreateFmt(rc_GetNextFailed, [FResult]);
      end;
    end
    else begin
      raise EADSISearchException.Create(rc_SearchNotExec);
    end;

  finally
    Result := slTemp;
  end;
end;

// this is the core piece of the component - the actual search method
procedure TADSISearch.Search;
var
  ix        :  Integer;
  wsFilter  : WideString;
  slTemp    : TStringList;
  AttrCount : Cardinal;
  AttrArray : array of WideString;
  SrchPrefInfo : array of ads_searchpref_info;
begin
  // check to see if we have assigned an IADs, if not, bind to it
  if (FBaseIADs = nil) then begin
    FResult := ADsGetObject(@FBasePath[1], IID_IADs, FBaseIADs);

    if not Succeeded(FResult) then begin
      raise EADSISearchException.CreateFmt(rc_CouldNotBind, [FBasePath, FResult]);
    end;
  end;

  // get the IDirectorySearch interface from the base object
  FDirSrchIntf := (FBaseIADs as IDirectorySearch);

  if (FDirSrchIntf = nil) then begin
    raise EADSISearchException.CreateFmt(rc_CouldNotGetIDS, [FBasePath, FResult]);
  end;

  // if we still have a valid search handle => close it
  if (FSearchHandle <> 0) then begin
    FResult := FDirSrchIntf.CloseSearchHandle(FSearchHandle);

    if not Succeeded(FResult) then begin
      raise EADSISearchException.CreateFmt(rc_CouldNotFreeSH, [FResult]);
    end;
  end;

  // we are currently setting 3 search preferences
  // for a complete list of possible search preferences, please check
  // the ADS_SEARCHPREF_xxx values in ActiveDs_TLB.pas
  SetLength(SrchPrefInfo, 4);

  // Set maximum number of rows to be what is defined in the MaxRows property
  SrchPrefInfo[0].dwSearchPref := ADS_SEARCHPREF_SIZE_LIMIT;
  SrchPrefInfo[0].vValue.dwType := ADSTYPE_INTEGER;
  SrchPrefInfo[0].vValue.__MIDL_0010.Integer := FMaxRows;

  // set the "chase referrals" search preference
  SrchPrefInfo[1].dwSearchPref := ADS_SEARCHPREF_CHASE_REFERRALS;
  SrchPrefInfo[1].vValue.dwType := ADSTYPE_BOOLEAN;
  SrchPrefInfo[1].vValue.__MIDL_0010.Boolean := Ord(FChaseReferrals);

  // set the "search scope" search preference
  SrchPrefInfo[2].dwSearchPref := ADS_SEARCHPREF_SEARCH_SCOPE;
  SrchPrefInfo[2].vValue.dwType := ADSTYPE_INTEGER;
  SrchPrefInfo[2].vValue.__MIDL_0010.Integer := Ord(FSearchScope);

  // set the "page size " search preference
  SrchPrefInfo[3].dwSearchPref := ADS_SEARCHPREF_PAGESIZE;
  SrchPrefInfo[3].vValue.dwType := ADSTYPE_INTEGER;
  SrchPrefInfo[3].vValue.__MIDL_0010.Integer := FPageSize;

  // set the search preferences of our directory search interface
  FResult := FDirSrchIntf.SetSearchPreference(Pointer(SrchPrefInfo), Length(SrchPrefInfo));

  if not Succeeded(FResult) then begin
    raise EADSISearchException.CreateFmt(rc_SetSrchPrefFailed, [FResult]);
  end;

  // hack together the filter
  if (FFilter = '') then
    wsFilter := Format('(objectClass=%s)', [FObjectClass])
  else
    wsFilter := Format('(&(objectClass=%s)(%s))', [FObjectClass, FFilter]);

  // get attributes
  if (FAttributes <> '') then begin
    slTemp := TStringList.Create;

    // we support a list of attributes, separated by comma, so assigning the
    // string to the .CommaText property of the string list will load the
    // string list with all the values
    slTemp.CommaText := Attributes;

    // how many attributes did we specify? We need to size our array accordingly
    AttrCount := slTemp.Count;
    SetLength(AttrArray, AttrCount);

    // assign the values to the attribute array
    for ix := 0 to AttrCount-1 do begin
      AttrArray[ix] := slTemp[ix];
    end;
    slTemp.Free;
  end
  else begin
    // we did not specify any attributes - set the count to -1 and the array to nil
    AttrCount := Cardinal(-1);
    AttrArray := nil;
  end;

  // execute search
  FResult := FDirSrchIntf.ExecuteSearch(@wsFilter[1], AttrArray, AttrCount, FSearchHandle);
  if not Succeeded(FResult) then begin
    raise EADSISearchException.CreateFmt(rc_SearchFailed, [FResult]);
  end;

  FSearchExecuted := True;
end;

initialization
  // try to load the ActiveDs.DLL library - should be in your system32 directory
  ActiveDSHandle := LoadLibrary('ActiveDS.dll');
  if (ActiveDSHandle = 0) then
    raise Exception.Create(rc_CannotLoadActiveDS);

  // bind the ADsGetObject helper function
  gADsGetObject := GetProcAddress(ActiveDSHandle, 'ADsGetObject');
  if not Assigned(gADsGetObject) then
    raise Exception.Create(rc_CannotGetProcAddress + 'ADsGetObject');

  // bind the FreeADsMem helper function
  gFreeADsMem := GetProcAddress(ActiveDSHandle, 'FreeADsMem');
  if not Assigned(gFreeADsMem) then
    raise Exception.Create(rc_CannotGetProcAddress + 'FreeADsMem');

finalization
  // if we had loaded an instance of ActiveDs.DLL, release it
  if (ActiveDSHandle <> 0) then
    FreeLibrary(ActiveDSHandle);

end.

