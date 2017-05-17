unit fillables;

interface

type
  TFillableSingle = record
    IsFilled: boolean;
    Value: single;
    function ToString: string;
  end;

  TFillableDateTime = record
    IsFilled: boolean;
    Value: TDateTime;
    function ToString: string;
  end;

implementation

uses
  System.SysUtils;

{ TFillableSingle }

function TFillableSingle.ToString: string;
begin
  if IsFilled then
    Result := FloatToStr(Value)
  else
    Result := '';
end;

{ TFillableDateTime }

function TFillableDateTime.ToString: string;
begin
  if IsFilled then
    Result := DateTimeToStr(Value)
  else
    Result := '';
end;

end.
