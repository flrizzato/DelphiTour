unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LabeledEditFIRST_NAME: TLabeledEdit;
    LinkControlToFieldFIRST_NAME2: TLinkControlToField;
    LabeledEditLAST_NAME: TLabeledEdit;
    LinkControlToFieldLAST_NAME2: TLinkControlToField;
    LabeledEditPHONE_EXT: TLabeledEdit;
    LinkControlToFieldPHONE_EXT2: TLinkControlToField;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    StringGrid2: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    StringGrid3: TStringGrid;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    StringGrid4: TStringGrid;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
uses dataModuleMain;

procedure TForm3.FormCreate(Sender: TObject);
begin
  DataModule1.ServerDetails.Server := 'localhost';
  DataModule1.ServerDetails.Port := 8080;
  DataModule1.SQLConnection1.Open;
end;

end.
