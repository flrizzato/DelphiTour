unit BufferedStream_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormReaderWriter = class(TForm)
    btnWrite: TButton;
    btnRead: TButton;
    btnReadBuffered: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnReadBufferedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReaderWriter: TFormReaderWriter;

implementation

{$R *.dfm}

uses
  System.Diagnostics;

procedure TFormReaderWriter.btnReadBufferedClick(Sender: TObject);
var
  buffStr: TBufferedFileStream;
  Total: Integer;
  sw: TStopwatch;
  ch: Char;
begin
  sw := TStopwatch.StartNew;
  buffStr := TBufferedFileStream.Create('test.txt', fmOpenRead );
  try
    Total := 0;
    while buffStr.Read (ch, 1) = 1 do
    begin
      if ch = #13 then
        Inc(Total);
    end;
    Memo1.Lines.Add ('Lines: ' + Total.ToString);
  finally
    buffStr.Free;
  end;
  sw.Stop;
  Memo1.Lines.Add ('msec: ' + sw.ElapsedMilliseconds.ToString);
end;

procedure TFormReaderWriter.btnWriteClick(Sender: TObject);
var
  sw: TStreamWriter;
  I: Integer;
begin
  sw := TStreamWriter.Create(
    'test.txt', False, TEncoding.UTF8);
  try
    // write 100K lines
    sw.WriteLine ('Hello, world');
    for I := 1 to 99999 do
      sw.WriteLine ('Hello ' + I.ToString);
  finally
    sw.Free;
  end;
  Memo1.Lines.Add ('File written');
end;

procedure TFormReaderWriter.btnReadClick(Sender: TObject);
var
  fStr: TFileStream;
  Total: Integer;
  sw: TStopwatch;
  ch: Char;
begin
  sw := TStopwatch.StartNew;
  fStr := TFileStream.Create('test.txt', fmOpenRead );
  try
    Total := 0;
    while fStr.Read (ch, 1) = 1 do
    begin
      if ch = #13 then
        Inc(Total);
    end;
    Memo1.Lines.Add ('Lines: ' + Total.ToString);
  finally
    fStr.Free;
  end;
  sw.Stop;
  Memo1.Lines.Add ('msec: ' + sw.ElapsedMilliseconds.ToString);
end;

end.
