unit ProjectileControl;

interface

uses
  Math, TypeControl, CircularUnitControl, ProjectileTypeControl;

type
  TProjectile = class(TCircularUnit)
  private
    FCarId: Int64;
    FPlayerId: Int64;
    FProjectileType: TProjectileType;
    function GetCarId: Int64;
    function GetPlayerId: Int64;
    function GetProjectileType: TProjectileType;
  public
    property CarId: Int64 read GetCarId;
    property PlayerId: Int64 read GetPlayerId;
    property ProjectileType: TProjectileType read GetProjectileType;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
      const ARadius: Double; const ACarId: Int64; const APlayerId: Int64; const 
      AProjectileType: TProjectileType);
    destructor Destroy; override;
  end;

  TProjectileArray = array of TProjectile;

implementation

function TProjectile.GetCarId: Int64;
begin
  Result := FCarId;
end;

function TProjectile.GetPlayerId: Int64;
begin
  Result := FPlayerId;
end;

function TProjectile.GetProjectileType: TProjectileType;
begin
  Result := FProjectileType;
end;

constructor TProjectile.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
  const ARadius: Double; const ACarId: Int64; const APlayerId: Int64; const 
  AProjectileType: TProjectileType);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed, ARadius);
  FCarId := ACarId;
  FPlayerId := APlayerId;
  FProjectileType := AProjectileType;
end;

destructor TProjectile.Destroy;
begin
  inherited;
end;

end.
