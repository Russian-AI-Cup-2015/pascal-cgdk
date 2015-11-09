unit ProjectileControl;

interface

uses
    Math, TypeControl, CircularUnitControl, ProjectileTypeControl;

type
    TProjectile = class (TCircularUnit)
    private
        FCarId: Int64;
        FPlayerId: Int64;
        FType: TProjectileType;

    public
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; radius: Double; carId: Int64; playerId: Int64; projectileType: TProjectileType);

        function GetCarId: Int64;
        function GetPlayerId: Int64;
        function GetType: TProjectileType;

        destructor Destroy; override;

    end;

    TProjectileArray = array of TProjectile;

implementation

constructor TProjectile.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double;
        angle: Double; angularSpeed: Double; radius: Double; carId: Int64; playerId: Int64;
        projectileType: TProjectileType);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, radius);

    FCarId := carId;
    FPlayerId := playerId;
    FType := projectileType;
end;

function TProjectile.GetCarId: Int64;
begin
    result := FCarId;
end;

function TProjectile.GetPlayerId: Int64;
begin
    result := FPlayerId;
end;

function TProjectile.GetType: TProjectileType;
begin
    result := FType;
end;

destructor TProjectile.Destroy;
begin
    inherited;
end;

end.
