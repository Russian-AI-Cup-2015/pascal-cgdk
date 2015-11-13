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
    function GetRandomSeed: Int64;
    function GetTickCount: LongInt;
    function GetWorldWidth: LongInt;
    function GetWorldHeight: LongInt;
    function GetTrackTileSize: Double;
    function GetTrackTileMargin: Double;
    function GetLapCount: LongInt;
    function GetLapTickCount: LongInt;
    function GetInitialFreezeDurationTicks: LongInt;
    function GetBurningTimeDurationFactor: Double;
    function GetFinishTrackScores: TLongIntArray;
    function GetFinishLapScore: LongInt;
    function GetLapWaypointsSummaryScoreFactor: Double;
    function GetCarDamageScoreFactor: Double;
    function GetCarEliminationScore: LongInt;
    function GetCarWidth: Double;
    function GetCarHeight: Double;
    function GetCarEnginePowerChangePerTick: Double;
    function GetCarWheelTurnChangePerTick: Double;
    function GetCarAngularSpeedFactor: Double;
    function GetCarMovementAirFrictionFactor: Double;
    function GetCarRotationAirFrictionFactor: Double;
    function GetCarLengthwiseMovementFrictionFactor: Double;
    function GetCarCrosswiseMovementFrictionFactor: Double;
    function GetCarRotationFrictionFactor: Double;
    function GetThrowProjectileCooldownTicks: LongInt;
    function GetUseNitroCooldownTicks: LongInt;
    function GetSpillOilCooldownTicks: LongInt;
    function GetNitroEnginePowerFactor: Double;
    function GetNitroDurationTicks: LongInt;
    function GetCarReactivationTimeTicks: LongInt;
    function GetBuggyMass: Double;
    function GetBuggyEngineForwardPower: Double;
    function GetBuggyEngineRearPower: Double;
    function GetJeepMass: Double;
    function GetJeepEngineForwardPower: Double;
    function GetJeepEngineRearPower: Double;
    function GetBonusSize: Double;
    function GetBonusMass: Double;
    function GetPureScoreAmount: LongInt;
    function GetWasherRadius: Double;
    function GetWasherMass: Double;
    function GetWasherInitialSpeed: Double;
    function GetWasherDamage: Double;
    function GetSideWasherAngle: Double;
    function GetTireRadius: Double;
    function GetTireMass: Double;
    function GetTireInitialSpeed: Double;
    function GetTireDamageFactor: Double;
    function GetTireDisappearSpeedFactor: Double;
    function GetOilSlickInitialRange: Double;
    function GetOilSlickRadius: Double;
    function GetOilSlickLifetime: LongInt;
    function GetMaxOiledStateDurationTicks: LongInt;
  public
    property RandomSeed: Int64 read GetRandomSeed;
    property TickCount: LongInt read GetTickCount;
    property WorldWidth: LongInt read GetWorldWidth;
    property WorldHeight: LongInt read GetWorldHeight;
    property TrackTileSize: Double read GetTrackTileSize;
    property TrackTileMargin: Double read GetTrackTileMargin;
    property LapCount: LongInt read GetLapCount;
    property LapTickCount: LongInt read GetLapTickCount;
    property InitialFreezeDurationTicks: LongInt read GetInitialFreezeDurationTicks;
    property BurningTimeDurationFactor: Double read GetBurningTimeDurationFactor;
    property FinishTrackScores: TLongIntArray read GetFinishTrackScores;
    property FinishLapScore: LongInt read GetFinishLapScore;
    property LapWaypointsSummaryScoreFactor: Double read GetLapWaypointsSummaryScoreFactor;
    property CarDamageScoreFactor: Double read GetCarDamageScoreFactor;
    property CarEliminationScore: LongInt read GetCarEliminationScore;
    property CarWidth: Double read GetCarWidth;
    property CarHeight: Double read GetCarHeight;
    property CarEnginePowerChangePerTick: Double read GetCarEnginePowerChangePerTick;
    property CarWheelTurnChangePerTick: Double read GetCarWheelTurnChangePerTick;
    property CarAngularSpeedFactor: Double read GetCarAngularSpeedFactor;
    property CarMovementAirFrictionFactor: Double read GetCarMovementAirFrictionFactor;
    property CarRotationAirFrictionFactor: Double read GetCarRotationAirFrictionFactor;
    property CarLengthwiseMovementFrictionFactor: Double read GetCarLengthwiseMovementFrictionFactor;
    property CarCrosswiseMovementFrictionFactor: Double read GetCarCrosswiseMovementFrictionFactor;
    property CarRotationFrictionFactor: Double read GetCarRotationFrictionFactor;
    property ThrowProjectileCooldownTicks: LongInt read GetThrowProjectileCooldownTicks;
    property UseNitroCooldownTicks: LongInt read GetUseNitroCooldownTicks;
    property SpillOilCooldownTicks: LongInt read GetSpillOilCooldownTicks;
    property NitroEnginePowerFactor: Double read GetNitroEnginePowerFactor;
    property NitroDurationTicks: LongInt read GetNitroDurationTicks;
    property CarReactivationTimeTicks: LongInt read GetCarReactivationTimeTicks;
    property BuggyMass: Double read GetBuggyMass;
    property BuggyEngineForwardPower: Double read GetBuggyEngineForwardPower;
    property BuggyEngineRearPower: Double read GetBuggyEngineRearPower;
    property JeepMass: Double read GetJeepMass;
    property JeepEngineForwardPower: Double read GetJeepEngineForwardPower;
    property JeepEngineRearPower: Double read GetJeepEngineRearPower;
    property BonusSize: Double read GetBonusSize;
    property BonusMass: Double read GetBonusMass;
    property PureScoreAmount: LongInt read GetPureScoreAmount;
    property WasherRadius: Double read GetWasherRadius;
    property WasherMass: Double read GetWasherMass;
    property WasherInitialSpeed: Double read GetWasherInitialSpeed;
    property WasherDamage: Double read GetWasherDamage;
    property SideWasherAngle: Double read GetSideWasherAngle;
    property TireRadius: Double read GetTireRadius;
    property TireMass: Double read GetTireMass;
    property TireInitialSpeed: Double read GetTireInitialSpeed;
    property TireDamageFactor: Double read GetTireDamageFactor;
    property TireDisappearSpeedFactor: Double read GetTireDisappearSpeedFactor;
    property OilSlickInitialRange: Double read GetOilSlickInitialRange;
    property OilSlickRadius: Double read GetOilSlickRadius;
    property OilSlickLifetime: LongInt read GetOilSlickLifetime;
    property MaxOiledStateDurationTicks: LongInt read GetMaxOiledStateDurationTicks;
    constructor Create(const ARandomSeed: Int64; const ATickCount: LongInt; const AWorldWidth: LongInt; 
      const AWorldHeight: LongInt; const ATrackTileSize: Double; const ATrackTileMargin: Double; 
      const ALapCount: LongInt; const AlapTickCount: LongInt; const AInitialFreezeDurationTicks: LongInt; 
      const ABurningTimeDurationFactor: Double; const AFinishTrackScores: TLongIntArray; 
      const AFinishLapScore: LongInt; const ALapWaypointsSummaryScoreFactor: Double;
      const ACarDamageScoreFactor: Double; const ACarEliminationScore: LongInt; const ACarWidth: Double; 
      const ACarHeight: Double; const ACarEnginePowerChangePerTick: Double; 
      const ACarWheelTurnChangePerTick: Double; const ACarAngularSpeedFactor: Double;
      const ACarMovementAirFrictionFactor: Double; const ACarRotationAirFrictionFactor: Double;
      const ACarLengthwiseMovementFrictionFactor: Double; 
      const ACarCrosswiseMovementFrictionFactor: Double; const ACarRotationFrictionFactor: Double; 
      const AThrowProjectileCooldownTicks: LongInt; const AUseNitroCooldownTicks: LongInt; 
      const ASpillOilCooldownTicks: LongInt; const ANitroEnginePowerFactor: Double;
      const ANitroDurationTicks: LongInt; const ACarReactivationTimeTicks: LongInt; 
      const ABuggyMass: Double; const ABuggyEngineForwardPower: Double; 
      const ABuggyEngineRearPower: Double; const AJeepMass: Double; 
      const AJeepEngineForwardPower: Double; const AJeepEngineRearPower: Double; 
      const ABonusSize: Double; const ABonusMass: Double; const APureScoreAmount: LongInt; 
      const AWasherRadius: Double; const AWasherMass: Double; const AWasherInitialSpeed: Double;
      const AWasherDamage: Double; const ASideWasherAngle: Double; const ATireRadius: Double; 
      const ATireMass: Double; const ATireInitialSpeed: Double; const ATireDamageFactor: Double; 
      const ATireDisappearSpeedFactor: Double; const AOilSlickInitialRange: Double; 
      const AOilSlickRadius: Double; const AOilSlickLifetime: LongInt;
      const AMaxOiledStateDurationTicks: LongInt);
    destructor Destroy; override;
  end;

  TGameArray = array of TGame;

