unit GameControl;

interface

uses
  Math, TypeControl;

type
  TGame = class
  private
    FRandomSeed: Int64;
    FTickCount: LongInt;
    FWorldWidth: LongInt;
    FWorldHeight: LongInt;
    FTrackTileSize: Double;
    FTrackTileMargin: Double;
    FLapCount: LongInt;
    FLapTickCount: LongInt;
    FInitialFreezeDurationTicks: LongInt;
    FBurningTimeDurationFactor: Double;
    FFinishTrackScores: TLongIntArray;
    FFinishLapScore: LongInt;
    FLapWaypointsSummaryScoreFactor: Double;
    FCarDamageScoreFactor: Double;
    FCarEliminationScore: LongInt;
    FCarWidth: Double;
    FCarHeight: Double;
    FCarEnginePowerChangePerTick: Double;
    FCarWheelTurnChangePerTick: Double;
    FCarAngularSpeedFactor: Double;
    FCarMovementAirFrictionFactor: Double;
    FCarRotationAirFrictionFactor: Double;
    FCarLengthwiseMovementFrictionFactor: Double;
    FCarCrosswiseMovementFrictionFactor: Double;
    FCarRotationFrictionFactor: Double;
    FThrowProjectileCooldownTicks: LongInt;
    FUseNitroCooldownTicks: LongInt;
    FSpillOilCooldownTicks: LongInt;
    FNitroEnginePowerFactor: Double;
    FNitroDurationTicks: LongInt;
    FCarReactivationTimeTicks: LongInt;
    FBuggyMass: Double;
    FBuggyEngineForwardPower: Double;
    FBuggyEngineRearPower: Double;
    FJeepMass: Double;
    FJeepEngineForwardPower: Double;
    FJeepEngineRearPower: Double;
    FBonusSize: Double;
    FBonusMass: Double;
    FPureScoreAmount: LongInt;
    FWasherRadius: Double;
    FWasherMass: Double;
    FWasherInitialSpeed: Double;
    FWasherDamage: Double;
    FSideWasherAngle: Double;
    FTireRadius: Double;
    FTireMass: Double;
    FTireInitialSpeed: Double;
    FTireDamageFactor: Double;
    FTireDisappearSpeedFactor: Double;
    FOilSlickInitialRange: Double;
    FOilSlickRadius: Double;
    FOilSlickLifetime: LongInt;
    FMaxOiledStateDurationTicks: LongInt;

  public
    constructor Create(const randomSeed: Int64; const tickCount: LongInt; const worldWidth: LongInt;
      const worldHeight: LongInt; const trackTileSize: Double; const trackTileMargin: Double; const lapCount: LongInt;
      const lapTickCount: LongInt; const initialFreezeDurationTicks: LongInt; const burningTimeDurationFactor: Double;
      const finishTrackScores: TLongIntArray; const finishLapScore: LongInt;
      const lapWaypointsSummaryScoreFactor: Double; const carDamageScoreFactor: Double;
      const carEliminationScore: LongInt; const carWidth: Double; const carHeight: Double;
      const carEnginePowerChangePerTick: Double; const carWheelTurnChangePerTick: Double;
      const carAngularSpeedFactor: Double; const carMovementAirFrictionFactor: Double;
      const carRotationAirFrictionFactor: Double; const carLengthwiseMovementFrictionFactor: Double;
      const carCrosswiseMovementFrictionFactor: Double; const carRotationFrictionFactor: Double;
      const throwProjectileCooldownTicks: LongInt; const useNitroCooldownTicks: LongInt;
      const spillOilCooldownTicks: LongInt; const nitroEnginePowerFactor: Double; const nitroDurationTicks: LongInt;
      const carReactivationTimeTicks: LongInt; const buggyMass: Double; const buggyEngineForwardPower: Double;
      const buggyEngineRearPower: Double; const jeepMass: Double; const jeepEngineForwardPower: Double;
      const jeepEngineRearPower: Double; const bonusSize: Double; const bonusMass: Double;
      const pureScoreAmount: LongInt; const washerRadius: Double; const washerMass: Double;
      const washerInitialSpeed: Double; const washerDamage: Double; const sideWasherAngle: Double;
      const tireRadius: Double; const tireMass: Double; const tireInitialSpeed: Double; const tireDamageFactor: Double;
      const tireDisappearSpeedFactor: Double; const oilSlickInitialRange: Double; const oilSlickRadius: Double;
      const oilSlickLifetime: LongInt; const maxOiledStateDurationTicks: LongInt);

    function GetRandomSeed: Int64;
    property RandomSeed: Int64 read GetRandomSeed;
    function GetTickCount: LongInt;
    property TickCount: LongInt read GetTickCount;
    function GetWorldWidth: LongInt;
    property WorldWidth: LongInt read GetWorldWidth;
    function GetWorldHeight: LongInt;
    property WorldHeight: LongInt read GetWorldHeight;
    function GetTrackTileSize: Double;
    property TrackTileSize: Double read GetTrackTileSize;
    function GetTrackTileMargin: Double;
    property TrackTileMargin: Double read GetTrackTileMargin;
    function GetLapCount: LongInt;
    property LapCount: LongInt read GetLapCount;
    function GetLapTickCount: LongInt;
    property LapTickCount: LongInt read GetLapTickCount;
    function GetInitialFreezeDurationTicks: LongInt;
    property InitialFreezeDurationTicks: LongInt read GetInitialFreezeDurationTicks;
    function GetBurningTimeDurationFactor: Double;
    property BurningTimeDurationFactor: Double read GetBurningTimeDurationFactor;
    function GetFinishTrackScores: TLongIntArray;
    property FinishTrackScores: TLongIntArray read GetFinishTrackScores;
    function GetFinishLapScore: LongInt;
    property FinishLapScore: LongInt read GetFinishLapScore;
    function GetLapWaypointsSummaryScoreFactor: Double;
    property LapWaypointsSummaryScoreFactor: Double read GetLapWaypointsSummaryScoreFactor;
    function GetCarDamageScoreFactor: Double;
    property CarDamageScoreFactor: Double read GetCarDamageScoreFactor;
    function GetCarEliminationScore: LongInt;
    property CarEliminationScore: LongInt read GetCarEliminationScore;
    function GetCarWidth: Double;
    property CarWidth: Double read GetCarWidth;
    function GetCarHeight: Double;
    property CarHeight: Double read GetCarHeight;
    function GetCarEnginePowerChangePerTick: Double;
    property CarEnginePowerChangePerTick: Double read GetCarEnginePowerChangePerTick;
    function GetCarWheelTurnChangePerTick: Double;
    property CarWheelTurnChangePerTick: Double read GetCarWheelTurnChangePerTick;
    function GetCarAngularSpeedFactor: Double;
    property CarAngularSpeedFactor: Double read GetCarAngularSpeedFactor;
    function GetCarMovementAirFrictionFactor: Double;
    property CarMovementAirFrictionFactor: Double read GetCarMovementAirFrictionFactor;
    function GetCarRotationAirFrictionFactor: Double;
    property CarRotationAirFrictionFactor: Double read GetCarRotationAirFrictionFactor;
    function GetCarLengthwiseMovementFrictionFactor: Double;
    property CarLengthwiseMovementFrictionFactor: Double read GetCarLengthwiseMovementFrictionFactor;
    function GetCarCrosswiseMovementFrictionFactor: Double;
    property CarCrosswiseMovementFrictionFactor: Double read GetCarCrosswiseMovementFrictionFactor;
    function GetCarRotationFrictionFactor: Double;
    property CarRotationFrictionFactor: Double read GetCarRotationFrictionFactor;
    function GetThrowProjectileCooldownTicks: LongInt;
    property ThrowProjectileCooldownTicks: LongInt read GetThrowProjectileCooldownTicks;
    function GetUseNitroCooldownTicks: LongInt;
    property UseNitroCooldownTicks: LongInt read GetUseNitroCooldownTicks;
    function GetSpillOilCooldownTicks: LongInt;
    property SpillOilCooldownTicks: LongInt read GetSpillOilCooldownTicks;
    function GetNitroEnginePowerFactor: Double;
    property NitroEnginePowerFactor: Double read GetNitroEnginePowerFactor;
    function GetNitroDurationTicks: LongInt;
    property NitroDurationTicks: LongInt read GetNitroDurationTicks;
    function GetCarReactivationTimeTicks: LongInt;
    property CarReactivationTimeTicks: LongInt read GetCarReactivationTimeTicks;
    function GetBuggyMass: Double;
    property BuggyMass: Double read GetBuggyMass;
    function GetBuggyEngineForwardPower: Double;
    property BuggyEngineForwardPower: Double read GetBuggyEngineForwardPower;
    function GetBuggyEngineRearPower: Double;
    property BuggyEngineRearPower: Double read GetBuggyEngineRearPower;
    function GetJeepMass: Double;
    property JeepMass: Double read GetJeepMass;
    function GetJeepEngineForwardPower: Double;
    property JeepEngineForwardPower: Double read GetJeepEngineForwardPower;
    function GetJeepEngineRearPower: Double;
    property JeepEngineRearPower: Double read GetJeepEngineRearPower;
    function GetBonusSize: Double;
    property BonusSize: Double read GetBonusSize;
    function GetBonusMass: Double;
    property BonusMass: Double read GetBonusMass;
    function GetPureScoreAmount: LongInt;
    property PureScoreAmount: LongInt read GetPureScoreAmount;
    function GetWasherRadius: Double;
    property WasherRadius: Double read GetWasherRadius;
    function GetWasherMass: Double;
    property WasherMass: Double read GetWasherMass;
    function GetWasherInitialSpeed: Double;
    property WasherInitialSpeed: Double read GetWasherInitialSpeed;
    function GetWasherDamage: Double;
    property WasherDamage: Double read GetWasherDamage;
    function GetSideWasherAngle: Double;
    property SideWasherAngle: Double read GetSideWasherAngle;
    function GetTireRadius: Double;
    property TireRadius: Double read GetTireRadius;
    function GetTireMass: Double;
    property TireMass: Double read GetTireMass;
    function GetTireInitialSpeed: Double;
    property TireInitialSpeed: Double read GetTireInitialSpeed;
    function GetTireDamageFactor: Double;
    property TireDamageFactor: Double read GetTireDamageFactor;
    function GetTireDisappearSpeedFactor: Double;
    property TireDisappearSpeedFactor: Double read GetTireDisappearSpeedFactor;
    function GetOilSlickInitialRange: Double;
    property OilSlickInitialRange: Double read GetOilSlickInitialRange;
    function GetOilSlickRadius: Double;
    property OilSlickRadius: Double read GetOilSlickRadius;
    function GetOilSlickLifetime: LongInt;
    property OilSlickLifetime: LongInt read GetOilSlickLifetime;
    function GetMaxOiledStateDurationTicks: LongInt;
    property MaxOiledStateDurationTicks: LongInt read GetMaxOiledStateDurationTicks;

    destructor Destroy; override;

  end;

  TGameArray = array of TGame;

