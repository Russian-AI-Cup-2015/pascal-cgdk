unit UnitControl;

interface

uses
  Math, TypeControl;

type
  TUnit = class
  private
    FId: Int64;
    FMass: Double;
    FX: Double;
    FY: Double;
    FSpeedX: Double;
    FSpeedY: Double;
    FAngle: Double;
    FAngularSpeed: Double;
    function GetId: Int64;
    function GetMass: Double;
    function GetX: Double;
    function GetY: Double;
    function GetSpeedX: Double;
    function GetSpeedY: Double;
    function GetAngle: Double;
    function GetAngularSpeed: Double;
  public
    property Id: Int64 read GetId;
    property Mass: Double read GetMass;
    property X: Double read GetX;
    property Y: Double read GetY;
    property SpeedX: Double read GetSpeedX;
    property SpeedY: Double read GetSpeedY;
    property Angle: Double read GetAngle;
    property AngularSpeed: Double read GetAngularSpeed;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double);
    destructor Destroy; override;
    function GetAngleTo(x: Double; y: Double): Double; overload;
    function GetAngleTo(otherUnit: TUnit): Double; overload;
    function GetDistanceTo(x: Double; y: Double): Double; overload;
    function GetDistanceTo(otherUnit: TUnit): Double; overload;
  end;

  TUnitArray = array of TUnit;

implementation

function TUnit.GetId: Int64;
begin
  Result := FId;
end;

function TUnit.GetMass: Double;
begin
  Result := FMass;
end;

function TUnit.GetX: Double;
begin
  Result := FX;
end;

function TUnit.GetY: Double;
begin
  Result := FY;
end;

function TUnit.GetSpeedX: Double;
begin
  Result := FSpeedX;
end;

function TUnit.GetSpeedY: Double;
begin
  Result := FSpeedY;
end;

function TUnit.GetAngle: Double;
begin
  Result := FAngle;
end;

function TUnit.GetAngularSpeed: Double;
begin
  Result := FAngularSpeed;
end;

constructor TUnit.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double);
begin
  FId := AId;
  FMass := AMass;
  FX := AX;
  FY := AY;
  FSpeedX := ASpeedX;
  FSpeedY := ASpeedY;
  FAngle := AAngle;
  FAngularSpeed := AAngularSpeed;
end;

destructor TUnit.Destroy;
begin
  inherited;
end;

function TUnit.GetAngleTo(x: Double; y: Double): Double;
var
  absoluteAngleTo, relativeAngleTo: Double;

begin
  absoluteAngleTo := ArcTan2(y - FY, x - FX);
  relativeAngleTo := absoluteAngleTo - FAngle;

  while relativeAngleTo > PI do 
  begin
    RelativeAngleTo := relativeAngleTo - 2 * PI;
  end;
  while relativeAngleTo < -PI do 
  begin
    RelativeAngleTo := relativeAngleTo + 2 * PI;
  end;

  Result := relativeAngleTo;
end;

function TUnit.getAngleTo(otherUnit: TUnit): Double;
begin
  Result := GetAngleTo(otherUnit.X, otherUnit.Y);
end;

function TUnit.getDistanceTo(x: Double; y: Double): Double;
begin
  Result := Sqrt(Sqr(FX - x) + Sqr(FY - y));
end;

function TUnit.getDistanceTo(otherUnit: TUnit): Double;
begin
  Result := GetDistanceTo(otherUnit.X, otherUnit.Y);
end;

end.
