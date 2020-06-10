program admob_basic;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  HeaderFooterFormwithNavigation in 'HeaderFooterFormwithNavigation.pas' {HeaderFooterwithNavigation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THeaderFooterwithNavigation, HeaderFooterwithNavigation);
  Application.Run;
end.
