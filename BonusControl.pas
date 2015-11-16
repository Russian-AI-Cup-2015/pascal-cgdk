unit BonusControl;

interface

uses
  Math, TypeControl, BonusTypeControl, RectangularUnitControl;

type
  TBonus = class (TRectangularUnit)
  private
    FType: TBonusType;

  public
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double; const height: Double;
      const bonusType: TBonusType);

    function GetType: TBonusType;
    property BonusType: TBonusType read GetType;

    destructor Destroy; override;

  end;

  TBonusArray = array of TBonus;

implementation

constructor TBonus.Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
  const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double; const height: Double;
  const bonusType: TBonusType);
begin
  inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, width, height);

  FType := bonusType;
end;

function TBonus.GetType: TBonusType;
begin
  result := FType;
end;

destructor TBonus.Destroy;
begin
  inherited;
end;

end.
