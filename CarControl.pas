unit CarControl;

interface

uses
  Math, TypeControl, CarTypeControl, RectangularUnitControl;

type
  TCar = class(TRectangularUnit)
  private
    FPlayerId: Int64;
    FTeammateIndex: LongInt;
    FIsTeammate: Boolean;
    FCarType: TCarType;
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
    FNextWaypointX: LongInt;
    FNextWaypointY: LongInt;
    FIsFinishedTrack: Boolean;
    function GetPlayerId: Int64;
    function GetTeammateIndex: LongInt;
    function GetIsTeammate: Boolean;
    function GetCarType: TCarType;
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
    function GetNextWaypointX: LongInt;
    function GetNextWaypointY: LongInt;
    function GetIsFinishedTrack: Boolean;
  public
    property PlayerId: Int64 read GetPlayerId;
    property TeammateIndex: LongInt read GetTeammateIndex;
    property IsTeammate: Boolean read GetIsTeammate;
    property CarType: TCarType read GetCarType;
    property ProjectileCount: LongInt read GetProjectileCount;
    property NitroChargeCount: LongInt read GetNitroChargeCount;
    property OilCanisterCount: LongInt read GetOilCanisterCount;
    property RemainingProjectileCooldownTicks: LongInt read GetRemainingProjectileCooldownTicks;
    property RemainingNitroCooldownTicks: LongInt read GetRemainingNitroCooldownTicks;
    property RemainingOilCooldownTicks: LongInt read GetRemainingOilCooldownTicks;
    property RemainingNitroTicks: LongInt read GetRemainingNitroTicks;
    property RemainingOiledTicks: LongInt read GetRemainingOiledTicks;
    property Durability: Double read GetDurability;
    property EnginePower: Double read GetEnginePower;
    property WheelTurn: Double read GetWheelTurn;
    property NextWaypointX: LongInt read GetNextWaypointX;
    property NextWaypointY: LongInt read GetNextWaypointY;
    property IsFinishedTrack: Boolean read GetIsFinishedTrack;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
      const AWidth: Double; const AHeight: Double; const APlayerId: Int64; const ATeammateIndex: LongInt;
      const AIsTeammate: Boolean; const ACarType: TCarType; const AProjectileCount: LongInt; 
      const ANitroChargeCount: LongInt; const AOilCanisterCount: LongInt; 
      const ARemainingProjectileCooldownTicks: LongInt; const ARemainingNitroCooldownTicks: LongInt; 
      const ARemainingOilCooldownTicks: LongInt; const ARemainingNitroTicks: LongInt;
      const ARemainingOiledTicks: LongInt; const ADurability: Double; const AEnginePower: Double; 
      const AWheelTurn: Double; const ANextWaypointX: LongInt; const ANextWaypointY: LongInt; 
      const AIsFinishedTrack: Boolean);
    destructor Destroy; override;
  end;

  TCarArray = array of TCar;

implementation

function TCar.GetPlayerId: Int64;
begin
  Result := FPlayerId;
end;

function TCar.GetTeammateIndex: LongInt;
begin
  Result := FTeammateIndex;
end;

function TCar.GetIsTeammate: Boolean;
begin
  Result := FIsTeammate;
end;

function TCar.GetCarType: TCarType;
begin
  Result := FCarType;
end;

function TCar.GetProjectileCount: LongInt;
begin
  Result := FProjectileCount;
end;

function TCar.GetNitroChargeCount: LongInt;
begin
  Result := FNitroChargeCount;
end;

function TCar.GetOilCanisterCount: LongInt;
begin
  Result := FOilCanisterCount;
end;

function TCar.GetRemainingProjectileCooldownTicks: LongInt;
begin
  Result := FRemainingProjectileCooldownTicks;
end;

function TCar.GetRemainingNitroCooldownTicks: LongInt;
begin
  Result := FRemainingNitroCooldownTicks;
end;

function TCar.GetRemainingOilCooldownTicks: LongInt;
begin
  Result := FRemainingOilCooldownTicks;
end;

function TCar.GetRemainingNitroTicks: LongInt;
begin
  Result := FRemainingNitroTicks;
end;

function TCar.GetRemainingOiledTicks: LongInt;
begin
  Result := FRemainingOiledTicks;
end;

function TCar.GetDurability: Double;
begin
  Result := FDurability;
end;

function TCar.GetEnginePower: Double;
begin
  Result := FEnginePower;
end;

function TCar.GetWheelTurn: Double;
begin
  Result := FWheelTurn;
end;

function TCar.GetNextWaypointX: LongInt;
begin
  Result := FNextWaypointX;
end;

function TCar.GetNextWaypointY: LongInt;
begin
  Result := FNextWaypointY;
end;

function TCar.GetIsFinishedTrack: Boolean;
begin
  Result := FIsFinishedTrack;
end;

constructor TCar.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
  const AWidth: Double; const AHeight: Double; const APlayerId: Int64; const ATeammateIndex: LongInt;
  const AIsTeammate: Boolean; const ACarType: TCarType; const AProjectileCount: LongInt; 
  const ANitroChargeCount: LongInt; const AOilCanisterCount: LongInt; 
  const ARemainingProjectileCooldownTicks: LongInt; const ARemainingNitroCooldownTicks: LongInt; 
  const ARemainingOilCooldownTicks: LongInt; const ARemainingNitroTicks: LongInt;
  const ARemainingOiledTicks: LongInt; const ADurability: Double; const AEnginePower: Double; 
  const AWheelTurn: Double; const ANextWaypointX: LongInt; const ANextWaypointY: LongInt; 
  const AIsFinishedTrack: Boolean);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed, AWidth, AHeight);
  FPlayerId := APlayerId;
  FTeammateIndex := ATeammateIndex;
  FIsTeammate := AIsTeammate;
  FCarType := ACarType;
  FProjectileCount := AprojectileCount;
  FNitroChargeCount := ANitroChargeCount;
  FOilCanisterCount := AOilCanisterCount;
  FRemainingProjectileCooldownTicks := ARemainingProjectileCooldownTicks;
  FRemainingNitroCooldownTicks := ARemainingNitroCooldownTicks;
  FRemainingOilCooldownTicks := ARemainingOilCooldownTicks;
  FRemainingNitroTicks := ARemainingNitroTicks;
  FRemainingOiledTicks := ARemainingOiledTicks;
  FDurability := ADurability;
  FEnginePower := AEnginePower;
  FWheelTurn := AWheelTurn;
  FNextWaypointX := ANextWaypointX;
  FNextWaypointY := ANextWaypointY;
  FIsFinishedTrack := AIsFinishedTrack;
end;

destructor TCar.Destroy;
begin
  inherited;
end;

end.
