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
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double; const height: Double;
      const playerId: Int64; const teammateIndex: LongInt; const teammate: Boolean; const carType: TCarType;
      const projectileCount: LongInt; const nitroChargeCount: LongInt; const oilCanisterCount: LongInt;
      const remainingProjectileCooldownTicks: LongInt; const remainingNitroCooldownTicks: LongInt;
      const remainingOilCooldownTicks: LongInt; const remainingNitroTicks: LongInt; const remainingOiledTicks: LongInt;
      const durability: Double; const enginePower: Double; const wheelTurn: Double; const nextWaypointIndex: LongInt;
      const nextWaypointX: LongInt; const nextWaypointY: LongInt; const finishedTrack: Boolean);

    function GetPlayerId: Int64;
    property PlayerId: Int64 read GetPlayerId;
    function GetTeammateIndex: LongInt;
    property TeammateIndex: LongInt read GetTeammateIndex;
    function GetTeammate: Boolean;
    property IsTeammate: Boolean read GetTeammate;
    function GetType: TCarType;
    property CarType: TCarType read GetType;
    function GetProjectileCount: LongInt;
    property ProjectileCount: LongInt read GetProjectileCount;
    function GetNitroChargeCount: LongInt;
    property NitroChargeCount: LongInt read GetNitroChargeCount;
    function GetOilCanisterCount: LongInt;
    property OilCanisterCount: LongInt read GetOilCanisterCount;
    function GetRemainingProjectileCooldownTicks: LongInt;
    property RemainingProjectileCooldownTicks: LongInt read GetRemainingProjectileCooldownTicks;
    function GetRemainingNitroCooldownTicks: LongInt;
    property RemainingNitroCooldownTicks: LongInt read GetRemainingNitroCooldownTicks;
    function GetRemainingOilCooldownTicks: LongInt;
    property RemainingOilCooldownTicks: LongInt read GetRemainingOilCooldownTicks;
    function GetRemainingNitroTicks: LongInt;
    property RemainingNitroTicks: LongInt read GetRemainingNitroTicks;
    function GetRemainingOiledTicks: LongInt;
    property RemainingOiledTicks: LongInt read GetRemainingOiledTicks;
    function GetDurability: Double;
    property Durability: Double read GetDurability;
    function GetEnginePower: Double;
    property EnginePower: Double read GetEnginePower;
    function GetWheelTurn: Double;
    property WheelTurn: Double read GetWheelTurn;
    function GetNextWaypointIndex: LongInt;
    property NextWaypointIndex: LongInt read GetNextWaypointIndex;
    function GetNextWaypointX: LongInt;
    property NextWaypointX: LongInt read GetNextWaypointX;
    function GetNextWaypointY: LongInt;
    property NextWaypointY: LongInt read GetNextWaypointY;
    function GetFinishedTrack: Boolean;
    property IsFinishedTrack: Boolean read GetFinishedTrack;

    destructor Destroy; override;

  end;

  TCarArray = array of TCar;

implementation

constructor TCar.Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
  const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double; const height: Double;
  const playerId: Int64; const teammateIndex: LongInt; const teammate: Boolean; const carType: TCarType;
  const projectileCount: LongInt; const nitroChargeCount: LongInt; const oilCanisterCount: LongInt;
  const remainingProjectileCooldownTicks: LongInt; const remainingNitroCooldownTicks: LongInt;
  const remainingOilCooldownTicks: LongInt; const remainingNitroTicks: LongInt; const remainingOiledTicks: LongInt;
  const durability: Double; const enginePower: Double; const wheelTurn: Double; const nextWaypointIndex: LongInt;
  const nextWaypointX: LongInt; const nextWaypointY: LongInt; const finishedTrack: Boolean);
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
