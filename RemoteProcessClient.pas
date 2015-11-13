unit RemoteProcessClient;

interface

uses
  SysUtils, SimpleSocket, PlayerContextControl, BonusControl, BonusTypeControl, CarControl, CarTypeControl,
  DirectionControl, GameControl, MoveControl, OilSlickControl, PlayerControl, ProjectileControl,
  ProjectileTypeControl, TileTypeControl, TypeControl, WorldControl;

const
  UNKNOWN_MESSAGE:        LongInt = 0;
  GAME_OVER:              LongInt = 1;
  AUTHENTICATION_TOKEN:   LongInt = 2;
  TEAM_SIZE:              LongInt = 3;
  PROTOCOL_VERSION:       LongInt = 4;
  GAME_CONTEXT:           LongInt = 5;
  PLAYER_CONTEXT:         LongInt = 6;
  MOVES_MESSAGE:          LongInt = 7;

  LITTLE_ENDIAN_BYTE_ORDER = true;
  INTEGER_SIZE_BYTES = sizeof(LongInt);
  LONG_SIZE_BYTES = sizeof(Int64);

type
  TMessageType = LongInt;

  TByteArray = array of Byte;

  TRemoteProcessClient = class
  private
    FSocket: ClientSocket;
    FMapName: string;
    FTilesXY: TTileTypeArray2D;
    FWaypoints: TLongIntArray2D;
    FStartingDirection: TDirection;
    {$HINTS OFF}
    function ReadBonus: TBonus;
    procedure WriteBonus(bonus: TBonus);
    function ReadBonuses: TBonusArray;
    procedure WriteBonuses(bonuses: TBonusArray);
    function ReadCar: TCar;
    procedure WriteCar(car: TCar);
    function ReadCars: TCarArray;
    procedure WriteCars(cars: TCarArray);
    function ReadGame: TGame;
    procedure WriteGame(game: TGame);
    function ReadGames: TGameArray;
    procedure WriteGames(games: TGameArray);
    function ReadMove: TMove;
    procedure WriteMove(move: TMove);
    function ReadMoves: TMoveArray;
    procedure WriteMoves(moves: TMoveArray);
    function ReadOilSlick: TOilSlick;
    procedure WriteOilSlick(oilSlick: TOilSlick);
    function ReadOilSlicks: TOilSlickArray;
    procedure WriteOilSlicks(oilSlicks: TOilSlickArray);
    function ReadPlayer: TPlayer;
    procedure WritePlayer(player: TPlayer);
    function ReadPlayers: TPlayerArray;
    procedure WritePlayers(players: TPlayerArray);
    function ReadPlayerContext: TPlayerContext;
    procedure WritePlayerContext(playerContext: TPlayerContext);
    function ReadPlayerContexts: TPlayerContextArray;
    procedure WritePlayerContexts(playerContexts: TPlayerContextArray);
    function ReadProjectile: TProjectile;
    procedure WriteProjectile(projectile: TProjectile);
    function ReadProjectiles: TProjectileArray;
    procedure WriteProjectiles(projectiles: TProjectileArray);
    function ReadWorld: TWorld;
    procedure WriteWorld(world: TWorld);
    function ReadWorlds: TWorldArray;
    procedure WriteWorlds(worlds: TWorldArray);
    {$HINTS ON}
    procedure EnsureMessageType(actualType: LongInt; expectedType: LongInt);
    function ReadEnum: LongInt;
    function ReadEnumArray: TLongIntArray;
    function ReadEnumArray2D: TLongIntArray2D;
    procedure WriteEnum(value: LongInt);
    procedure WriteEnumArray(value: TLongIntArray);
    procedure WriteEnumArray2D(value: TLongIntArray2D);
    function ReadString: string;
    procedure WriteString(value: string);
    function ReadInt: LongInt;
    function ReadIntArray: TLongIntArray;
    function ReadIntArray2D: TLongIntArray2D;
    procedure WriteInt(value: LongInt);
    procedure WriteIntArray(value: TLongIntArray);
    procedure WriteIntArray2D(value: TLongIntArray2D);
    function ReadBytes(byteCount: LongInt): TByteArray;
    procedure WriteBytes(bytes: TByteArray);
    function ReadBoolean: Boolean;
    procedure WriteBoolean(value: Boolean);
    function ReadDouble: Double;
    procedure WriteDouble(value: Double);
    function ReadLong: Int64;
    procedure WriteLong(value: Int64);
    function IsLittleEndianMachine: Boolean;
    procedure Reverse(var bytes: TByteArray);
  public
    constructor Create(const AHost: string; const APort: LongInt);
    destructor Destroy; override;
    procedure WriteTokenMessage(token: string);
    function ReadTeamSizeMessage: LongInt;
    procedure WriteProtocolVersionMessage;
    function ReadGameContextMessage: TGame;
    function ReadPlayerContextMessage: TPlayerContext;
    procedure WriteMovesMessage(moves: TMoveArray);
  end;

implementation

constructor TRemoteProcessClient.Create(const AHost: string; const APort: LongInt);
begin
  FSocket := ClientSocket.Create(AHost, APort);
  FMapName := '';
  FTilesXY := nil;
  FWaypoints := nil;
  FStartingDirection := _DIRECTION_COUNT_;
end;

destructor TRemoteProcessClient.Destroy;
begin
  FSocket.Free;
end;

procedure TRemoteProcessClient.EnsureMessageType(actualType: LongInt; expectedType: LongInt);
begin
  if (actualType <> expectedType) then 
  begin
    Halt(10001);
  end;