implementation

function TGame.GetRandomSeed: Int64;
begin
  Result := FRandomSeed;
end;

function TGame.GetTickCount: LongInt;
begin
  Result := FTickCount;
end;

function TGame.GetWorldWidth: LongInt;
begin
  Result := FWorldWidth;
end;

function TGame.GetWorldHeight: LongInt;
begin
  Result := FWorldHeight;
end;

function TGame.GetTrackTileSize: Double;
begin
  Result := FTrackTileSize;
end;

function TGame.GetTrackTileMargin: Double;
begin
  Result := FTrackTileMargin;
end;

function TGame.GetLapCount: LongInt;
begin
  Result := FLapCount;
end;

function TGame.GetLapTickCount: LongInt;
begin
  Result := FLapTickCount;
end;

function TGame.GetInitialFreezeDurationTicks: LongInt;
begin
  Result := FInitialFreezeDurationTicks;
end;

function TGame.GetBurningTimeDurationFactor: Double;
begin
  Result := FBurningTimeDurationFactor;
end;

function TGame.GetFinishTrackScores: TLongIntArray;
begin
  if Assigned(FFinishTrackScores) then
    Result := Copy(FFinishTrackScores, 0, Length(FFinishTrackScores))
  else  
    Result := nil;
end;

function TGame.GetFinishLapScore: LongInt;
begin
  Result := FFinishLapScore;
