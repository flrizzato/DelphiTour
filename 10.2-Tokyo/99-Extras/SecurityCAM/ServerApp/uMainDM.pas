unit uMainDM;

interface

uses
  System.SysUtils, System.Classes, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, System.Threading, FMX.Objects;

type
  TMainDM = class(TDataModule)
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    aTask: ITask;
    bActive: boolean;
  public
    { Public declarations }
    function IsActive: boolean;
    procedure StartVideoStream(sURL: string; aImage: TImage);
    procedure StopVideoStream;
  end;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}
{ TMainDM }

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  bActive := False;
end;

procedure TMainDM.DataModuleDestroy(Sender: TObject);
begin
  if IsActive then
    StopVideoStream;
end;

function TMainDM.IsActive: boolean;
begin
  Result := bActive;
end;

procedure TMainDM.StartVideoStream(sURL: string; aImage: TImage);
begin
  bActive := True;
  aTask := TTask.Create(
    procedure()
    var
      ResponseContent: TMemoryStream;
    begin
      ResponseContent := TMemoryStream.Create;
      try
        while aTask.Status <> TTaskStatus.Canceled do
        begin
          ResponseContent.Clear;
          NetHTTPClient1.Get(sURL, ResponseContent);
          if (ResponseContent.Size = 0) then
            exit
          else
          begin
            ResponseContent.Position := 0;
            TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                aImage.Bitmap.LoadFromStream(ResponseContent);
              end);
          end;
        end;
      finally
        ResponseContent.Free;
      end;
    end);
  aTask.Start;
end;

procedure TMainDM.StopVideoStream;
begin
  bActive := False;
  aTask.Cancel;
end;

end.
