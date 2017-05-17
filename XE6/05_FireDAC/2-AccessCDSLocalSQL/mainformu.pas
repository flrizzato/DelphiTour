(*
  Copyright (c) 2013 Cary Jensen

  This sample was designed to accompany the Embarcadero Webinar
  Universal Enterprise Data Connectivity using FireDAC,
  presented on October 30th, 2013 by Cary Jensen

  No guarantees or warranties are expressed or implied concerning
  the applicability of techniques or code included in this example.
  If you wish to use techniques or code included in this example,
  it is your responsibility to test and certify any code, 
  techniques, or design adopted as a result of this project.

  For consulting, training, and development services,
  visit http://www.JensenDataSystems.com


  For information about Delphi Developer Days with Bob Swart and Cary Jensen,
  visit http://www.DelphiDeveloperDays.com

*)
unit mainformu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses datamodu;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 250;
end;

end.
