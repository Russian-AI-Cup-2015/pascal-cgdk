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
        constructor Create(cars: TCarArray; world: TWorld);

        function GetCars: TCarArray;
        function GetWorld: TWorld;

        destructor Destroy; override;

    end;

    TPlayerContextArray = array of TPlayerContext;

implementation

constructor TPlayerContext.Create(cars: TCarArray; world: TWorld);
begin
    if cars = nil then begin
        FCars := nil;
    end else begin
        FCars := Copy(cars, 0, Length(cars));
    end;
    FWorld := world;
end;

function TPlayerContext.GetCars: TCarArray;
begin
    if FCars = nil then begin
        result := nil;
    end else begin
        result := Copy(FCars, 0, Length(FCars));
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
    if FCars <> nil then begin
        for i := High(FCars) downto 0 do begin
            if FCars[i] <> nil then begin
                FCars[i].Free;
            end;
        end;
    end;

    if FWorld <> nil then begin
        FWorld.Free;
    end;

    inherited;
end;

end.
