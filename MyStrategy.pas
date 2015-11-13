unit MyStrategy;

interface

uses
  StrategyControl, BonusControl, BonusTypeControl, CarControl, CarTypeControl, DirectionControl,
  GameControl, MoveControl, OilSlickControl, PlayerControl, ProjectileControl,
  ProjectileTypeControl, TileTypeControl, TypeControl, WorldControl;

type
  TMyStrategy = class(TStrategy)
  public
    procedure Move(const AMe: TCar; const AWorld: TWorld; const AGame: TGame; const AMove: TMove); override;
  end;

implementation

uses
  Math;
    
procedure TMyStrategy.Move(const AMe: TCar; const AWorld: TWorld; const AGame: TGame; const AMove: TMove);
begin
  AMove.EnginePower := 1.0;
  AMove.IsThrowProjectile := True;
  AMove.IsSpillOil := True;

  if AWorld.Tick > AGame.InitialFreezeDurationTicks then 
  begin
    AMove.IsUseNitro := True;
  end;
end;

end.
