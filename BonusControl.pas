unit BonusControl;

interface

uses
    Math, TypeControl, BonusTypeControl, RectangularUnitControl;

type
    TBonus = class (TRectangularUnit)
    private
        FType: TBonusType;

    public
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; width: Double; height: Double; bonusType: TBonusType);

        function GetType: TBonusType;

        destructor Destroy; override;

    end;

    TBonusArray = array of TBonus;

implementation

constructor TBonus.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
        angularSpeed: Double; width: Double; height: Double; bonusType: TBonusType);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, width, height);

    FType := bonusType;
end;

function TBonus.GetType: TBonusType;
begin
    result := FType;
end;

destructor TBonus.Destroy;
begin
    inherited;
end;

end.
