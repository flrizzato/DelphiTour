unit StirngsBasicsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.ListBox;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    btnRefCount: TButton;
    Memo1: TMemo;
    btnCopy: TButton;
    btnConcatenate: TButton;
    Memo2: TMemo;
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    Memo3: TMemo;
    Button3: TButton;
    procedure btnRefCountClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnConcatenateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}

uses
  Diagnostics;

{$WARN IMMUTABLE_STRINGS ON}

var
  str2: string;

function StrMemAddr (const aString: string): string;
begin
  Result := IntToHex (Integer(Pointer (aString)), 8);
end;

const
  MaxLoop = 2000000; // two million


procedure TTabbedForm.btnConcatenateClick(Sender: TObject);
var
  str1, str2, strFinal: string;
  sBuilder: TStringBuilder;
  I: Integer;
  t1, t2: TStopwatch;
begin
  t1 := TStopwatch.StartNew;
  str1 := 'Marco ';
  str2 := 'Cantu ';
  for I := 1 to MaxLoop do
    str1 := str1 + str2;
  strFinal := str1;
  t1.Stop;
  Memo2.Lines.Add('Length: ' + IntToStr (strFinal.Length));
  Memo2.Lines.Add('Concatenation: ' + IntToStr (t1.ElapsedMilliseconds));

  t2 := TStopwatch.StartNew;
  str1 := 'Marco ';
  str2 := 'Cantu ';
  sBuilder := TStringBuilder.Create (str1,
    str1.Length + str2.Length * MaxLoop);
  try
    for I := 1 to MaxLoop do
      sBuilder.Append(str2);
    strFinal := sBuilder.ToString;
  finally
    sBuilder.Free;
  end;
  t2.Stop;
  Memo2.Lines.Add('Length: ' + IntToStr (strFinal.Length));
  Memo2.Lines.Add('StringBuilder: ' + IntToStr (t2.ElapsedMilliseconds));
end;

procedure TTabbedForm.btnCopyClick(Sender: TObject);
var
  str3, str4: string;
begin
  // two different strings
  str3 := 'Hello';
  str4 := ' world';
  Memo1.Lines.Add (str3 + ' - ' + StrMemAddr (str3));
  Memo1.Lines.Add (str4 + ' - ' + StrMemAddr (str4));

  // change one, alias the two
  str3 := str3 + str4;
  str4 := str3;
  Memo1.Lines.Add (str3 + ' - ' + StrMemAddr (str3));
  Memo1.Lines.Add (str4 + ' - ' + StrMemAddr (str4));

  // change one (not the other)
  str3 := str3 + '!';
  Memo1.Lines.Add (str3 + ' - ' + StrMemAddr (str3));
  Memo1.Lines.Add (str4 + ' - ' + StrMemAddr (str4));

  // change the first one, again
  str3 [5] := '!';
  Memo1.Lines.Add (str3 + ' - ' + StrMemAddr (str3));
  Memo1.Lines.Add (str4 + ' - ' + StrMemAddr (str4));
end;

procedure TTabbedForm.btnRefCountClick(Sender: TObject);
var
  str1: string;
begin
  str2 := 'Hello';
  Memo1.Lines.Add('Initial RefCount: ' + IntToStr (StringRefCount(str2)));
  str1 := str2;
  Memo1.Lines.Add('After assign RefCount: ' + IntToStr (StringRefCount(str2)));
  str2 := str2 + ' World!';
  Memo1.Lines.Add('After change RefCount: ' + IntToStr (StringRefCount(str2)));
end;

{$ZEROBASEDSTRINGS ON}

// use a constant, based on current compilation settings
const thirdChar = Low(string) + 2;

procedure TTabbedForm.Button1Click(Sender: TObject);
var
  s1: string;
begin

  s1 := '1234567890';

  ListBox1.Items.Add(s1);
  ListBox1.Items.Add(s1.Chars[1]);
  ListBox1.Items.Add(s1[1]);
  ListBox1.Items.Add(IntToStr (s1.IndexOf('2')));
  ListBox1.Items.Add(IntToStr (Pos ('2', s1)));

  if s1[thirdChar] = '3' then
    ListBox1.Items.Add('3=3');

end;

const
  nLoopCount = 100000; // 100K

function BuildLongString: string;
var
  str1, str2: string;
  sBuilder: TStringBuilder;
  I: Integer;
begin
  str1 := 'Marco ';
  str2 := 'Cantu ';
  sBuilder := TStringBuilder.Create (str1,
    str1.Length + str2.Length * nLoopCount);
  try
    for I := 1 to nLoopCount do
      sBuilder.Append(str2);
    Result := sBuilder.ToString;
  finally
    sBuilder.Free;
  end;
end;

procedure TTabbedForm.Button2Click(Sender: TObject);
var
  str1: string;
  sBuilder: TStringBuilder;
  t1: TStopwatch;
  I: Integer;
begin
  str1 := BuildLongString;

  t1 := TStopwatch.StartNew;
  for I := Low (str1) to High (str1) do
    if str1 [I] = 'a' then
      str1 [I] := 'A';
  t1.Stop;
  Memo3.Lines.Add('Direct: ' + IntToStr (t1.ElapsedMilliseconds));

  str1 := BuildLongString;
  t1 := TStopwatch.StartNew;
  sBuilder := TStringBuilder.Create;
  for I := Low (str1) to High (str1) do
    if str1.Chars [I] = 'a' then
      sBuilder.Append ('A')
    else
      sBuilder.Append (str1.Chars [I]);
  t1.Stop;
  Memo3.Lines.Add('StringBuilder: ' + IntToStr (t1.ElapsedMilliseconds));
end;

{$IFDEF NEXTGEN}

type
  UTF8String = record
  private
    InternalData: TBytes;
  public
    class operator Implicit (s: string): UTF8String;
    class operator Implicit (us: UTF8String): string;
    class operator Add (us1, us2: UTF8String): UTF8String;
  end;

{ UTF8String }

class operator UTF8String.Add(us1, us2: UTF8String): UTF8String;
begin
  // inefficient code
  Result := UTF8String (string(us1) + string (us2));
end;

class operator UTF8String.Implicit(s: string): UTF8String;
begin
  Result.InternalData := TEncoding.UTF8.GetBytes(s);
end;

class operator UTF8String.Implicit(us: UTF8String): string;
begin
  Result := TEncoding.UTF8.GetString(us.InternalData);
end;

{$ENDIF}

procedure TTabbedForm.Button3Click(Sender: TObject);
var
  strU: UTF8String;
begin
  strU := 'Hello';
  strU := strU + string (' ăąāäâå');
  ShowMessage (strU);
end;


end.