implementation

constructor TGame.Create(const randomSeed: Int64; const tickCount: LongInt; const worldWidth: LongInt;
  const worldHeight: LongInt; const trackTileSize: Double; const trackTileMargin: Double; const lapCount: LongInt;
  const lapTickCount: LongInt; const initialFreezeDurationTicks: LongInt; const burningTimeDurationFactor: Double;
  const finishTrackScores: TLongIntArray; const finishLapScore: LongInt; const lapWaypointsSummaryScoreFactor: Double;
  const carDamageScoreFactor: Double; const carEliminationScore: LongInt; const carWidth: Double;
  const carHeight: Double; const carEnginePowerChangePerTick: Double; const carWheelTurnChangePerTick: Double;
  const carAngularSpeedFactor: Double; const carMovementAirFrictionFactor: Double;
  const carRotationAirFrictionFactor: Double; const carLengthwiseMovementFrictionFactor: Double;
  const carCrosswiseMovementFrictionFactor: Double; const carRotationFrictionFactor: Double;
  const throwProjectileCooldownTicks: LongInt; const useNitroCooldownTicks: LongInt;
  const spillOilCooldownTicks: LongInt; const nitroEnginePowerFactor: Double; const nitroDurationTicks: LongInt;
  const carReactivationTimeTicks: LongInt; const buggyMass: Double; const buggyEngineForwardPower: Double;
  const buggyEngineRearPower: Double; const jeepMass: Double; const jeepEngineForwardPower: Double;
  const jeepEngineRearPower: Double; const bonusSize: Double; const bonusMass: Double; const pureScoreAmount: LongInt;
  const washerRadius: Double; const washerMass: Double; const washerInitialSpeed: Double; const washerDamage: Double;
  const sideWasherAngle: Double; const tireRadius: Double; const tireMass: Double; const tireInitialSpeed: Double;
  const tireDamageFactor: Double; const tireDisappearSpeedFactor: Double; const oilSlickInitialRange: Double;
  const oilSlickRadius: Double; const oilSlickLifetime: LongInt; const maxOiledStateDurationTicks: LongInt);