end;

procedure TRemoteProcessClient.WriteTokenMessage(token: string);
begin
  WriteEnum(AUTHENTICATION_TOKEN);
  WriteString(token);
end;

function TRemoteProcessClient.ReadTeamSizeMessage: LongInt;
begin
  EnsureMessageType(ReadEnum, TEAM_SIZE);
  Result := ReadInt;
end;

procedure TRemoteProcessClient.WriteProtocolVersionMessage;
begin
  WriteEnum(PROTOCOL_VERSION);
  WriteInt(1);
end;

function TRemoteProcessClient.ReadGameContextMessage: TGame;
begin
  EnsureMessageType(ReadEnum, GAME_CONTEXT);
  Result := ReadGame;
end;

function TRemoteProcessClient.ReadPlayerContextMessage: TPlayerContext;
var
    messageType: TMessageType;

begin
    messageType := ReadEnum;
    if messageType = GAME_OVER then begin
        result := nil;
        exit;
    end;

    EnsureMessageType(messageType, PLAYER_CONTEXT);
    result := ReadPlayerContext;
end;

procedure TRemoteProcessClient.WriteMovesMessage(moves: TMoveArray);
begin
    WriteEnum(MOVES_MESSAGE);
    WriteMoves(moves);
end;

function TRemoteProcessClient.ReadBonus: TBonus;
var
    id: Int64;
    mass: Double;
    x: Double;
    y: Double;
    speedX: Double;
    speedY: Double;
    angle: Double;
    angularSpeed: Double;
    width: Double;
    height: Double;
    bonusType: TBonusType;

begin
  if not ReadBoolean then 
  begin
    Result := nil;
    Exit;
  end;
  id := ReadLong;
  mass := ReadDouble;
  x := ReadDouble;
  y := ReadDouble;
  speedX := ReadDouble;
  speedY := ReadDouble;
  angle := ReadDouble;
  angularSpeed := ReadDouble;
  width := ReadDouble;
  height := ReadDouble;
  bonusType := ReadEnum;
  Result := TBonus.Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, width, height, bonusType);
end;

procedure TRemoteProcessClient.WriteBonus(bonus: TBonus);
begin
  if not Assigned(bonus) then 
  begin
    WriteBoolean(False);
    Exit;
  end;
  WriteBoolean(True);
  WriteLong(bonus.Id);
  WriteDouble(bonus.Mass);
  WriteDouble(bonus.X);
  WriteDouble(bonus.Y);
  WriteDouble(bonus.SpeedX);
  WriteDouble(bonus.SpeedY);
  WriteDouble(bonus.Angle);
  WriteDouble(bonus.AngularSpeed);
  WriteDouble(bonus.Width);
  WriteDouble(bonus.Height);
  WriteEnum(bonus.BonusType);
end;

function TRemoteProcessClient.ReadBonuses: TBonusArray;
var
    bonusIndex: LongInt;
    bonusCount: LongInt;

begin
    bonusCount := ReadInt;
    if bonusCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, bonusCount);

    for bonusIndex := 0 to bonusCount - 1 do begin
        result[bonusIndex] := ReadBonus;
    end;
end;

procedure TRemoteProcessClient.WriteBonuses(bonuses: TBonusArray);
var
    bonusIndex: LongInt;
    bonusCount: LongInt;

begin
    if bonuses = nil then begin
        WriteInt(-1);
        exit;
    end;

    bonusCount := Length(bonuses);
    WriteInt(bonusCount);

    for bonusIndex := 0 to bonusCount - 1 do begin
        WriteBonus(bonuses[bonusIndex]);
    end;
end;

function TRemoteProcessClient.ReadCar: TCar;
var
    id: Int64;
    mass: Double;
    x: Double;
    y: Double;
    speedX: Double;
    speedY: Double;
    angle: Double;
    angularSpeed: Double;
    width: Double;
    height: Double;
    playerId: Int64;
    teammateIndex: LongInt;
    teammate: Boolean;
    carType: TCarType;
    projectileCount: LongInt;
    nitroChargeCount: LongInt;
    oilCanisterCount: LongInt;
    remainingProjectileCooldownTicks: LongInt;
    remainingNitroCooldownTicks: LongInt;
    remainingOilCooldownTicks: LongInt;
    remainingNitroTicks: LongInt;
    remainingOiledTicks: LongInt;
    durability: Double;
    enginePower: Double;
    wheelTurn: Double;
    nextWaypointX: LongInt;
    nextWaypointY: LongInt;
    finishedTrack: Boolean;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    id := ReadLong;
    mass := ReadDouble;
    x := ReadDouble;
    y := ReadDouble;
    speedX := ReadDouble;
    speedY := ReadDouble;
    angle := ReadDouble;
    angularSpeed := ReadDouble;
    width := ReadDouble;
    height := ReadDouble;
    playerId := ReadLong;
    teammateIndex := ReadInt;
    teammate := ReadBoolean;
    carType := ReadEnum;
    projectileCount := ReadInt;
    nitroChargeCount := ReadInt;
    oilCanisterCount := ReadInt;
    remainingProjectileCooldownTicks := ReadInt;
    remainingNitroCooldownTicks := ReadInt;
    remainingOilCooldownTicks := ReadInt;
    remainingNitroTicks := ReadInt;
    remainingOiledTicks := ReadInt;
    durability := ReadDouble;
    enginePower := ReadDouble;
    wheelTurn := ReadDouble;
    nextWaypointX := ReadInt;
    nextWaypointY := ReadInt;
    finishedTrack := ReadBoolean;

    result := TCar.Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, width, height, playerId, teammateIndex,
            teammate, carType, projectileCount, nitroChargeCount, oilCanisterCount, remainingProjectileCooldownTicks,
            remainingNitroCooldownTicks, remainingOilCooldownTicks, remainingNitroTicks, remainingOiledTicks,
            durability, enginePower, wheelTurn, nextWaypointX, nextWaypointY, finishedTrack);
