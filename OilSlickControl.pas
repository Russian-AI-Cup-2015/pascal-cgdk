unit OilSlickControl;

interface

uses
  Math, TypeControl, CircularUnitControl;

type
  TOilSlick = class(TCircularUnit)
  private
    FRemainingLifetime: LongInt;
    function GetRemainingLifetime: LongInt;
  public
    property RemainingLifetime: LongInt read GetRemainingLifetime; 
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
      const ARadius: Double; const ARemainingLifetime: LongInt);
    destructor Destroy; override;
  end;

  TOilSlickArray = array of TOilSlick;

implementation

function TOilSlick.GetRemainingLifetime: LongInt;
begin
  Result := FRemainingLifetime;
end;

constructor TOilSlick.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
  const ARadius: Double; const ARemainingLifetime: LongInt);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed, ARadius);
  FRemainingLifetime := ARemainingLifetime;
end;

destructor TOilSlick.Destroy;
begin
  inherited;
end;

end.