begin
  FRandomSeed := randomSeed;
  FTickCount := tickCount;
  FWorldWidth := worldWidth;
  FWorldHeight := worldHeight;
  FTrackTileSize := trackTileSize;
  FTrackTileMargin := trackTileMargin;
  FLapCount := lapCount;
  FLapTickCount := lapTickCount;
  FInitialFreezeDurationTicks := initialFreezeDurationTicks;
  FBurningTimeDurationFactor := burningTimeDurationFactor;
  if Assigned(finishTrackScores) then begin
    FFinishTrackScores := Copy(finishTrackScores, 0, Length(finishTrackScores));
  end else begin
    FFinishTrackScores := nil;
  end;
  FFinishLapScore := finishLapScore;
  FLapWaypointsSummaryScoreFactor := lapWaypointsSummaryScoreFactor;
  FCarDamageScoreFactor := carDamageScoreFactor;
  FCarEliminationScore := carEliminationScore;
  FCarWidth := carWidth;
  FCarHeight := carHeight;
  FCarEnginePowerChangePerTick := carEnginePowerChangePerTick;
  FCarWheelTurnChangePerTick := carWheelTurnChangePerTick;
  FCarAngularSpeedFactor := carAngularSpeedFactor;
  FCarMovementAirFrictionFactor := carMovementAirFrictionFactor;
  FCarRotationAirFrictionFactor := carRotationAirFrictionFactor;
  FCarLengthwiseMovementFrictionFactor := carLengthwiseMovementFrictionFactor;
  FCarCrosswiseMovementFrictionFactor := carCrosswiseMovementFrictionFactor;
  FCarRotationFrictionFactor := carRotationFrictionFactor;
  FThrowProjectileCooldownTicks := throwProjectileCooldownTicks;
  FUseNitroCooldownTicks := useNitroCooldownTicks;
  FSpillOilCooldownTicks := spillOilCooldownTicks;
  FNitroEnginePowerFactor := nitroEnginePowerFactor;
  FNitroDurationTicks := nitroDurationTicks;
  FCarReactivationTimeTicks := carReactivationTimeTicks;
  FBuggyMass := buggyMass;
  FBuggyEngineForwardPower := buggyEngineForwardPower;
  FBuggyEngineRearPower := buggyEngineRearPower;
  FJeepMass := jeepMass;
  FJeepEngineForwardPower := jeepEngineForwardPower;
  FJeepEngineRearPower := jeepEngineRearPower;
  FBonusSize := bonusSize;
  FBonusMass := bonusMass;
  FPureScoreAmount := pureScoreAmount;
  FWasherRadius := washerRadius;
  FWasherMass := washerMass;
  FWasherInitialSpeed := washerInitialSpeed;
  FWasherDamage := washerDamage;
  FSideWasherAngle := sideWasherAngle;
  FTireRadius := tireRadius;
  FTireMass := tireMass;
  FTireInitialSpeed := tireInitialSpeed;
  FTireDamageFactor := tireDamageFactor;
  FTireDisappearSpeedFactor := tireDisappearSpeedFactor;
  FOilSlickInitialRange := oilSlickInitialRange;
  FOilSlickRadius := oilSlickRadius;
  FOilSlickLifetime := oilSlickLifetime;
  FMaxOiledStateDurationTicks := maxOiledStateDurationTicks;