end;

procedure TRemoteProcessClient.WriteCar(car: TCar);
begin
    if car = nil then begin
        WriteBoolean(false);
        exit;
    end;

    WriteBoolean(true);

    WriteLong(car.Id);
    WriteDouble(car.Mass);
    WriteDouble(car.X);
    WriteDouble(car.Y);
    WriteDouble(car.SpeedX);
    WriteDouble(car.SpeedY);
    WriteDouble(car.Angle);
    WriteDouble(car.AngularSpeed);
    WriteDouble(car.Width);
    WriteDouble(car.Height);
    WriteLong(car.PlayerId);
    WriteInt(car.TeammateIndex);
    WriteBoolean(car.IsTeammate);
    WriteEnum(car.CarType);
    WriteInt(car.ProjectileCount);
    WriteInt(car.NitroChargeCount);
    WriteInt(car.OilCanisterCount);
    WriteInt(car.RemainingProjectileCooldownTicks);
    WriteInt(car.RemainingNitroCooldownTicks);
    WriteInt(car.RemainingOilCooldownTicks);
    WriteInt(car.RemainingNitroTicks);
    WriteInt(car.RemainingOiledTicks);
    WriteDouble(car.Durability);
    WriteDouble(car.EnginePower);
    WriteDouble(car.WheelTurn);
    WriteInt(car.NextWaypointX);
    WriteInt(car.NextWaypointY);
    WriteBoolean(car.IsFinishedTrack);
end;

function TRemoteProcessClient.ReadCars: TCarArray;
var
    carIndex: LongInt;
    carCount: LongInt;

begin
    carCount := ReadInt;
    if carCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, carCount);

    for carIndex := 0 to carCount - 1 do begin
        result[carIndex] := ReadCar;
    end;
end;

procedure TRemoteProcessClient.WriteCars(cars: TCarArray);
var
    carIndex: LongInt;
    carCount: LongInt;

begin
    if cars = nil then begin
        WriteInt(-1);
        exit;
    end;

    carCount := Length(cars);
    WriteInt(carCount);

    for carIndex := 0 to carCount - 1 do begin
        WriteCar(cars[carIndex]);
    end;
end;

