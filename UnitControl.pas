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

  protected
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double);

  public
    function GetId: Int64;
    property Id: Int64 read GetId;
    function GetMass: Double;
    property Mass: Double read GetMass;
    function GetX: Double;
    property X: Double read GetX;
    function GetY: Double;
    property Y: Double read GetY;
    function GetSpeedX: Double;
    property SpeedX: Double read GetSpeedX;
    function GetSpeedY: Double;
    property SpeedY: Double read GetSpeedY;
    function GetAngle: Double;
    property Angle: Double read GetAngle;
    function GetAngularSpeed: Double;
    property AngularSpeed: Double read GetAngularSpeed;

    function GetAngleTo(x: Double; y: Double): Double; overload;
    function GetAngleTo(otherUnit: TUnit): Double; overload;
    function GetDistanceTo(x: Double; y: Double): Double; overload;
    function GetDistanceTo(otherUnit: TUnit): Double; overload;

    destructor Destroy; override;

  end;

  TUnitArray = array of TUnit;

implementation

constructor TUnit.Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
  const speedY: Double; const angle: Double; const angularSpeed: Double);
begin
  FId := id;
  FMass := mass;
  FX := x;
  FY := y;
  FSpeedX := speedX;
  FSpeedY := speedY;
  FAngle := angle;
  FAngularSpeed := angularSpeed;
end;

function TUnit.GetId: Int64;
begin
  result := FId;
end;

function TUnit.GetMass: Double;
begin
  result := FMass;
end;

function TUnit.GetX: Double;
begin
  result := FX;
end;

function TUnit.GetY: Double;
begin
  result := FY;
end;

function TUnit.GetSpeedX: Double;
begin
  result := FSpeedX;
end;

function TUnit.GetSpeedY: Double;
begin
  result := FSpeedY;
end;

function TUnit.GetAngle: Double;
begin
  result := FAngle;
end;

function TUnit.GetAngularSpeed: Double;
begin
  result := FAngularSpeed;
end;

function TUnit.GetAngleTo(x: Double; y: Double): Double;
var
  absoluteAngleTo, relativeAngleTo: Double;

begin
  absoluteAngleTo := ArcTan2(y - FY, x - FX);
  relativeAngleTo := absoluteAngleTo - FAngle;

  while relativeAngleTo > PI do begin
    relativeAngleTo := relativeAngleTo - 2 * PI;
  end;

  while relativeAngleTo < -PI do begin
    relativeAngleTo := relativeAngleTo + 2 * PI;
  end;

  result := relativeAngleTo;
end;

function TUnit.getAngleTo(otherUnit: TUnit): Double;
begin
  result := GetAngleTo(otherUnit.FX, otherUnit.FY);
end;

function TUnit.getDistanceTo(x: Double; y: Double): Double;
begin
  result := Sqrt(Sqr(FX - x) + Sqr(FY - y));
end;

function TUnit.getDistanceTo(otherUnit: TUnit): Double;
begin
  result := GetDistanceTo(otherUnit.FX, otherUnit.FY);
end;

destructor TUnit.Destroy;
begin
  inherited;
end;

end.
