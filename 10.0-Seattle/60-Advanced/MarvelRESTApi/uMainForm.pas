unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TMainForm = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Label1: TLabel;
    butLeft: TSpeedButton;
    butRight: TSpeedButton;
    lblPersonagem: TLabel;
    imgPersonagem: TImage;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure FormCreate(Sender: TObject);
    procedure butLeftClick(Sender: TObject);
    procedure butRightClick(Sender: TObject);
  private
    { Private declarations }
    FOffSet: integer;
    procedure ExecuteRequest;
    procedure OnAfterRequest;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

{ TForm1 }

uses System.UIConsts, System.DateUtils, System.JSON,
  IdHashMessageDigest, Xplat.Utils, FMX.Graphics.HelperClass;

const
  PUBLIC_KEY: string = 'a058d39a512955bc78905eea7307f733';
  PRIVATE_KEY: string = 'c082618550a1a3937d9aacb4a484658fac81e30a';

procedure TMainForm.butLeftClick(Sender: TObject);
begin
  if FOffSet >= 1 then
     Dec(FOffSet);
  ExecuteRequest;
end;

procedure TMainForm.butRightClick(Sender: TObject);
begin
  Inc(FOffSet);
  ExecuteRequest;
end;

procedure TMainForm.ExecuteRequest;
var
  TS: string;
  HASHStr: string;
  imd5: TIdHashMessageDigest;
begin
  StartWait;
  TS := IntToStr(DateTimeToUnix(Now));
  RESTRequest1.Params.ParameterByName('OFFSET').Value := FOffSet.ToString;
  RESTRequest1.Params.ParameterByName('TS').Value := TS;
  RESTRequest1.Params.ParameterByName('APIKEY').Value := PUBLIC_KEY;
  imd5 := TIdHashMessageDigest5.Create;
  try
    HASHStr := TS + PRIVATE_KEY + PUBLIC_KEY;
    RESTRequest1.Params.ParameterByName('HASH').Value :=
      imd5.HashStringAsHex(HASHStr).ToLower;
    RESTRequest1.ExecuteAsync(OnAfterRequest);
  finally
    imd5.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FOffSet := 0;
  ExecuteRequest;
end;

procedure TMainForm.OnAfterRequest;
var
  RetObject: TJSONObject;
  RetData: TJSONObject;
  MResult: TJSONObject;
  Thumbnail: TJSONObject;
  URL: string;
begin
  try
    RetObject := TJSONObject.ParseJSONValue(RESTResponse1.Content)
      as TJSONObject;
    RetData := RetObject.GetValue('data') as TJSONObject;
    MResult := (RetData.GetValue('results') as TJSONArray).Get(0)
      as TJSONObject;
    Thumbnail := MResult.GetValue('thumbnail') as TJSONObject;
    lblPersonagem.Text := MResult.GetValue('name').Value;

    // utilizando um class helper para ler a imagem em segundo plano...
    imgPersonagem.Bitmap.Clear(TAlphaColor(claWhitesmoke));
    URL := Thumbnail.GetValue('path').Value + '.' +
      Thumbnail.GetValue('extension').Value;
    imgPersonagem.Bitmap.LoadFromUrl(URL);

  finally
    StopWait;
  end;
end;

end.
