unit StrategyControl;

interface

uses
  CarControl, WorldControl, GameControl, MoveControl;

type
  TStrategy = class
  public
    constructor Create; virtual;
    procedure Move(me: TCar; world: TWorld; game: TGame; move: TMove); virtual; abstract;

  end;

implementation

constructor TStrategy.Create;
begin
  inherited Create;
end;

end.
