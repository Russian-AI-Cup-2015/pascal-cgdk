unit RectangularUnitControl;

interface

uses
    Math, TypeControl, UnitControl;

type
    TRectangularUnit = class (TUnit)
    private
        FWidth: Double;
        FHeight: Double;

    protected
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; width: Double; height: Double);

    public
        function GetWidth: Double;
        function GetHeight: Double;

        destructor Destroy; override;

    end;

    TRectangularUnitArray = array of TRectangularUnit;

implementation

constructor TRectangularUnit.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double;
        angle: Double; angularSpeed: Double; width: Double; height: Double);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed);

    FWidth := width;
    FHeight := height;
end;

function TRectangularUnit.GetWidth: Double;
begin
    result := FWidth;
end;

function TRectangularUnit.GetHeight: Double;
begin
    result := FHeight;
end;

destructor TRectangularUnit.Destroy;
begin
    inherited;
end;

end.
