program CustomListViewMeetings;

uses
  System.StartUpCopy,
  FMX.Forms,
  CustomList in 'CustomList.pas' {CustomList1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCustomList1, CustomList1);
  Application.Run;
end.
