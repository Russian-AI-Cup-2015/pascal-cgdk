unit RectangularUnitControl;

interface

uses
  Math, TypeControl, UnitControl;

type
  TRectangularUnit = class (TUnit)
  private
    FWidth: Double;
    FHeight: Double;
    function GetWidth: Double;
    function GetHeight: Double;
  public
    property Width: Double read GetWidth;
    property Height: Double  read GetHeight;
    constructor Create(const AId: Int64; const AMass: Double; const AX: Double; const AY: Double; 
      const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; const AAngularSpeed: Double; 
      const AWidth: Double; const AHeight: Double);
    destructor Destroy; override;
  end;

  TRectangularUnitArray = array of TRectangularUnit;

implementation

function TRectangularUnit.GetWidth: Double;
begin
  Result := FWidth;
end;

function TRectangularUnit.GetHeight: Double;
begin
  Result := FHeight;
end;

constructor TRectangularUnit.Create(const AId: Int64; const AMass: Double; const AX: Double; 
  const AY: Double; const ASpeedX: Double; const ASpeedY: Double; const AAngle: Double; 
  const AAngularSpeed: Double; const AWidth: Double; const AHeight: Double);
begin
  inherited Create(AId, AMass, AX, AY, ASpeedX, ASpeedY, AAngle, AAngularSpeed);
  FWidth := AWidth;
  FHeight := AHeight;
end;

destructor TRectangularUnit.Destroy;
begin
  inherited;
end;

end.
