unit frmFishmain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Editors, FMX.Layouts, Fmx.Bind.Navigator,
  Data.Bind.Components, FMX.Objects, Data.Bind.DBScope, Data.DB,
  Datasnap.DBClient, FMX.Memo, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  FMX.StdCtrls;

type
  TForm1 = class(TForm)
    EditSpeciesName: TEdit;
    EditLengthCM: TEdit;
    MemoNotes: TMemo;
    cbWordWrap: TCheckBox;
    BindingsList1: TBindingsList;
    LinkControlToProperty1: TLinkControlToProperty;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    rctFishLengthCM: TRectangle;
    LinkPropertyToField1: TLinkPropertyToField;
    BindNavigator1: TBindNavigator;
    EditCategory: TEdit;
    Label1: TLabel;
    LinkControlToField9: TLinkControlToField;
    EditLength_In: TEdit;
    Label2: TLabel;
    LinkControlToField10: TLinkControlToField;
    ImageControlGraphic: TImageControl;
    Label3: TLabel;
    LinkControlToField11: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