function TRemoteProcessClient.ReadGame: TGame;
var
    randomSeed: Int64;
    tickCount: LongInt;
    worldWidth: LongInt;
    worldHeight: LongInt;
    trackTileSize: Double;
    trackTileMargin: Double;
    lapCount: LongInt;
    lapTickCount: LongInt;
    initialFreezeDurationTicks: LongInt;
    burningTimeDurationFactor: Double;
    finishTrackScores: TLongIntArray;
    finishLapScore: LongInt;
    lapWaypointsSummaryScoreFactor: Double;
    carDamageScoreFactor: Double;
    carEliminationScore: LongInt;
    carWidth: Double;
    carHeight: Double;
    carEnginePowerChangePerTick: Double;
    carWheelTurnChangePerTick: Double;
    carAngularSpeedFactor: Double;
    carMovementAirFrictionFactor: Double;
    carRotationAirFrictionFactor: Double;
    carLengthwiseMovementFrictionFactor: Double;
    carCrosswiseMovementFrictionFactor: Double;
    carRotationFrictionFactor: Double;
    throwProjectileCooldownTicks: LongInt;
    useNitroCooldownTicks: LongInt;
    spillOilCooldownTicks: LongInt;
    nitroEnginePowerFactor: Double;
    nitroDurationTicks: LongInt;
    carReactivationTimeTicks: LongInt;
    buggyMass: Double;
    buggyEngineForwardPower: Double;
    buggyEngineRearPower: Double;
    jeepMass: Double;
    jeepEngineForwardPower: Double;
    jeepEngineRearPower: Double;
    bonusSize: Double;
    bonusMass: Double;
    pureScoreAmount: LongInt;
    washerRadius: Double;
    washerMass: Double;
    washerInitialSpeed: Double;
    washerDamage: Double;
    sideWasherAngle: Double;
    tireRadius: Double;
    tireMass: Double;
    tireInitialSpeed: Double;
    tireDamageFactor: Double;
    tireDisappearSpeedFactor: Double;
    oilSlickInitialRange: Double;
    oilSlickRadius: Double;
    oilSlickLifetime: LongInt;
    maxOiledStateDurationTicks: LongInt;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    randomSeed := ReadLong;
    tickCount := ReadInt;
    worldWidth := ReadInt;
    worldHeight := ReadInt;
    trackTileSize := ReadDouble;
    trackTileMargin := ReadDouble;
    lapCount := ReadInt;
    lapTickCount := ReadInt;
    initialFreezeDurationTicks := ReadInt;
    burningTimeDurationFactor := ReadDouble;
    finishTrackScores := ReadIntArray;
    finishLapScore := ReadInt;
    lapWaypointsSummaryScoreFactor := ReadDouble;
    carDamageScoreFactor := ReadDouble;
    carEliminationScore := ReadInt;
    carWidth := ReadDouble;
    carHeight := ReadDouble;
    carEnginePowerChangePerTick := ReadDouble;
    carWheelTurnChangePerTick := ReadDouble;
    carAngularSpeedFactor := ReadDouble;
    carMovementAirFrictionFactor := ReadDouble;
    carRotationAirFrictionFactor := ReadDouble;
    carLengthwiseMovementFrictionFactor := ReadDouble;
    carCrosswiseMovementFrictionFactor := ReadDouble;
    carRotationFrictionFactor := ReadDouble;
    throwProjectileCooldownTicks := ReadInt;
    useNitroCooldownTicks := ReadInt;
    spillOilCooldownTicks := ReadInt;
    nitroEnginePowerFactor := ReadDouble;
    nitroDurationTicks := ReadInt;
    carReactivationTimeTicks := ReadInt;
    buggyMass := ReadDouble;
    buggyEngineForwardPower := ReadDouble;
    buggyEngineRearPower := ReadDouble;
    jeepMass := ReadDouble;
    jeepEngineForwardPower := ReadDouble;
    jeepEngineRearPower := ReadDouble;
    bonusSize := ReadDouble;
    bonusMass := ReadDouble;
    pureScoreAmount := ReadInt;
    washerRadius := ReadDouble;
    washerMass := ReadDouble;
    washerInitialSpeed := ReadDouble;
    washerDamage := ReadDouble;
    sideWasherAngle := ReadDouble;
    tireRadius := ReadDouble;
    tireMass := ReadDouble;
    tireInitialSpeed := ReadDouble;
    tireDamageFactor := ReadDouble;
    tireDisappearSpeedFactor := ReadDouble;
    oilSlickInitialRange := ReadDouble;
    oilSlickRadius := ReadDouble;
    oilSlickLifetime := ReadInt;
    maxOiledStateDurationTicks := ReadInt;

    result := TGame.Create(randomSeed, tickCount, worldWidth, worldHeight, trackTileSize, trackTileMargin, lapCount,
            lapTickCount, initialFreezeDurationTicks, burningTimeDurationFactor, finishTrackScores, finishLapScore,
            lapWaypointsSummaryScoreFactor, carDamageScoreFactor, carEliminationScore, carWidth, carHeight,
            carEnginePowerChangePerTick, carWheelTurnChangePerTick, carAngularSpeedFactor, carMovementAirFrictionFactor,
            carRotationAirFrictionFactor, carLengthwiseMovementFrictionFactor, carCrosswiseMovementFrictionFactor,
            carRotationFrictionFactor, throwProjectileCooldownTicks, useNitroCooldownTicks, spillOilCooldownTicks,
            nitroEnginePowerFactor, nitroDurationTicks, carReactivationTimeTicks, buggyMass, buggyEngineForwardPower,
            buggyEngineRearPower, jeepMass, jeepEngineForwardPower, jeepEngineRearPower, bonusSize, bonusMass,
            pureScoreAmount, washerRadius, washerMass, washerInitialSpeed, washerDamage, sideWasherAngle, tireRadius,
            tireMass, tireInitialSpeed, tireDamageFactor, tireDisappearSpeedFactor, oilSlickInitialRange,
            oilSlickRadius, oilSlickLifetime, maxOiledStateDurationTicks);
end;

procedure TRemoteProcessClient.WriteGame(game: TGame);
begin
    if game = nil then begin
        WriteBoolean(false);
        exit;
    end;

    WriteBoolean(true);

    WriteLong(game.RandomSeed);
    WriteInt(game.TickCount);
    WriteInt(game.WorldWidth);
    WriteInt(game.WorldHeight);
    WriteDouble(game.TrackTileSize);
    WriteDouble(game.TrackTileMargin);
    WriteInt(game.LapCount);
    WriteInt(game.LapTickCount);
    WriteInt(game.InitialFreezeDurationTicks);
    WriteDouble(game.BurningTimeDurationFactor);
    WriteIntArray(game.FinishTrackScores);
    WriteInt(game.FinishLapScore);
    WriteDouble(game.LapWaypointsSummaryScoreFactor);
    WriteDouble(game.CarDamageScoreFactor);
    WriteInt(game.CarEliminationScore);
    WriteDouble(game.CarWidth);
    WriteDouble(game.CarHeight);
    WriteDouble(game.CarEnginePowerChangePerTick);
    WriteDouble(game.CarWheelTurnChangePerTick);
    WriteDouble(game.CarAngularSpeedFactor);
    WriteDouble(game.CarMovementAirFrictionFactor);
    WriteDouble(game.CarRotationAirFrictionFactor);
    WriteDouble(game.CarLengthwiseMovementFrictionFactor);
    WriteDouble(game.CarCrosswiseMovementFrictionFactor);
    WriteDouble(game.CarRotationFrictionFactor);
    WriteInt(game.ThrowProjectileCooldownTicks);
    WriteInt(game.UseNitroCooldownTicks);
    WriteInt(game.SpillOilCooldownTicks);
    WriteDouble(game.NitroEnginePowerFactor);
    WriteInt(game.NitroDurationTicks);
    WriteInt(game.CarReactivationTimeTicks);
    WriteDouble(game.BuggyMass);
    WriteDouble(game.BuggyEngineForwardPower);
    WriteDouble(game.BuggyEngineRearPower);
    WriteDouble(game.JeepMass);
    WriteDouble(game.JeepEngineForwardPower);
    WriteDouble(game.JeepEngineRearPower);
    WriteDouble(game.BonusSize);
    WriteDouble(game.BonusMass);
    WriteInt(game.PureScoreAmount);
    WriteDouble(game.WasherRadius);
    WriteDouble(game.WasherMass);
    WriteDouble(game.WasherInitialSpeed);
    WriteDouble(game.WasherDamage);
    WriteDouble(game.SideWasherAngle);
    WriteDouble(game.TireRadius);
    WriteDouble(game.TireMass);
    WriteDouble(game.TireInitialSpeed);
    WriteDouble(game.TireDamageFactor);
    WriteDouble(game.TireDisappearSpeedFactor);
    WriteDouble(game.OilSlickInitialRange);
    WriteDouble(game.OilSlickRadius);
    WriteInt(game.OilSlickLifetime);
    WriteInt(game.MaxOiledStateDurationTicks);
