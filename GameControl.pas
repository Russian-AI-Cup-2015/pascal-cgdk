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
        constructor Create(randomSeed: Int64; tickCount: LongInt; worldWidth: LongInt; worldHeight: LongInt;
                trackTileSize: Double; trackTileMargin: Double; lapCount: LongInt; lapTickCount: LongInt;
                initialFreezeDurationTicks: LongInt; burningTimeDurationFactor: Double;
                finishTrackScores: TLongIntArray; finishLapScore: LongInt; lapWaypointsSummaryScoreFactor: Double;
                carDamageScoreFactor: Double; carEliminationScore: LongInt; carWidth: Double; carHeight: Double;
                carEnginePowerChangePerTick: Double; carWheelTurnChangePerTick: Double; carAngularSpeedFactor: Double;
                carMovementAirFrictionFactor: Double; carRotationAirFrictionFactor: Double;
                carLengthwiseMovementFrictionFactor: Double; carCrosswiseMovementFrictionFactor: Double;
                carRotationFrictionFactor: Double; throwProjectileCooldownTicks: LongInt;
                useNitroCooldownTicks: LongInt; spillOilCooldownTicks: LongInt; nitroEnginePowerFactor: Double;
                nitroDurationTicks: LongInt; carReactivationTimeTicks: LongInt; buggyMass: Double;
                buggyEngineForwardPower: Double; buggyEngineRearPower: Double; jeepMass: Double;
                jeepEngineForwardPower: Double; jeepEngineRearPower: Double; bonusSize: Double; bonusMass: Double;
                pureScoreAmount: LongInt; washerRadius: Double; washerMass: Double; washerInitialSpeed: Double;
                washerDamage: Double; sideWasherAngle: Double; tireRadius: Double; tireMass: Double;
                tireInitialSpeed: Double; tireDamageFactor: Double; tireDisappearSpeedFactor: Double;
                oilSlickInitialRange: Double; oilSlickRadius: Double; oilSlickLifetime: LongInt;
                maxOiledStateDurationTicks: LongInt);

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

        destructor Destroy; override;

    end;

    TGameArray = array of TGame;

implementation

constructor TGame.Create(randomSeed: Int64; tickCount: LongInt; worldWidth: LongInt; worldHeight: LongInt;
        trackTileSize: Double; trackTileMargin: Double; lapCount: LongInt; lapTickCount: LongInt;
        initialFreezeDurationTicks: LongInt; burningTimeDurationFactor: Double; finishTrackScores: TLongIntArray;
        finishLapScore: LongInt; lapWaypointsSummaryScoreFactor: Double; carDamageScoreFactor: Double;
        carEliminationScore: LongInt; carWidth: Double; carHeight: Double; carEnginePowerChangePerTick: Double;
        carWheelTurnChangePerTick: Double; carAngularSpeedFactor: Double; carMovementAirFrictionFactor: Double;
        carRotationAirFrictionFactor: Double; carLengthwiseMovementFrictionFactor: Double;
        carCrosswiseMovementFrictionFactor: Double; carRotationFrictionFactor: Double;
        throwProjectileCooldownTicks: LongInt; useNitroCooldownTicks: LongInt; spillOilCooldownTicks: LongInt;
        nitroEnginePowerFactor: Double; nitroDurationTicks: LongInt; carReactivationTimeTicks: LongInt;
        buggyMass: Double; buggyEngineForwardPower: Double; buggyEngineRearPower: Double; jeepMass: Double;
        jeepEngineForwardPower: Double; jeepEngineRearPower: Double; bonusSize: Double; bonusMass: Double;
        pureScoreAmount: LongInt; washerRadius: Double; washerMass: Double; washerInitialSpeed: Double;
        washerDamage: Double; sideWasherAngle: Double; tireRadius: Double; tireMass: Double; tireInitialSpeed: Double;
        tireDamageFactor: Double; tireDisappearSpeedFactor: Double; oilSlickInitialRange: Double;
        oilSlickRadius: Double; oilSlickLifetime: LongInt; maxOiledStateDurationTicks: LongInt);
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
    if finishTrackScores = nil then begin
        FFinishTrackScores := nil;
    end else begin
        FFinishTrackScores := Copy(finishTrackScores, 0, Length(finishTrackScores));
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
    if FFinishTrackScores = nil then begin
        result := nil;
    end else begin
        result := Copy(FFinishTrackScores, 0, Length(FFinishTrackScores));
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
