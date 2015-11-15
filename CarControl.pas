unit CarControl;

interface

uses
    Math, TypeControl, CarTypeControl, RectangularUnitControl;

type
    TCar = class (TRectangularUnit)
    private
        FPlayerId: Int64;
        FTeammateIndex: LongInt;
        FTeammate: Boolean;
        FType: TCarType;
        FProjectileCount: LongInt;
        FNitroChargeCount: LongInt;
        FOilCanisterCount: LongInt;
        FRemainingProjectileCooldownTicks: LongInt;
        FRemainingNitroCooldownTicks: LongInt;
        FRemainingOilCooldownTicks: LongInt;
        FRemainingNitroTicks: LongInt;
        FRemainingOiledTicks: LongInt;
        FDurability: Double;
        FEnginePower: Double;
        FWheelTurn: Double;
        FNextWaypointIndex: LongInt;
        FNextWaypointX: LongInt;
        FNextWaypointY: LongInt;
        FFinishedTrack: Boolean;

    public
        constructor Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
                angularSpeed: Double; width: Double; height: Double; playerId: Int64; teammateIndex: LongInt;
                teammate: Boolean; carType: TCarType; projectileCount: LongInt; nitroChargeCount: LongInt;
                oilCanisterCount: LongInt; remainingProjectileCooldownTicks: LongInt;
                remainingNitroCooldownTicks: LongInt; remainingOilCooldownTicks: LongInt; remainingNitroTicks: LongInt;
                remainingOiledTicks: LongInt; durability: Double; enginePower: Double; wheelTurn: Double;
                nextWaypointIndex: LongInt; nextWaypointX: LongInt; nextWaypointY: LongInt; finishedTrack: Boolean);

        function GetPlayerId: Int64;
        function GetTeammateIndex: LongInt;
        function GetTeammate: Boolean;
        function GetType: TCarType;
        function GetProjectileCount: LongInt;
        function GetNitroChargeCount: LongInt;
        function GetOilCanisterCount: LongInt;
        function GetRemainingProjectileCooldownTicks: LongInt;
        function GetRemainingNitroCooldownTicks: LongInt;
        function GetRemainingOilCooldownTicks: LongInt;
        function GetRemainingNitroTicks: LongInt;
        function GetRemainingOiledTicks: LongInt;
        function GetDurability: Double;
        function GetEnginePower: Double;
        function GetWheelTurn: Double;
        function GetNextWaypointIndex: LongInt;
        function GetNextWaypointX: LongInt;
        function GetNextWaypointY: LongInt;
        function GetFinishedTrack: Boolean;

        destructor Destroy; override;

    end;

    TCarArray = array of TCar;

implementation

constructor TCar.Create(id: Int64; mass: Double; x: Double; y: Double; speedX: Double; speedY: Double; angle: Double;
        angularSpeed: Double; width: Double; height: Double; playerId: Int64; teammateIndex: LongInt; teammate: Boolean;
        carType: TCarType; projectileCount: LongInt; nitroChargeCount: LongInt; oilCanisterCount: LongInt;
        remainingProjectileCooldownTicks: LongInt; remainingNitroCooldownTicks: LongInt;
        remainingOilCooldownTicks: LongInt; remainingNitroTicks: LongInt; remainingOiledTicks: LongInt;
        durability: Double; enginePower: Double; wheelTurn: Double; nextWaypointIndex: LongInt; nextWaypointX: LongInt;
        nextWaypointY: LongInt; finishedTrack: Boolean);
begin
    inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, width, height);

    FPlayerId := playerId;
    FTeammateIndex := teammateIndex;
    FTeammate := teammate;
    FType := carType;
    FProjectileCount := projectileCount;
    FNitroChargeCount := nitroChargeCount;
    FOilCanisterCount := oilCanisterCount;
    FRemainingProjectileCooldownTicks := remainingProjectileCooldownTicks;
    FRemainingNitroCooldownTicks := remainingNitroCooldownTicks;
    FRemainingOilCooldownTicks := remainingOilCooldownTicks;
    FRemainingNitroTicks := remainingNitroTicks;
    FRemainingOiledTicks := remainingOiledTicks;
    FDurability := durability;
    FEnginePower := enginePower;
    FWheelTurn := wheelTurn;
    FNextWaypointIndex := nextWaypointIndex;
    FNextWaypointX := nextWaypointX;
    FNextWaypointY := nextWaypointY;
    FFinishedTrack := finishedTrack;
end;

function TCar.GetPlayerId: Int64;
begin
    result := FPlayerId;
end;

function TCar.GetTeammateIndex: LongInt;
begin
    result := FTeammateIndex;
end;

function TCar.GetTeammate: Boolean;
begin
    result := FTeammate;
end;

function TCar.GetType: TCarType;
begin
    result := FType;
end;

function TCar.GetProjectileCount: LongInt;
begin
    result := FProjectileCount;
end;

function TCar.GetNitroChargeCount: LongInt;
begin
    result := FNitroChargeCount;
end;

function TCar.GetOilCanisterCount: LongInt;
begin
    result := FOilCanisterCount;
end;

function TCar.GetRemainingProjectileCooldownTicks: LongInt;
begin
    result := FRemainingProjectileCooldownTicks;
end;

function TCar.GetRemainingNitroCooldownTicks: LongInt;
begin
    result := FRemainingNitroCooldownTicks;
end;

function TCar.GetRemainingOilCooldownTicks: LongInt;
begin
    result := FRemainingOilCooldownTicks;
end;

function TCar.GetRemainingNitroTicks: LongInt;
begin
    result := FRemainingNitroTicks;
end;

function TCar.GetRemainingOiledTicks: LongInt;
begin
    result := FRemainingOiledTicks;
end;

function TCar.GetDurability: Double;
begin
    result := FDurability;
end;

function TCar.GetEnginePower: Double;
begin
    result := FEnginePower;
end;

function TCar.GetWheelTurn: Double;
begin
    result := FWheelTurn;
end;

function TCar.GetNextWaypointIndex: LongInt;
begin
    result := FNextWaypointIndex;
end;

function TCar.GetNextWaypointX: LongInt;
begin
    result := FNextWaypointX;
end;

function TCar.GetNextWaypointY: LongInt;
begin
    result := FNextWaypointY;
end;

function TCar.GetFinishedTrack: Boolean;
begin
    result := FFinishedTrack;
end;

destructor TCar.Destroy;
begin
    inherited;
end;

end.