end;

function TRemoteProcessClient.ReadGames: TGameArray;
var
    gameIndex: LongInt;
    gameCount: LongInt;

begin
    gameCount := ReadInt;
    if gameCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, gameCount);

    for gameIndex := 0 to gameCount - 1 do begin
        result[gameIndex] := ReadGame;
    end;
end;

procedure TRemoteProcessClient.WriteGames(games: TGameArray);
var
    gameIndex: LongInt;
    gameCount: LongInt;

begin
    if games = nil then begin
        WriteInt(-1);
        exit;
    end;

    gameCount := Length(games);
    WriteInt(gameCount);

    for gameIndex := 0 to gameCount - 1 do begin
        WriteGame(games[gameIndex]);
    end;
end;

function TRemoteProcessClient.ReadMove: TMove;
begin
  if not ReadBoolean then 
  begin
    Result := nil;
    Exit;
  end;
  Result := TMove.Create;
  Result.EnginePower := ReadDouble;
  Result.IsBrake := ReadBoolean;
  Result.WheelTurn := ReadDouble;
  Result.IsThrowProjectile := ReadBoolean;
  Result.IsUseNitro := ReadBoolean;
  Result.IsSpillOil := ReadBoolean;
end;

procedure TRemoteProcessClient.WriteMove(move: TMove);
begin
  if not Assigned(move) then 
  begin
    WriteBoolean(False);
    Exit;
  end;
  WriteBoolean(True);
  WriteDouble(move.EnginePower);
  WriteBoolean(move.IsBrake);
  WriteDouble(move.WheelTurn);
  WriteBoolean(move.IsThrowProjectile);
  WriteBoolean(move.IsUseNitro);
  WriteBoolean(move.IsSpillOil);
end;

function TRemoteProcessClient.ReadMoves: TMoveArray;
var
    moveIndex: LongInt;
    moveCount: LongInt;

begin
    moveCount := ReadInt;
    if moveCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, moveCount);

    for moveIndex := 0 to moveCount - 1 do begin
        result[moveIndex] := ReadMove;
    end;
end;

procedure TRemoteProcessClient.WriteMoves(moves: TMoveArray);
var
    moveIndex: LongInt;
    moveCount: LongInt;

begin
    if moves = nil then begin
        WriteInt(-1);
        exit;
    end;

    moveCount := Length(moves);
    WriteInt(moveCount);

    for moveIndex := 0 to moveCount - 1 do begin
        WriteMove(moves[moveIndex]);
    end;
end;

function TRemoteProcessClient.ReadOilSlick: TOilSlick;
var
    id: Int64;
    mass: Double;
    x: Double;
    y: Double;
    speedX: Double;
    speedY: Double;
    angle: Double;
    angularSpeed: Double;
    radius: Double;
    remainingLifetime: LongInt;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    id := ReadLong;
    mass := ReadDouble;
    x := ReadDouble;
    y := ReadDouble;
    speedX := ReadDouble;
    speedY := ReadDouble;
    angle := ReadDouble;
    angularSpeed := ReadDouble;
    radius := ReadDouble;
    remainingLifetime := ReadInt;

    result := TOilSlick.Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, radius, remainingLifetime);
end;

procedure TRemoteProcessClient.WriteOilSlick(oilSlick: TOilSlick);
begin
    if oilSlick = nil then begin
        WriteBoolean(false);
        exit;
    end;

    WriteBoolean(true);

    WriteLong(oilSlick.Id);
    WriteDouble(oilSlick.Mass);
    WriteDouble(oilSlick.X);
    WriteDouble(oilSlick.Y);
    WriteDouble(oilSlick.SpeedX);
    WriteDouble(oilSlick.SpeedY);
    WriteDouble(oilSlick.Angle);
    WriteDouble(oilSlick.AngularSpeed);
    WriteDouble(oilSlick.Radius);
    WriteInt(oilSlick.RemainingLifetime);
end;

function TRemoteProcessClient.ReadOilSlicks: TOilSlickArray;
var
    oilSlickIndex: LongInt;
    oilSlickCount: LongInt;

begin
    oilSlickCount := ReadInt;
    if oilSlickCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, oilSlickCount);

    for oilSlickIndex := 0 to oilSlickCount - 1 do begin
        result[oilSlickIndex] := ReadOilSlick;
    end;
end;

procedure TRemoteProcessClient.WriteOilSlicks(oilSlicks: TOilSlickArray);
var
    oilSlickIndex: LongInt;
    oilSlickCount: LongInt;

begin
    if oilSlicks = nil then begin
        WriteInt(-1);
        exit;
    end;

    oilSlickCount := Length(oilSlicks);
    WriteInt(oilSlickCount);

    for oilSlickIndex := 0 to oilSlickCount - 1 do begin
        WriteOilSlick(oilSlicks[oilSlickIndex]);
    end;
end;