end;

function TGame.GetLapWaypointsSummaryScoreFactor: Double;
begin
  Result := FLapWaypointsSummaryScoreFactor;
end;

function TGame.GetCarDamageScoreFactor: Double;
begin
  Result := FCarDamageScoreFactor;
end;

function TGame.GetCarEliminationScore: LongInt;
begin
  Result := FCarEliminationScore;
end;

function TGame.GetCarWidth: Double;
begin
  Result := FCarWidth;
end;

function TGame.GetCarHeight: Double;
begin
  Result := FCarHeight;
end;

function TGame.GetCarEnginePowerChangePerTick: Double;
begin
  Result := FCarEnginePowerChangePerTick;
end;

function TGame.GetCarWheelTurnChangePerTick: Double;
begin
  Result := FCarWheelTurnChangePerTick;
end;

function TGame.GetCarAngularSpeedFactor: Double;
begin
  Result := FCarAngularSpeedFactor;
end;

function TGame.GetCarMovementAirFrictionFactor: Double;
begin
  Result := FCarMovementAirFrictionFactor;
end;

function TGame.GetCarRotationAirFrictionFactor: Double;
begin
  Result := FCarRotationAirFrictionFactor;
end;

function TGame.GetCarLengthwiseMovementFrictionFactor: Double;
begin
  Result := FCarLengthwiseMovementFrictionFactor;
end;

function TGame.GetCarCrosswiseMovementFrictionFactor: Double;
begin
  Result := FCarCrosswiseMovementFrictionFactor;
end;

function TGame.GetCarRotationFrictionFactor: Double;
begin
  Result := FCarRotationFrictionFactor;
end;

function TGame.GetThrowProjectileCooldownTicks: LongInt;
begin
  Result := FThrowProjectileCooldownTicks;
end;

function TGame.GetUseNitroCooldownTicks: LongInt;
begin
  Result := FUseNitroCooldownTicks;
end;

function TGame.GetSpillOilCooldownTicks: LongInt;
begin
  Result := FSpillOilCooldownTicks;
end;

function TGame.GetNitroEnginePowerFactor: Double;
begin
  Result := FNitroEnginePowerFactor;
end;

function TGame.GetNitroDurationTicks: LongInt;
begin
  Result := FNitroDurationTicks;