end;

function TGame.GetRandomSeed: Int64;
begin
  result := FRandomSeed;
end;

function TGame.GetTickCount: LongInt;
begin
  result := FTickCount;
end;

function TGame.GetWorldWidth: LongInt;
begin
  result := FWorldWidth;
end;

function TGame.GetWorldHeight: LongInt;
begin
  result := FWorldHeight;
end;

function TGame.GetTrackTileSize: Double;
begin
  result := FTrackTileSize;
end;

function TGame.GetTrackTileMargin: Double;
begin
  result := FTrackTileMargin;
end;

function TGame.GetLapCount: LongInt;
begin
  result := FLapCount;
end;

function TGame.GetLapTickCount: LongInt;
begin
  result := FLapTickCount;
end;

function TGame.GetInitialFreezeDurationTicks: LongInt;
begin
  result := FInitialFreezeDurationTicks;
end;

function TGame.GetBurningTimeDurationFactor: Double;
begin
  result := FBurningTimeDurationFactor;
end;

function TGame.GetFinishTrackScores: TLongIntArray;
begin
  if Assigned(FFinishTrackScores) then begin
    result := Copy(FFinishTrackScores, 0, Length(FFinishTrackScores));
  end else begin
    result := nil;
  end;
end;

function TGame.GetFinishLapScore: LongInt;
begin
  result := FFinishLapScore;
end;

function TGame.GetLapWaypointsSummaryScoreFactor: Double;
begin
  result := FLapWaypointsSummaryScoreFactor;
end;

function TGame.GetCarDamageScoreFactor: Double;
begin
  result := FCarDamageScoreFactor;