function TRemoteProcessClient.ReadPlayer: TPlayer;
var
    id: Int64;
    me: Boolean;
    name: String;
    strategyCrashed: Boolean;
    score: LongInt;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    id := ReadLong;
    me := ReadBoolean;
    name := ReadString;
    strategyCrashed := ReadBoolean;
    score := ReadInt;

    result := TPlayer.Create(id, me, name, strategyCrashed, score);
end;

procedure TRemoteProcessClient.WritePlayer(player: TPlayer);
begin
    if player = nil then begin
        WriteBoolean(false);
        exit;
    end;

    WriteBoolean(true);

    WriteLong(player.Id);
    WriteBoolean(player.IsMe);
    WriteString(player.Name);
    WriteBoolean(player.StrategyCrashed);
    WriteInt(player.Score);
end;

function TRemoteProcessClient.ReadPlayers: TPlayerArray;
var
    playerIndex: LongInt;
    playerCount: LongInt;

begin
    playerCount := ReadInt;
    if playerCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, playerCount);

    for playerIndex := 0 to playerCount - 1 do begin
        result[playerIndex] := ReadPlayer;
    end;
end;

procedure TRemoteProcessClient.WritePlayers(players: TPlayerArray);
var
    playerIndex: LongInt;
    playerCount: LongInt;

begin
    if players = nil then begin
        WriteInt(-1);
        exit;
    end;

    playerCount := Length(players);
    WriteInt(playerCount);

    for playerIndex := 0 to playerCount - 1 do begin
        WritePlayer(players[playerIndex]);
    end;
end;

function TRemoteProcessClient.ReadPlayerContext: TPlayerContext;
var
    cars: TCarArray;
    world: TWorld;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    cars := ReadCars;
    world := ReadWorld;

    result := TPlayerContext.Create(cars, world);
end;

procedure TRemoteProcessClient.WritePlayerContext(playerContext: TPlayerContext);
begin
  if not Assigned(playerContext) then 
  begin
    WriteBoolean(False);
    Exit;
  end;
  WriteBoolean(True);
  WriteCars(playerContext.Cars);
  WriteWorld(playerContext.World);
end;

function TRemoteProcessClient.ReadPlayerContexts: TPlayerContextArray;
var
  playerContextIndex: LongInt;
  playerContextCount: LongInt;
begin
  playerContextCount := ReadInt;
  if playerContextCount < 0 then 
  begin
    Result := nil;
    Exit;
  end;
  SetLength(Result, playerContextCount);
  if playerContextCount > 0 then
  begin
    for playerContextIndex := 0 to playerContextCount - 1 do 
    begin
      Result[playerContextIndex] := ReadPlayerContext;
    end;
  end;
end;

procedure TRemoteProcessClient.WritePlayerContexts(playerContexts: TPlayerContextArray);
var
    playerContextIndex: LongInt;
    playerContextCount: LongInt;

begin
    if playerContexts = nil then begin
        WriteInt(-1);
        exit;
    end;

    playerContextCount := Length(playerContexts);
    WriteInt(playerContextCount);

    for playerContextIndex := 0 to playerContextCount - 1 do begin
        WritePlayerContext(playerContexts[playerContextIndex]);
    end;
end;

function TRemoteProcessClient.ReadProjectile: TProjectile;
var
    id: Int64;
    mass: Double;
    x: Double;
    y: Double;
    speedX: Double;
    speedY: Double;
    angle: Double;
    angularSpeed: Double;
    radius: Double;
    carId: Int64;
    playerId: Int64;
    projectileType: TProjectileType;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    id := ReadLong;
    mass := ReadDouble;
    x := ReadDouble;
    y := ReadDouble;
    speedX := ReadDouble;
    speedY := ReadDouble;
    angle := ReadDouble;
    angularSpeed := ReadDouble;
    radius := ReadDouble;
    carId := ReadLong;
    playerId := ReadLong;
    projectileType := ReadEnum;

    result := TProjectile.Create(id, mass, x, y, speedX, speedY, angle, angularSpeed, radius, carId, playerId,
            projectileType);
end;

procedure TRemoteProcessClient.WriteProjectile(projectile: TProjectile);
begin
  if not Assigned(projectile) then 
  begin
    WriteBoolean(False);
    Exit;
  end;
  WriteBoolean(True);
  WriteLong(projectile.Id);
  WriteDouble(projectile.Mass);
  WriteDouble(projectile.X);
  WriteDouble(projectile.Y);
  WriteDouble(projectile.SpeedX);
  WriteDouble(projectile.SpeedY);
  WriteDouble(projectile.Angle);
  WriteDouble(projectile.AngularSpeed);
  WriteDouble(projectile.Radius);
  WriteLong(projectile.CarId);
  WriteLong(projectile.PlayerId);
  WriteEnum(projectile.ProjectileType);
end;

function TRemoteProcessClient.ReadProjectiles: TProjectileArray;
var
    projectileIndex: LongInt;
    projectileCount: LongInt;

begin
    projectileCount := ReadInt;
    if projectileCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, projectileCount);

    for projectileIndex := 0 to projectileCount - 1 do begin
        result[projectileIndex] := ReadProjectile;
    end;
end;

procedure TRemoteProcessClient.WriteProjectiles(projectiles: TProjectileArray);
var
    projectileIndex: LongInt;
    projectileCount: LongInt;

begin
    if projectiles = nil then begin
        WriteInt(-1);
        exit;
    end;

    projectileCount := Length(projectiles);
    WriteInt(projectileCount);

    for projectileIndex := 0 to projectileCount - 1 do begin
        WriteProjectile(projectiles[projectileIndex]);
    end;
