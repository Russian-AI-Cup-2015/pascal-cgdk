unit CircularUnitControl;

interface

uses
  Math, TypeControl, UnitControl;

type
  TCircularUnit = class(TUnit)
  private
    FRadius: Double;
    function GetRadius: Double;
  public
    property Radius: Double read GetRadius;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
      const ARadius: Double);
    destructor Destroy; override;
  end;

  TCircularUnitArray = array of TCircularUnit;

implementation

function TCircularUnit.GetRadius: Double;
begin
  Result := FRadius;
end;

constructor TCircularUnit.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
  const ARadius: Double);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed);
  FRadius := ARadius;
end;

destructor TCircularUnit.Destroy;
begin
  inherited;
end;

end.
