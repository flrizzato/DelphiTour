unit uMain_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,  FMX.Layouts,
  FMX.TabControl, FMX.StdCtrls, FMX.ListView.Types, FMX.ListView, FMX.Memo,
  REST.Backend.MetaTypes,
  REST.Backend.ServiceTypes,
  MDB.BusinessObjects, FMX.Edit;

type
  Tfrm_Main = class(TForm)
    tc_main: TTabControl;
    ti_ListRecipes: TTabItem;
    ti_EditRecipe: TTabItem;
    tb_HdrList: TToolBar;
    lbl_HdrList: TLabel;
    lv_Recipes: TListView;
    btn_AddRecipe: TButton;
    btn_RefreshList: TButton;
    ti_ViewRecipe: TTabItem;
    tb_HdrView: TToolBar;
    tb_Hdr_Edit: TToolBar;
    lbl_HdrView: TLabel;
    btn_EditRecipe: TButton;
    btn_Back2List: TButton;
    lbl_HdrEdit: TLabel;
    btn_Back2View: TButton;
    lbl_RecipeTitle: TLabel;
    memo_ViewRecipeBody: TMemo;
    edt_EditReceipeTitle: TEdit;
    memo_EditReceipeBody: TMemo;
    btn_SaveRecipe: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_AddRecipeClick(Sender: TObject);
    procedure btn_RefreshListClick(Sender: TObject);
    procedure lv_RecipesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure lv_RecipesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure btn_Back2ListClick(Sender: TObject);
    procedure btn_Back2ViewClick(Sender: TObject);
    procedure btn_EditRecipeClick(Sender: TObject);
    procedure btn_SaveRecipeClick(Sender: TObject);
  private
    { Private declarations }
    FActiveRecipe : TRecipe;
    FRecipesList : TBackendObjectList<TRecipe>;

    function ObjectIDFromRecipe( const ARecipe : TRecipe ) : string;

    procedure DoAddRecipe;
    procedure DoEditRecipe( const ARecipe : TRecipe );
    procedure DoDisplayRecipe;
    procedure DoSaveRecipe;
    procedure DoDeleteRecipe( const AObjectID : string );
    procedure DoListRecipes;
  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;

implementation
uses
  MBD.DataModule;

{$R *.fmx}

procedure Tfrm_Main.btn_AddRecipeClick(Sender: TObject);
begin
  DoAddRecipe;
end;

procedure Tfrm_Main.btn_Back2ListClick(Sender: TObject);
begin
  tc_main.SetActiveTabWithTransition( ti_ListRecipes, TTabTransition.Slide, TTabTransitionDirection.Reversed );
end;

procedure Tfrm_Main.btn_Back2ViewClick(Sender: TObject);
begin
  tc_main.SetActiveTabWithTransition( ti_ViewRecipe, TTabTransition.Slide, TTabTransitionDirection.Reversed );
end;

procedure Tfrm_Main.btn_EditRecipeClick(Sender: TObject);
begin
  DoEditRecipe( FActiveRecipe );
end;

procedure Tfrm_Main.btn_RefreshListClick(Sender: TObject);
begin
  DoListRecipes;
end;

procedure Tfrm_Main.btn_SaveRecipeClick(Sender: TObject);
begin
  if NOT Assigned(FActiveRecipe) then
    FActiveRecipe := TRecipe.Create;

  FActiveRecipe.Title := edt_EditReceipeTitle.Text;
  FActiveRecipe.Body := memo_EditReceipeBody.Text;

  DoSaveRecipe;
  DoDisplayRecipe;
end;

procedure Tfrm_Main.DoAddRecipe;
begin
  FActiveRecipe := nil;

  edt_EditReceipeTitle.Text := '';
  memo_EditReceipeBody.Text := '';

  tc_main.SetActiveTabWithTransition( ti_EditRecipe, TTabTransition.Slide, TTabTransitionDirection.Normal );
end;

procedure Tfrm_Main.DoDeleteRecipe( const AObjectID : string );
begin
  dm.BackendStorage.Storage.DeleteObject(BaasSCollectionIdentifier, AObjectID);
end;

procedure Tfrm_Main.DoDisplayRecipe;
begin
  lbl_RecipeTitle.Text := FActiveRecipe.Title;
  memo_ViewRecipeBody.Text := FActiveRecipe.Body;

  tc_main.SetActiveTabWithTransition( ti_ViewRecipe, TTabTransition.Slide, TTabTransitionDirection.Normal );
end;

procedure Tfrm_Main.DoEditRecipe(const ARecipe: TRecipe);
begin
  edt_EditReceipeTitle.Text := ARecipe.Title;
  memo_EditReceipeBody.Text := ARecipe.Body;

  tc_main.SetActiveTabWithTransition( ti_EditRecipe, TTabTransition.Slide, TTabTransitionDirection.Normal );
end;

procedure Tfrm_Main.DoListRecipes;
var
  LQuery : TArray<string>;
  LItem : TListViewItem;
  LRecipe : TRecipe;
  LEntity : TBackendEntityValue;
begin

  /// somehow there is a .clear missing ... ?
  FRecipesList.Free;
  FRecipesList := TBackendObjectList<TRecipe>.Create;

  LQuery := TArray<string>.Create('sort=name');
  dm.BackendStorage.Storage.QueryObjects<TRecipe>(BaasSCollectionIdentifier, LQuery, FRecipesList);

  lv_Recipes.BeginUpdate;
  TRY
    lv_Recipes.Items.Clear;
    for LRecipe IN FRecipesList do
    begin
      LEntity := FRecipesList.EntityValues[ LRecipe ];

      LItem := lv_Recipes.Items.Add;
      LItem.Text := LRecipe.Title;
      LItem.Data['objectid'] := LEntity.ObjectID;
    end;
  FINALLY
    lv_Recipes.EndUpdate;
  END;
end;

procedure Tfrm_Main.DoSaveRecipe;
var
  LEntity : TBackendEntityValue;
begin

  if ObjectIDFromRecipe(FActiveRecipe) <> '' then
  begin
    dm.BackendStorage.Storage.UpdateObject( FRecipesList.EntityValues[FActiveRecipe], FActiveRecipe, LEntity );
  end
  else
  begin
    dm.BackendStorage.Storage.CreateObject<TRecipe>(BaasSCollectionIdentifier, FActiveRecipe, LEntity);
    FRecipesList.Add( FActiveRecipe, LEntity );
  end;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
begin
  FActiveRecipe := nil;
  FRecipesList := TBackendObjectList<TRecipe>.Create;

  tc_main.ActiveTab := ti_ListRecipes;
  tc_main.TabPosition := TTabPosition.None;
end;

procedure Tfrm_Main.FormDestroy(Sender: TObject);
begin
  FreeAndNil( FRecipesList );
end;

procedure Tfrm_Main.lv_RecipesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  FActiveRecipe := FRecipesList[ AIndex ];

  if MessageDlg('Delete recipe "'+FActiveRecipe.Title+'"', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DoDeleteRecipe( ObjectIDFromRecipe(FActiveRecipe) );
  end;
end;

procedure Tfrm_Main.lv_RecipesItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  FActiveRecipe := FRecipesList[ AItem.Index ];
  DoDisplayRecipe;
end;

function Tfrm_Main.ObjectIDFromRecipe( const ARecipe : TRecipe ) : string;
begin
  if Assigned(ARecipe) and (FRecipesList.IndexOf( ARecipe ) > -1) then
    result := FRecipesList.EntityValues[ ARecipe ].ObjectID
  else
    result := '';
end;

end.