end;

function TRemoteProcessClient.ReadWorld: TWorld;
var
    tick: LongInt;
    tickCount: LongInt;
    lastTickIndex: LongInt;
    width: LongInt;
    height: LongInt;
    players: TPlayerArray;
    cars: TCarArray;
    projectiles: TProjectileArray;
    bonuses: TBonusArray;
    oilSlicks: TOilSlickArray;
    mapName: String;
    tilesXY: TTileTypeArray2D;
    waypoints: TLongIntArray2D;
    startingDirection: TDirection;

begin
    if not ReadBoolean then begin
        result := nil;
        exit;
    end;

    tick := ReadInt;
    tickCount := ReadInt;
    lastTickIndex := ReadInt;
    width := ReadInt;
    height := ReadInt;
    players := ReadPlayers;
    cars := ReadCars;
    projectiles := ReadProjectiles;
    bonuses := ReadBonuses;
    oilSlicks := ReadOilSlicks;

    if FMapName = '' then begin
        FMapName := ReadString;
    end;
    mapName := FMapName;
    
    if FTilesXY = nil then begin
        FTilesXY := ReadEnumArray2D;
    end;
    tilesXY := FTilesXY;

    if FWaypoints = nil then begin
        FWaypoints := ReadIntArray2D;
    end;
    waypoints := FWaypoints;

    if FStartingDirection = _DIRECTION_COUNT_ then begin
        FStartingDirection := ReadEnum;
    end;
    startingDirection := FStartingDirection;

    result := TWorld.Create(tick, tickCount, lastTickIndex, width, height, players, cars, projectiles, bonuses,
            oilSlicks, mapName, tilesXY, waypoints, startingDirection);
end;

procedure TRemoteProcessClient.WriteWorld(world: TWorld);
begin
    if world = nil then begin
        WriteBoolean(false);
        exit;
    end;

    WriteBoolean(true);

    WriteInt(world.Tick);
    WriteInt(world.TickCount);
    WriteInt(world.LastTickIndex);
    WriteInt(world.Width);
    WriteInt(world.Height);
    WritePlayers(world.Players);
    WriteCars(world.Cars);
    WriteProjectiles(world.Projectiles);
    WriteBonuses(world.Bonuses);
    WriteOilSlicks(world.OilSlicks);
    WriteString(world.MapName);
    WriteEnumArray2D(world.TilesXY);
    WriteIntArray2D(world.Waypoints);
    WriteEnum(world.StartingDirection);
end;

function TRemoteProcessClient.ReadWorlds: TWorldArray;
var
    worldIndex: LongInt;
    worldCount: LongInt;

begin
    worldCount := ReadInt;
    if worldCount < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, worldCount);

    for worldIndex := 0 to worldCount - 1 do begin
        result[worldIndex] := ReadWorld;
    end;
end;

procedure TRemoteProcessClient.WriteWorlds(worlds: TWorldArray);
var
    worldIndex: LongInt;
    worldCount: LongInt;

begin
    if worlds = nil then begin
        WriteInt(-1);
        exit;
    end;

    worldCount := Length(worlds);
    WriteInt(worldCount);

    for worldIndex := 0 to worldCount - 1 do begin
        WriteWorld(worlds[worldIndex]);
    end;
end;

procedure TRemoteProcessClient.WriteEnum(value: LongInt);
var
    bytes: TByteArray;

begin
    SetLength(bytes, 1);
    bytes[0] := value;
    WriteBytes(bytes);
    Finalize(bytes);
end;

procedure TRemoteProcessClient.WriteEnumArray(value: TLongIntArray);
var
    i, len: LongInt;

begin
    if value = nil then begin
        WriteInt(-1);
        exit;
    end;

    len := Length(value);
    WriteInt(len);

    for i := 0 to len - 1 do begin
        WriteEnum(value[i]);
    end;
end;

procedure TRemoteProcessClient.WriteEnumArray2D(value: TLongIntArray2D);
var
    i, len: LongInt;

begin
    if value = nil then begin
        WriteInt(-1);
        exit;
    end;

    len := Length(value);
    WriteInt(len);

    for i := 0 to len - 1 do begin
        WriteEnumArray(value[i]);
    end;
end;

function TRemoteProcessClient.ReadEnum: TMessageType;
var
    bytes: TByteArray;

begin
    bytes := ReadBytes(1);
    result := bytes[0];
    Finalize(bytes);
end;

function TRemoteProcessClient.ReadEnumArray: TLongIntArray;
var
    i, len: LongInt;

begin
    len := ReadInt;
    if len < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, len);

    for i := 0 to len - 1 do begin
        result[i] := ReadEnum;
    end;
end;

function TRemoteProcessClient.ReadEnumArray2D: TLongIntArray2D;
var
    i, len: LongInt;

begin
    len := ReadInt;
    if len < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, len);

    for i := 0 to len - 1 do begin
        result[i] := ReadEnumArray;
    end;
end;

procedure TRemoteProcessClient.WriteBytes(bytes: TByteArray);
begin
    FSocket.StrictSend(bytes, Length(bytes));
end;

function TRemoteProcessClient.ReadBytes(byteCount: LongInt): TByteArray;  
var
    bytes: TByteArray;

begin
    SetLength(bytes, byteCount);
    FSocket.StrictReceive(bytes, byteCount);
    result := bytes;
end;

procedure TRemoteProcessClient.WriteString(value: String);
var
    len, i: LongInt;
    bytes: TByteArray;

