unit MoveControl;

interface

uses
  Math, TypeControl;

type
  TMove = class
  private
    FEnginePower: Double;
    FIsBrake: Boolean;
    FWheelTurn: Double;
    FIsThrowProjectile: Boolean;
    FIsUseNitro: Boolean;
    FIsSpillOil: Boolean;
    function GetEnginePower: Double;
    procedure SetEnginePower(Value: Double);
    function GetIsBrake: Boolean;
    procedure SetIsBrake(Value: Boolean);
    function GetWheelTurn: Double;
    procedure SetWheelTurn(Value: Double);
    function GetIsThrowProjectile: Boolean;
    procedure SetIsThrowProjectile(Value: Boolean);
    function GetIsUseNitro: Boolean;
    procedure SetIsUseNitro(Value: Boolean);
    function GetIsSpillOil: Boolean;
    procedure SetIsSpillOil(Value: Boolean);
  public
    property EnginePower: Double read GetEnginePower write SetEnginePower;
    property IsBrake: Boolean read GetIsBrake write SetIsBrake;
    property WheelTurn: Double read GetWheelTurn write SetWheelTurn;
    property IsThrowProjectile: Boolean read GetIsThrowProjectile write SetIsThrowProjectile;
    property IsUseNitro: Boolean read GetIsUseNitro write SetIsUseNitro;
    property IsSpillOil: Boolean read GetIsSpillOil write SetIsSpillOil;
    constructor Create;
    destructor Destroy; override;
  end;

  TMoveArray = array of TMove;

implementation

function TMove.GetEnginePower: Double;
begin
  Result := FEnginePower;
end;

procedure TMove.SetEnginePower(Value: Double);
begin
  FEnginePower := Value;
end;

function TMove.GetIsBrake: Boolean;
begin
  Result := FIsBrake;
end;

procedure TMove.SetIsBrake(Value: Boolean);
begin
    FIsBrake := Value;
end;

function TMove.GetWheelTurn: Double;
begin
  Result := FWheelTurn;
end;

procedure TMove.SetWheelTurn(Value: Double);
begin
  FWheelTurn := wheelTurn;
end;

function TMove.GetIsThrowProjectile: Boolean;
begin
  Result := FIsThrowProjectile;
end;

procedure TMove.SetIsThrowProjectile(Value: Boolean);
begin
  FIsThrowProjectile := Value;
end;

function TMove.GetIsUseNitro: Boolean;
begin
  Result := FisUseNitro;
end;

procedure TMove.SetIsUseNitro(Value: Boolean);
begin
  FIsUseNitro := Value;
end;

function TMove.GetIsSpillOil: Boolean;
begin
  Result := FIsSpillOil;
end;

procedure TMove.SetIsSpillOil(Value: Boolean);
begin
  FIsSpillOil := Value;
end;

constructor TMove.Create;
begin
  FEnginePower := 0.0;
  FIsBrake := False;
  FWheelTurn := 0.0;
  FIsThrowProjectile := False;
  FIsUseNitro := False;
  FIsSpillOil := False;
end;

destructor TMove.Destroy;
begin
  inherited;
end;

end.
