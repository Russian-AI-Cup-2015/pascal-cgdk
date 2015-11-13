unit StrategyControl;

interface

uses
  CarControl, WorldControl, GameControl, MoveControl;

type
  TStrategy = class
  public
    procedure Move(const AMe: TCar; const AWorld: TWorld; const AGame: TGame; const AMove: TMove); virtual; abstract;
  end;

implementation

end.
