unit RectangularUnitControl;

interface

uses
  Math, TypeControl, UnitControl;

type
  TRectangularUnit = class (TUnit)
  private
    FWidth: Double;
    FHeight: Double;

  protected
    constructor Create(const id: Int64; const mass: Double; const x: Double; const y: Double; const speedX: Double;
      const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double; const height: Double);

  public
    function GetWidth: Double;
    property Width: Double read GetWidth;
    function GetHeight: Double;
    property Height: Double read GetHeight;

    destructor Destroy; override;

  end;

  TRectangularUnitArray = array of TRectangularUnit;

implementation

constructor TRectangularUnit.Create(const id: Int64; const mass: Double; const x: Double; const y: Double;
  const speedX: Double; const speedY: Double; const angle: Double; const angularSpeed: Double; const width: Double;
  const height: Double);
begin
  inherited Create(id, mass, x, y, speedX, speedY, angle, angularSpeed);

  FWidth := width;
  FHeight := height;
end;

function TRectangularUnit.GetWidth: Double;
begin
  result := FWidth;
end;

function TRectangularUnit.GetHeight: Double;
begin
  result := FHeight;
end;

destructor TRectangularUnit.Destroy;
begin
  inherited;
end;

end.
