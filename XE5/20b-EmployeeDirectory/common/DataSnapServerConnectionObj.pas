unit DataSnapServerConnectionObj;

interface

uses System.Classes;

type
  TDataSnapConnectionDetails = class
  strict private
    FPort: Integer;
    FServer: string;
    FURLPath: string;
    FPassword: string;
    FUserName: string;
    procedure SetPort(const Value: Integer);
    procedure SetServer(const Value: string);
    function GetPortStr: string;
  public
    constructor Create;
  published
    property Port : Integer read FPort write SetPort;
    property PortStr : string read GetPortStr;
    property Server : string read FServer write SetServer;
    property URLPath : string read FURLPath write FURLPath;
    property UserName : string read FUserName write FUserName;
    property Password : string read FPassword write FPassword;
  end;

  TDataSnapConnectionDetailsServices = class
    class procedure Save(Instance : TDataSnapConnectionDetails; FileName : string);
    class procedure Load(Instance : TDataSnapConnectionDetails; FileName : string);
    class procedure SetParams(const Params : TStrings; const ConnectionDetails : TDataSnapConnectionDetails);
  end;

implementation

{ TDataSnapConnectionDetails }
uses System.SysUtils, INIFiles;

constructor TDataSnapConnectionDetails.Create;
begin
  FPort := 8080;
  FServer := '127.0.0.1';
  FURLPath := '';
end;

function TDataSnapConnectionDetails.GetPortStr: string;
begin
 if Server.Contains(':') or (Port = 0) then
   Result := ''
 else
   Result := Port.ToString;
end;

procedure TDataSnapConnectionDetails.SetPort(const Value: Integer);
begin
  Assert(Value >= 0);
  FPort := Value;
end;

procedure TDataSnapConnectionDetails.SetServer(const Value: string);
begin
  Assert(Trim(Value) > '');
  FServer := Value;
end;

{ TDataSnapConnectionDetailsServices }

class procedure TDataSnapConnectionDetailsServices.Load(
  Instance: TDataSnapConnectionDetails; FileName: string);
var
  Ini: TIniFile;
begin
  Assert(Instance <> nil);

  if not FileExists(FileName) then
    Exit;

  Ini := TIniFile.Create(FileName);
  try
    Instance.Server := Ini.ReadString('SERVER','HOST',Instance.Server);
    Instance.Port := Ini.ReadInteger('SERVER','PORT',Instance.Port);
    Instance.URLPath := Ini.ReadString('SERVER','URLPath',Instance.URLPath);
    Instance.UserName := Ini.ReadString('SERVER','UserName',Instance.UserName);
  finally
    Ini.Free;
  end;
end;

class procedure TDataSnapConnectionDetailsServices.Save(
  Instance: TDataSnapConnectionDetails; FileName: string);
var
  Ini: TIniFile;
begin
  Assert(Instance <> nil);
  try
    Ini := TIniFile.Create(FileName);
    try
      Ini.WriteString('SERVER','HOST',Instance.Server);
      Ini.WriteInteger('SERVER','PORT',Instance.Port);
      Ini.WriteString('SERVER','URLPath',Instance.URLPath);
      Ini.WriteString('SERVER','UserName',Instance.UserName);
    finally
      Ini.Free;
    end;
  except
  end;
end;

class procedure TDataSnapConnectionDetailsServices.SetParams(const Params: TStrings; const ConnectionDetails : TDataSnapConnectionDetails);
begin
  Params.Values['PORT'] := ConnectionDetails.PortStr;
  Params.Values['HOSTNAME'] := ConnectionDetails.Server;
  Params.Values['URLPath'] := ConnectionDetails.URLPath;
  Params.Values['DSAuthenticationUser'] := ConnectionDetails.UserName;
  Params.Values['DSAuthenticationPassword'] := ConnectionDetails.Password;
end;

end.