begin
    len := Length(value);
    SetLength(bytes, len);
    for i := 1 to len do begin
        bytes[i - 1] := Ord(value[i]);
    end;

    WriteInt(len);
    WriteBytes(bytes);
    Finalize(bytes);
end;

procedure TRemoteProcessClient.WriteBoolean(value: Boolean);
var
    bytes: TByteArray;

begin
    SetLength(bytes, 1);
    bytes[0] := ord(value);
    WriteBytes(bytes);
    Finalize(bytes);
end;

function TRemoteProcessClient.ReadBoolean: Boolean;
var
    bytes: TByteArray;

begin
    bytes := ReadBytes(1);
    result := (bytes[0] <> 0);
    Finalize(bytes);
end;

function TRemoteProcessClient.ReadString: String;
var
    len, i: LongInt;
    bytes: TByteArray;
    res: String;

begin
    len := ReadInt;
    if len = -1 then begin
        HALT(10014);
    end;

    res := '';
    bytes := ReadBytes(len);
    for i := 0 to len - 1 do begin
        res := res + Chr(bytes[i]);
    end;
    
    Finalize(bytes);
    result := res;
end;

procedure TRemoteProcessClient.WriteDouble(value: Double);
var
    pl: ^Int64;
    pd: ^Double;
    p: Pointer;

begin
    New(pd);
    pd^ := value;
    p := pd;
    pl := p;
    WriteLong(pl^);
    Dispose(pd);
end;

function TRemoteProcessClient.ReadDouble: Double;
var
    pl: ^Int64;
    pd: ^Double;
    p: Pointer;
    
begin
    New(pl);
    pl^ := ReadLong;
    p := pl;
    pd := p;
    result := pd^;
    Dispose(pl);
end;

procedure TRemoteProcessClient.WriteInt(value: LongInt);
var
    bytes: TByteArray;
    i: LongInt;
    
begin
    SetLength(bytes, INTEGER_SIZE_BYTES);
    for i := 0 to INTEGER_SIZE_BYTES - 1 do begin
        bytes[i] := (value shr ({24 -} i * 8)) and 255;
    end;

    if (IsLittleEndianMachine <> LITTLE_ENDIAN_BYTE_ORDER) then begin
        Reverse(bytes);
    end;

    WriteBytes(bytes);
    Finalize(bytes);
end;

procedure TRemoteProcessClient.WriteIntArray(value: TLongIntArray);
var
    i, len: LongInt;

begin
    if value = nil then begin
        WriteInt(-1);
        exit;
    end;

    len := Length(value);
    WriteInt(len);

    for i := 0 to len - 1 do begin
        WriteInt(value[i]);
    end;
end;

procedure TRemoteProcessClient.WriteIntArray2D(value: TLongIntArray2D);
var
    i, len: LongInt;

begin
    if value = nil then begin
        WriteInt(-1);
        exit;
    end;

    len := Length(value);
    WriteInt(len);

    for i := 0 to len - 1 do begin
        WriteIntArray(value[i]);
    end;
end;

function TRemoteProcessClient.ReadInt: LongInt;
var
    bytes: TByteArray;
    res: LongInt;
    i: LongInt;
    
begin
    res := 0;
    bytes := readBytes(INTEGER_SIZE_BYTES);
    for i := INTEGER_SIZE_BYTES - 1 downto 0 do begin
        res := (res shl 8) or bytes[i];
    end;
        
    Finalize(bytes);
    result := res;
end;

function TRemoteProcessClient.ReadIntArray: TLongIntArray;
var
    i, len: LongInt;

begin
    len := ReadInt;
    if len < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, len);

    for i := 0 to len - 1 do begin
        result[i] := ReadInt;
    end;
end;

function TRemoteProcessClient.ReadIntArray2D: TLongIntArray2D;
var
    i, len: LongInt;

begin
    len := ReadInt;
    if len < 0 then begin
        result := nil;
        exit;
    end;

    SetLength(result, len);

    for i := 0 to len - 1 do begin
        result[i] := ReadIntArray;
    end;
end;

function TRemoteProcessClient.ReadLong: Int64;
var
    bytes: TByteArray;
    res: Int64;
    i: LongInt;
    
begin
    res := 0;
    bytes := readBytes(LONG_SIZE_BYTES);
    for i := LONG_SIZE_BYTES - 1 downto 0 do begin
        res := (res shl 8) or bytes[i];
    end;
        
    Finalize(bytes);
    result := res;
end;

procedure TRemoteProcessClient.WriteLong(value: Int64);
var
    bytes: TByteArray;
    i: LongInt;
    
begin
    SetLength(bytes, LONG_SIZE_BYTES);
    for i := 0 to LONG_SIZE_BYTES - 1 do begin
        bytes[i] := (value shr ({24 -} i*8)) and 255;
    end;

    if (IsLittleEndianMachine <> LITTLE_ENDIAN_BYTE_ORDER) then begin
        Reverse(bytes);
    end;

    WriteBytes(bytes);
    Finalize(bytes);
end;

function TRemoteProcessClient.IsLittleEndianMachine: Boolean;
begin
    result := true;
end;

procedure TRemoteProcessClient.Reverse(var bytes: TByteArray);
var
    i, len: LongInt;
    buffer: Byte;

begin
    len := Length(bytes);
    for i := 0 to (len div 2) do begin
        buffer := bytes[i];
        bytes[i] := bytes[len - i - 1];
        bytes[len - i - 1] := buffer;
    end;
end;

end.
