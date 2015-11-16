unit PlayerContextControl;

interface

uses
  Math, TypeControl, CarControl, WorldControl;

type
  TPlayerContext = class
  private
    FCars: TCarArray;
    FWorld: TWorld;

  public
    constructor Create(const cars: TCarArray; const world: TWorld);

    function GetCars: TCarArray;
    property Cars: TCarArray read GetCars;
    function GetWorld: TWorld;
    property World: TWorld read GetWorld;

    destructor Destroy; override;

  end;

  TPlayerContextArray = array of TPlayerContext;

implementation

constructor TPlayerContext.Create(const cars: TCarArray; const world: TWorld);
begin
  if Assigned(cars) then begin
    FCars := Copy(cars, 0, Length(cars));
  end else begin
    FCars := nil;
  end;
  FWorld := world;
end;

function TPlayerContext.GetCars: TCarArray;
begin
  if Assigned(FCars) then begin
    result := Copy(FCars, 0, Length(FCars));
  end else begin
    result := nil;
  end;
end;

function TPlayerContext.GetWorld: TWorld;
begin
  result := FWorld;
end;

destructor TPlayerContext.Destroy;
var
  i: LongInt;

begin
  if Assigned(FCars) then begin
    for i := High(FCars) downto 0 do begin
      if Assigned(FCars[i]) then begin
        FCars[i].Free;
      end;
    end;
  end;

  if Assigned(FWorld) then begin
    FWorld.Free;
  end;

  inherited;
end;

end.
