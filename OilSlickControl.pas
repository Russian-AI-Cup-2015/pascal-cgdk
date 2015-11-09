unit OilSlickControl;

interface

uses
    Math, TypeControl, CircularUnitControl;

type
    TOilSlick = class (TCircularUnit)
    private
        FRemainingLifetime: LongInt;

    public
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; radius: Double; remainingLifetime: LongInt);

        function GetRemainingLifetime: LongInt;

        destructor Destroy; override;

    end;

    TOilSlickArray = array of TOilSlick;

implementation

constructor TOilSlick.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double;
        angle: Double; angularSpeed: Double; radius: Double; remainingLifetime: LongInt);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, radius);

    FRemainingLifetime := remainingLifetime;
end;

function TOilSlick.GetRemainingLifetime: LongInt;
begin
    result := FRemainingLifetime;
end;

destructor TOilSlick.Destroy;
begin
    inherited;
end;

end.