end;

function TGame.GetCarReactivationTimeTicks: LongInt;
begin
  Result := FCarReactivationTimeTicks;
end;

function TGame.GetBuggyMass: Double;
begin
  Result := FBuggyMass;
end;

function TGame.GetBuggyEngineForwardPower: Double;
begin
  Result := FBuggyEngineForwardPower;
end;

function TGame.GetBuggyEngineRearPower: Double;
begin
  Result := FBuggyEngineRearPower;
end;

function TGame.GetJeepMass: Double;
begin
  Result := FJeepMass;
end;

function TGame.GetJeepEngineForwardPower: Double;
begin
  Result := FJeepEngineForwardPower;
end;

function TGame.GetJeepEngineRearPower: Double;
begin
  Result := FJeepEngineRearPower;
end;

function TGame.GetBonusSize: Double;
begin
  Result := FBonusSize;
end;

function TGame.GetBonusMass: Double;
begin
  Result := FBonusMass;
end;

function TGame.GetPureScoreAmount: LongInt;
begin
  Result := FPureScoreAmount;
end;

function TGame.GetWasherRadius: Double;
begin
  Result := FWasherRadius;
end;

function TGame.GetWasherMass: Double;
begin
  Result := FWasherMass;
end;

function TGame.GetWasherInitialSpeed: Double;
begin
  Result := FWasherInitialSpeed;
end;

function TGame.GetWasherDamage: Double;
begin
  Result := FWasherDamage;
end;

function TGame.GetSideWasherAngle: Double;
begin
  Result := FSideWasherAngle;
end;

function TGame.GetTireRadius: Double;
begin
  Result := FTireRadius;
end;

function TGame.GetTireMass: Double;
begin
  Result := FTireMass;
end;

function TGame.GetTireInitialSpeed: Double;
begin
  Result := FTireInitialSpeed;
end;

function TGame.GetTireDamageFactor: Double;
begin
  Result := FTireDamageFactor;
end;

function TGame.GetTireDisappearSpeedFactor: Double;
begin
  Result := FTireDisappearSpeedFactor;
end;

function TGame.GetOilSlickInitialRange: Double;
begin
  Result := FOilSlickInitialRange;
end;

function TGame.GetOilSlickRadius: Double;
begin
  Result := FOilSlickRadius;
end;

function TGame.GetOilSlickLifetime: LongInt;
begin
  Result := FOilSlickLifetime;
end;

function TGame.GetMaxOiledStateDurationTicks: LongInt;
begin
  Result := FMaxOiledStateDurationTicks;
end;

constructor TGame.Create(const ARandomSeed: Int64; const ATickCount: LongInt; const AWorldWidth: LongInt; 
  const AWorldHeight: LongInt; const ATrackTileSize: Double; const ATrackTileMargin: Double; 
  const ALapCount: LongInt; const AlapTickCount: LongInt; const AInitialFreezeDurationTicks: LongInt; 
  const ABurningTimeDurationFactor: Double; const AFinishTrackScores: TLongIntArray; 
  const AFinishLapScore: LongInt; const ALapWaypointsSummaryScoreFactor: Double;
  const ACarDamageScoreFactor: Double; const ACarEliminationScore: LongInt; const ACarWidth: Double; 
  const ACarHeight: Double; const ACarEnginePowerChangePerTick: Double; 
  const ACarWheelTurnChangePerTick: Double; const ACarAngularSpeedFactor: Double;
  const ACarMovementAirFrictionFactor: Double; const ACarRotationAirFrictionFactor: Double;
  const ACarLengthwiseMovementFrictionFactor: Double; 
  const ACarCrosswiseMovementFrictionFactor: Double; const ACarRotationFrictionFactor: Double; 
  const AThrowProjectileCooldownTicks: LongInt; const AUseNitroCooldownTicks: LongInt; 
  const ASpillOilCooldownTicks: LongInt; const ANitroEnginePowerFactor: Double;
  const ANitroDurationTicks: LongInt; const ACarReactivationTimeTicks: LongInt; 
  const ABuggyMass: Double; const ABuggyEngineForwardPower: Double; 
  const ABuggyEngineRearPower: Double; const AJeepMass: Double; 
  const AJeepEngineForwardPower: Double; const AJeepEngineRearPower: Double; 
  const ABonusSize: Double; const ABonusMass: Double; const APureScoreAmount: LongInt; 
  const AWasherRadius: Double; const AWasherMass: Double; const AWasherInitialSpeed: Double;
  const AWasherDamage: Double; const ASideWasherAngle: Double; const ATireRadius: Double; 
  const ATireMass: Double; const ATireInitialSpeed: Double; const ATireDamageFactor: Double; 
  const ATireDisappearSpeedFactor: Double; const AOilSlickInitialRange: Double; 
  const AOilSlickRadius: Double; const AOilSlickLifetime: LongInt;
  const AMaxOiledStateDurationTicks: LongInt);
