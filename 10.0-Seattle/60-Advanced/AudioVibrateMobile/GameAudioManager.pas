{ The MIT License (MIT)

  Copyright (c) 2014 FMXExpress.com

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE. }

unit GameAudioManager;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, FMX.Dialogs,
  FMX.Forms
{$IFDEF ANDROID}
    , androidapi.jni.media, FMX.Helpers.Android, androidapi.jni.JavaTypes,
  androidapi.jni.GraphicsContentViewText, androidapi.JNIBridge,
  androidapi.Helpers
{$ENDIF}
{$IFDEF IOS}
    , MacApi.CoreFoundation, FMX.Platform.iOS, iOSapi.CocoaTypes,
  iOSapi.AVFoundation, iOSapi.Foundation
{$ELSE}
{$IFDEF MACOS}
    , MacApi.CoreFoundation, FMX.Platform.Mac, MacApi.CocoaTypes, MacApi.AppKit,
  MacApi.Foundation
{$ENDIF}
{$ENDIF}
{$IFDEF MSWINDOWS}
    , MMSystem
{$ENDIF}
    ;

type
  TSoundRec = record
    SFilename: String;
    SName: String;
    SNameExt: string;
    SID: integer;
  end;

  PSoundRec = ^TSoundRec;

{$IFDEF ANDROID}

  TOnSpoolLoadCallBack = class(TJavaLocal, JSoundPool_OnLoadCompleteListener)
  private
  public
    procedure onLoadComplete(soundPool: JSoundPool;
      sampleId, status: integer); cdecl;
  end;
{$ENDIF}

  TGameAudioManager = Class
  Private
    fSoundsList: TList;

{$IFDEF ANDROID}
    fAudioMgr: JAudioManager;
    fSoundPool: JSoundPool;
{$ENDIF}
    function GetSoundsCount: integer;
    function GetSoundFromIndex(Aindex: integer): PSoundRec;
  Public
    Constructor Create;
    Destructor Destroy; override;

    function AddSound(ASoundFile: string): integer;
    procedure DeleteSound(AName: String); overload;
    procedure DeleteSound(Aindex: integer); overload;
    procedure PlaySound(AName: String); overload;
    procedure PlaySound(Aindex: integer); overload;

    property SoundsCount: integer read GetSoundsCount;
    property Sounds[Aindex: integer]: PSoundRec read GetSoundFromIndex;
  end;

var
  GLoaded: Boolean;

{$IFDEF IOS}

Const
  _libAudioToolbox =
    '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';

procedure AudioServicesPlaySystemSound(inSystemSoundID: integer); cdecl;
  external _libAudioToolbox name 'AudioServicesPlaySystemSound';
procedure AudioServicesCreateSystemSoundID(inFileURL: CFURLRef;
  var SystemSoundID: pinteger); cdecl;
  external _libAudioToolbox name 'AudioServicesCreateSystemSoundID';
procedure AudioServicesDisposeSystemSoundID(inSystemSoundID: integer); cdecl;
  external _libAudioToolbox name 'AudioServicesDisposeSystemSoundID';
procedure AudioServicesAddSystemSoundCompletion(inSystemSoundID: integer;
  inRunLoop: CFRunLoopRef; inRunLoopMode: CFStringRef;
  inCompletionRoutine: Pointer; inClientData: CFURLRef); cdecl;
  external _libAudioToolbox name 'AudioServicesAddSystemSoundCompletion';
{$ENDIF}

implementation

{ TGameAudioManager }

{$IFDEF ANDROID}

procedure TOnSpoolLoadCallBack.onLoadComplete(soundPool: JSoundPool;
  sampleId, status: integer);
begin
  GLoaded := True;
end;
{$ENDIF}
{$IF Defined(IOS) OR Defined(MACOS)}

procedure oncompleteionIosProc(SystemSndID: integer; var AData: Pointer);
begin
  // place here the code to run when a sound finish playing
end;
{$ENDIF}

constructor TGameAudioManager.Create;
begin
  try
    fSoundsList := TList.Create;
{$IFDEF ANDROID}
    fAudioMgr := TJAudioManager.Wrap
      ((SharedActivity.getSystemService(TJContext.JavaClass.AUDIO_SERVICE)
      as ILocalObject).GetObjectID);
    fSoundPool := TJSoundPool.JavaClass.init(4,
      TJAudioManager.JavaClass.STREAM_MUSIC, 0);
{$ENDIF}
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.Create] : ' + E.message);
  end;
end;

destructor TGameAudioManager.Destroy;
var
  i: integer;
  wRec: PSoundRec;
begin
  try
    for i := fSoundsList.Count - 1 downto 0 do
    begin
      wRec := fSoundsList[i];
      Dispose(wRec);
      fSoundsList.Delete(i);
    end;
    fSoundsList.Free;
{$IFDEF ANDROID}
    fSoundPool := nil;
    fAudioMgr := nil;
{$ENDIF}
    inherited;
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.Destroy] : ' + E.message);
  end;
end;

