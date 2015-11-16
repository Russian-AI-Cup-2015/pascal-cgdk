unit StrategyControl;

interface

uses
  CarControl, WorldControl, GameControl, MoveControl;

type
  TStrategy = class
  public
    procedure Move(me: TCar; world: TWorld; game: TGame; move: TMove); virtual; abstract;

  end;

implementation

end.
