unit SendMail;

interface

uses
{$IFDEF IOS}
  Macapi.ObjectiveC, Macapi.CoreFoundation, Macapi.Dispatch,
  iOSApi.CocoaTypes, iOSApi.Foundation, Posix.SysSocket;
{$ENDIF}
{$IFDEF ANDROID}
FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge, Androidapi.JNI.JavaTypes, Androidapi.JNI.Net,
  Androidapi.JNI.Os, Androidapi.Helpers;
{$ENDIF}

procedure CreateEmail(const Recipient, Subject, Content, FileToAttach: string);

implementation

procedure CreateEmail(const Recipient, Subject, Content, FileToAttach: string);
{$IFDEF ANDROID}
var
  JRecipient: TJavaObjectArray<JString>;
  AttachmentFile: JFile;
  Intent: JIntent;
  Uri: Jnet_Uri;
{$ENDIF}
begin
{$IFDEF ANDROID}
  JRecipient := TJavaObjectArray<JString>.Create(1);
  JRecipient.Items[0] := StringToJString(Recipient);

  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_SEND);
  Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
  Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, JRecipient);
  Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString(Subject));
  Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(Content));

  if FileToAttach <> '' then
  begin
    AttachmentFile := TJFile.JavaClass.init(StringToJString(FileToAttach));
    Uri := TJnet_Uri.JavaClass.fromFile(AttachmentFile);
    Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM,
      TJParcelable.Wrap((Uri as ILocalObject).GetObjectID));
  end;

  Intent.setType(StringToJString('vnd.android.cursor.dir/email'));

  SharedActivity.startActivity(Intent);
{$ENDIF}
end;

end.
