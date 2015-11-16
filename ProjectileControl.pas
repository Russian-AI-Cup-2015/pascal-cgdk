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
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double; const radius: Double; const carId: Int64;
      const playerId: Int64; const projectileType: TProjectileType);

    function GetCarId: Int64;
    property CarId: Int64 read GetCarId;
    function GetPlayerId: Int64;
    property PlayerId: Int64 read GetPlayerId;
    function GetType: TProjectileType;
    property ProjectileType: TProjectileType read GetType;

    destructor Destroy; override;

  end;

  TProjectileArray = array of TProjectile;

implementation

constructor TProjectile.Create(const id: Int64; const mass: Double; const x: Double; const y: Double;
  const speedX: Double; const speedY: Double; const angle: Double; const angularSpeed: Double; const radius: Double;
  const carId: Int64; const playerId: Int64; const projectileType: TProjectileType);
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
