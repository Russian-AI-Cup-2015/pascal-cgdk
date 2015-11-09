unit CircularUnitControl;

interface

uses
    Math, TypeControl, UnitControl;

type
    TCircularUnit = class (TUnit)
    private
        FRadius: Double;

    protected
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; radius: Double);

    public
        function GetRadius: Double;

        destructor Destroy; override;

    end;

    TCircularUnitArray = array of TCircularUnit;

implementation

constructor TCircularUnit.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double;
        angle: Double; angularSpeed: Double; radius: Double);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed);

    FRadius := radius;
end;

function TCircularUnit.GetRadius: Double;
begin
    result := FRadius;
end;

destructor TCircularUnit.Destroy;
begin
    inherited;
end;

end.