function TGameAudioManager.AddSound(ASoundFile: string): integer;
var
  wSndRec: PSoundRec;
{$IFDEF ANDROID}
  wOnAndroidSndComplete: JSoundPool_OnLoadCompleteListener;
{$ENDIF}
{$IFDEF IOS}
  wSndID: integer;
  wNSURL: CFURLRef;
  wNSFilename: CFStringRef;
{$ENDIF}
begin
  try
    New(wSndRec);
    wSndRec.SFilename := ASoundFile;
    wSndRec.SNameExt := ExtractFilename(ASoundFile);
    wSndRec.SName := ChangeFileExt(wSndRec.SNameExt, '');

{$IFDEF ANDROID}
    wOnAndroidSndComplete := TJSoundPool_OnLoadCompleteListener.Wrap
      ((TOnSpoolLoadCallBack.Create as ILocalObject).GetObjectID);
    fSoundPool.setOnLoadCompleteListener(wOnAndroidSndComplete);

    GLoaded := False;
    wSndRec.SID := fSoundPool.load(StringToJString(ASoundFile), 0);
    while not GLoaded do
    begin
      Sleep(10);
      Application.ProcessMessages;
    end;
{$ENDIF}
{$IFDEF IOS}
    wNSFilename := CFStringCreateWithCharacters(nil, PChar(ASoundFile),
      Length(ASoundFile));
    wNSURL := CFURLCreateWithFileSystemPath(nil, wNSFilename,
      kCFURLPOSIXPathStyle, False);
    AudioServicesCreateSystemSoundID(wNSURL, pinteger(wSndID));
    wSndRec.SID := wSndID;
    AudioServicesAddSystemSoundCompletion(wSndID, nil, nil,
      @oncompleteionIosProc, nil);
{$ENDIF}
    Result := fSoundsList.Add(wSndRec);
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.AddSound] : ' + E.message);
  end;
end;

procedure TGameAudioManager.DeleteSound(Aindex: integer);
var
  wRec: PSoundRec;
begin
  try
    if Aindex < fSoundsList.Count then
    begin
      wRec := fSoundsList[Aindex];
{$IFDEF ANDROID}
      fSoundPool.unload(wRec.SID);
{$ENDIF}
{$IFDEF IOS}
      AudioServicesDisposeSystemSoundID(wRec.SID);
{$ENDIF}
      Dispose(wRec);
      fSoundsList.Delete(Aindex);
    end;
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.DeleteSound] : ' + E.message);
  end;
end;

procedure TGameAudioManager.DeleteSound(AName: String);
var
  i: integer;
begin
  try
    for i := 0 to fSoundsList.Count - 1 do
    begin
      if CompareText(PSoundRec(fSoundsList[i]).SName, AName) = 0 then
      begin
        DeleteSound(i);
        Break;
      end;
    end;
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.PlaySound] : ' + E.message);
  end;
end;

procedure TGameAudioManager.PlaySound(Aindex: integer);
var
  wRec: PSoundRec;
{$IFDEF ANDROID}
  wCurrVolume, wMaxVolume: Double;
  wVolume: Double;
{$ENDIF}
{$IFNDEF IOS}
{$IFDEF MACOS}
  wNssound: NSSound;
{$ENDIF}
{$ENDIF}
begin
  try
    if Aindex < fSoundsList.Count then
    begin
      wRec := fSoundsList[Aindex];
{$IFDEF ANDROID}
      if Assigned(fAudioMgr) then
      begin
        wCurrVolume := fAudioMgr.getStreamVolume
          (TJAudioManager.JavaClass.STREAM_MUSIC);
        wMaxVolume := fAudioMgr.getStreamMaxVolume
          (TJAudioManager.JavaClass.STREAM_MUSIC);
        wVolume := wCurrVolume / wMaxVolume;
        fSoundPool.play(wRec.SID, wVolume, wVolume, 1, 0, 1);
      end;
{$ENDIF}
{$IFDEF IOS}
      AudioServicesAddSystemSoundCompletion(wRec.SID, nil, nil,
        @oncompleteionIosProc, nil);
      AudioServicesPlaySystemSound(wRec.SID)
{$ELSE}
{$IFDEF MACOS}
      wNssound := TNSSound.Wrap
        (TNSSound.OCClass.soundNamed(NSSTR(wRec.SNameExt)));
      try
        wNssound.setLoops(False);
        wNssound.play;
      finally
        wNssound.Release;
      end;
{$ENDIF}
{$ENDIF}
{$IFDEF MSWINDOWS}
      sndPlaySound(PChar(wRec.SFilename), SND_NODEFAULT Or SND_ASYNC);
{$ENDIF}
    end;
  except
    On E: Exception do
      Raise Exception.Create('[Unknown Name] : ' + E.message);
  end;
end;

procedure TGameAudioManager.PlaySound(AName: String);
var
  i: integer;
begin
  try
    for i := 0 to fSoundsList.Count - 1 do
    begin
      if CompareText(PSoundRec(fSoundsList[i]).SName, AName) = 0 then
      begin
        PlaySound(i);
        Break;
      end;
    end;
  except
    On E: Exception do
      Raise Exception.Create('[TGameAudioManager.PlaySound] : ' + E.message);
  end;
end;

function TGameAudioManager.GetSoundsCount: integer;
begin
  Result := fSoundsList.Count;
end;

function TGameAudioManager.GetSoundFromIndex(Aindex: integer): PSoundRec;
begin
  if Aindex < fSoundsList.Count then
    Result := fSoundsList[Aindex]
  else
    Result := nil;
end;

end.
