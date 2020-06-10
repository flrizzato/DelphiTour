program RelativePanel;

uses
  Vcl.Forms,
  uRelativePanel in 'uRelativePanel.pas' {RelativePanelForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TRelativePanelForm, RelativePanelForm);
  Application.Run;
end.
