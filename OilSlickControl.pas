unit OilSlickControl;

interface

uses
  Math, TypeControl, CircularUnitControl;

type
  TOilSlick = class (TCircularUnit)
  private
    FRemainingLifetime: LongInt;

  public
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double; const radius: Double;
      const remainingLifetime: LongInt);

    function GetRemainingLifetime: LongInt;
    property RemainingLifetime: LongInt read GetRemainingLifetime;

    destructor Destroy; override;

  end;

  TOilSlickArray = array of TOilSlick;

implementation

constructor TOilSlick.Create(const id: Int64; const mass: Double; const x: Double; const y: Double;
  const speedX: Double; const speedY: Double; const angle: Double; const angularSpeed: Double; const radius: Double;
  const remainingLifetime: LongInt);
begin
  inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, radius);

  FRemainingLifetime := remainingLifetime;
end;

function TOilSlick.GetRemainingLifetime: LongInt;
begin
  result := FRemainingLifetime;
end;

destructor TOilSlick.Destroy;
begin
  inherited;
end;

end.