end;

function TGame.GetCarEliminationScore: LongInt;
begin
  result := FCarEliminationScore;
end;

function TGame.GetCarWidth: Double;
begin
  result := FCarWidth;
end;

function TGame.GetCarHeight: Double;
begin
  result := FCarHeight;
end;

function TGame.GetCarEnginePowerChangePerTick: Double;
begin
  result := FCarEnginePowerChangePerTick;
end;

function TGame.GetCarWheelTurnChangePerTick: Double;
begin
  result := FCarWheelTurnChangePerTick;
end;

function TGame.GetCarAngularSpeedFactor: Double;
begin
  result := FCarAngularSpeedFactor;
end;

function TGame.GetCarMovementAirFrictionFactor: Double;
begin
  result := FCarMovementAirFrictionFactor;
end;

function TGame.GetCarRotationAirFrictionFactor: Double;
begin
  result := FCarRotationAirFrictionFactor;
end;

function TGame.GetCarLengthwiseMovementFrictionFactor: Double;
begin
  result := FCarLengthwiseMovementFrictionFactor;
end;

function TGame.GetCarCrosswiseMovementFrictionFactor: Double;
begin
  result := FCarCrosswiseMovementFrictionFactor;
end;

function TGame.GetCarRotationFrictionFactor: Double;
begin
  result := FCarRotationFrictionFactor;
end;

function TGame.GetThrowProjectileCooldownTicks: LongInt;
begin
  result := FThrowProjectileCooldownTicks;
end;

function TGame.GetUseNitroCooldownTicks: LongInt;
begin
  result := FUseNitroCooldownTicks;
end;

function TGame.GetSpillOilCooldownTicks: LongInt;
begin
  result := FSpillOilCooldownTicks;
end;

function TGame.GetNitroEnginePowerFactor: Double;
begin
  result := FNitroEnginePowerFactor;
end;

function TGame.GetNitroDurationTicks: LongInt;
begin
  result := FNitroDurationTicks;
end;

function TGame.GetCarReactivationTimeTicks: LongInt;
begin
  result := FCarReactivationTimeTicks;
end;

function TGame.GetBuggyMass: Double;
begin
  result := FBuggyMass;
end;

function TGame.GetBuggyEngineForwardPower: Double;
begin
  result := FBuggyEngineForwardPower;
end;

function TGame.GetBuggyEngineRearPower: Double;
begin
  result := FBuggyEngineRearPower;
end;

function TGame.GetJeepMass: Double;
begin
  result := FJeepMass;
end;

function TGame.GetJeepEngineForwardPower: Double;
begin
  result := FJeepEngineForwardPower;
end;

function TGame.GetJeepEngineRearPower: Double;
begin
  result := FJeepEngineRearPower;
end;

function TGame.GetBonusSize: Double;
begin
  result := FBonusSize;
end;

function TGame.GetBonusMass: Double;
begin
  result := FBonusMass;
end;

function TGame.GetPureScoreAmount: LongInt;
begin
  result := FPureScoreAmount;
end;

function TGame.GetWasherRadius: Double;
begin
  result := FWasherRadius;
end;

function TGame.GetWasherMass: Double;
begin
  result := FWasherMass;
end;

function TGame.GetWasherInitialSpeed: Double;
begin
  result := FWasherInitialSpeed;
end;

function TGame.GetWasherDamage: Double;
begin
  result := FWasherDamage;
end;

function TGame.GetSideWasherAngle: Double;
begin
  result := FSideWasherAngle;
end;

function TGame.GetTireRadius: Double;
begin
  result := FTireRadius;
end;

function TGame.GetTireMass: Double;
begin
  result := FTireMass;
end;

function TGame.GetTireInitialSpeed: Double;
begin
  result := FTireInitialSpeed;
end;

function TGame.GetTireDamageFactor: Double;
begin
  result := FTireDamageFactor;
end;

function TGame.GetTireDisappearSpeedFactor: Double;
begin
  result := FTireDisappearSpeedFactor;
end;

function TGame.GetOilSlickInitialRange: Double;
begin
  result := FOilSlickInitialRange;
end;

function TGame.GetOilSlickRadius: Double;
begin
  result := FOilSlickRadius;
end;

function TGame.GetOilSlickLifetime: LongInt;
begin
  result := FOilSlickLifetime;
end;

function TGame.GetMaxOiledStateDurationTicks: LongInt;
begin
  result := FMaxOiledStateDurationTicks;
end;

destructor TGame.Destroy;
begin
  inherited;
end;

end.
