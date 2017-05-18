{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit C:\DTOUR-Tokyo\03-IDE\Androidapi.JNI.base64coder;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type
// ===== Forward declarations =====

  JBase64Coder = interface;//biz.source_code.base64Coder.Base64Coder

// ===== Interface declarations =====

  JBase64CoderClass = interface(JObjectClass)
    ['{6EF391FF-996F-4980-8A2D-8C0092301CF7}']
    {class} function encode(P1: TJavaArray<Byte>): TJavaArray<Char>; cdecl;
    {class} function encodeString(P1: JString): JString; cdecl;
  end;

  [JavaSignature('biz/source_code/base64Coder/Base64Coder')]
  JBase64Coder = interface(JObject)
    ['{AA106EE5-516B-4C45-A0FB-6D986B496367}']
  end;
  TJBase64Coder = class(TJavaGenericImport<JBase64CoderClass, JBase64Coder>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('C:\DTOUR-Tokyo\03-IDE\Androidapi.JNI.base64coder.JBase64Coder', TypeInfo(C:\DTOUR-Tokyo\03-IDE\Androidapi.JNI.base64coder.JBase64Coder));
end;

initialization
  RegisterTypes;
end.


