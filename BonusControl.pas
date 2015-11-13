unit BonusControl;

interface

uses
  Math, TypeControl, BonusTypeControl, RectangularUnitControl;

type
  TBonus = class(TRectangularUnit)
  private
    FBonusType: TBonusType;
    function GetBonusType: TBonusType;
  public
    property BonusType: TBonusType read GetBonusType;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double;
      const AAngularSpeed: Double; const AWidth: Double; const AHeight: Double; 
      const ABonusType: TBonusType);
    destructor Destroy; override;
  end;

  TBonusArray = array of TBonus;

implementation

function TBonus.GetBonusType: TBonusType;
begin
  Result := FBonusType;
end;

constructor TBonus.Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
  const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
  const AWidth: Double; const AHeight: Double; const ABonusType: TBonusType);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed, AWidth, AHeight);
  FBonusType := ABonusType;
end;

destructor TBonus.Destroy;
begin
  inherited;
end;

end.
