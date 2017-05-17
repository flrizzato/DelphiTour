unit MDB.BusinessObjects;

interface
uses
  System.Generics.Collections;

const
  BaasSCollectionIdentifier = 'MBaasDemosRecipes';

type
  TRecipe = class(TObject)
  private
    FTitle : string;
    FBody : string;
  public
    constructor Create;

    property Title : string read FTitle write FTitle;
    property Body : string read FBody write FBody;
  end;

  TRecipesList = TList<TRecipe>;


implementation

{ TRecipe }

constructor TRecipe.Create;
begin
  inherited;

  FTitle := '';
  FBody := '';
end;

end.
