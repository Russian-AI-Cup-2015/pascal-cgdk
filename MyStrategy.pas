unit MyStrategy;

interface

uses
  StrategyControl, BonusControl, BonusTypeControl, CarControl, CarTypeControl, DirectionControl, GameControl,
  MoveControl, OilSlickControl, PlayerControl, ProjectileControl, ProjectileTypeControl, TileTypeControl, TypeControl,
  WorldControl;

type
  TMyStrategy = class (TStrategy)
  public
    procedure Move(me: TCar; world: TWorld; game: TGame; move: TMove); override;

  end;

implementation

uses
  Math;
    
procedure TMyStrategy.Move(me: TCar; world: TWorld; game: TGame; move: TMove);
begin
  move.SetEnginePower(1.0);
  move.SetThrowProjectile(true);
  move.SetSpillOil(true);

  if (world.GetTick() > game.GetInitialFreezeDurationTicks()) then begin
    move.SetUseNitro(true);
  end;
end;

end.
