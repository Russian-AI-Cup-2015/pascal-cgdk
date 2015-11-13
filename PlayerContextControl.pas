unit PlayerContextControl;

interface

uses
  Math, TypeControl, CarControl, WorldControl;

type
  TPlayerContext = class
  private
    FCars: TCarArray;
    FWorld: TWorld;
    function GetCars: TCarArray;
    function GetWorld: TWorld;
  public
    property Cars: TCarArray read GetCars;
    property World: TWorld read GetWorld;
    constructor Create(const ACars: TCarArray; const AWorld: TWorld);
    destructor Destroy; override;
  end;

  TPlayerContextArray = array of TPlayerContext;

implementation

function TPlayerContext.GetCars: TCarArray;
begin
  if Assigned(FCars) then 
    Result := Copy(FCars, 0, Length(FCars))
  else  
    Result := nil;
end;

function TPlayerContext.GetWorld: TWorld;
begin
  Result := FWorld;
end;

constructor TPlayerContext.Create(const ACars: TCarArray; const AWorld: TWorld);
begin
  if Assigned(ACars) then 
    FCars := Copy(ACars, 0, Length(ACars))
  else
    FCars := nil;
  FWorld := AWorld;
end;

destructor TPlayerContext.Destroy;
var
  I: LongInt;
begin
  if Assigned(FCars) then 
  begin
    if Length(FCars) > 0 then
    begin
      for i := High(FCars) downto 0 do 
      begin
        if Assigned(FCars[I]) then 
          FCars[i].Free;
      end;
      SetLength(FCars, 0);
    end;
  end;
  if Assigned(FWorld) then 
    FWorld.Free;
  inherited;
end;

end.