begin
  FRandomSeed := ARandomSeed;
  FTickCount := ATickCount;
  FWorldWidth := AWorldWidth;
  FWorldHeight := AWorldHeight;
  FTrackTileSize := ATrackTileSize;
  FTrackTileMargin := ATrackTileMargin;
  FLapCount := ALapCount;
  FLapTickCount := ALapTickCount;
  FInitialFreezeDurationTicks := AInitialFreezeDurationTicks;
  FBurningTimeDurationFactor := ABurningTimeDurationFactor;
  if Assigned(AFinishTrackScores) then
    FFinishTrackScores := Copy(AFinishTrackScores, 0, Length(AFinishTrackScores))
  else  
    FFinishTrackScores := nil;
  FFinishLapScore := AFinishLapScore;
  FLapWaypointsSummaryScoreFactor := AlapWaypointsSummaryScoreFactor;
  FCarDamageScoreFactor := ACarDamageScoreFactor;
  FCarEliminationScore := ACarEliminationScore;
  FCarWidth := ACarWidth;
  FCarHeight := AcarHeight;
  FCarEnginePowerChangePerTick := ACarEnginePowerChangePerTick;
  FCarWheelTurnChangePerTick := ACarWheelTurnChangePerTick;
  FCarAngularSpeedFactor := AcarAngularSpeedFactor;
  FCarMovementAirFrictionFactor := ACarMovementAirFrictionFactor;
  FCarRotationAirFrictionFactor := ACarRotationAirFrictionFactor;
  FCarLengthwiseMovementFrictionFactor := ACarLengthwiseMovementFrictionFactor;
  FCarCrosswiseMovementFrictionFactor := ACarCrosswiseMovementFrictionFactor;
  FCarRotationFrictionFactor := ACarRotationFrictionFactor;
  FThrowProjectileCooldownTicks := AThrowProjectileCooldownTicks;
  FUseNitroCooldownTicks := AUseNitroCooldownTicks;
  FSpillOilCooldownTicks := ASpillOilCooldownTicks;
  FNitroEnginePowerFactor := ANitroEnginePowerFactor;
  FNitroDurationTicks := ANitroDurationTicks;
  FCarReactivationTimeTicks := ACarReactivationTimeTicks;
  FBuggyMass := ABuggyMass;
  FBuggyEngineForwardPower := ABuggyEngineForwardPower;
  FBuggyEngineRearPower := ABuggyEngineRearPower;
  FJeepMass := AJeepMass;
  FJeepEngineForwardPower := AJeepEngineForwardPower;
  FJeepEngineRearPower := AJeepEngineRearPower;
  FBonusSize := ABonusSize;
  FBonusMass := AbonusMass;
  FPureScoreAmount := APureScoreAmount;
  FWasherRadius := AWasherRadius;
  FWasherMass := AWasherMass;
  FWasherInitialSpeed := AWasherInitialSpeed;
  FWasherDamage := AWasherDamage;
  FSideWasherAngle := ASideWasherAngle;
  FTireRadius := ATireRadius;
  FTireMass := ATireMass;
  FTireInitialSpeed := ATireInitialSpeed;
  FTireDamageFactor := ATireDamageFactor;
  FTireDisappearSpeedFactor := ATireDisappearSpeedFactor;
  FOilSlickInitialRange := AOilSlickInitialRange;
  FOilSlickRadius := AOilSlickRadius;
  FOilSlickLifetime := AOilSlickLifetime;
  FMaxOiledStateDurationTicks := AMaxOiledStateDurationTicks;
end;

destructor TGame.Destroy;
begin
  inherited;
end;

end.
