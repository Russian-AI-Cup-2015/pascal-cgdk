unit WorldControl;

interface

uses
  Math, TypeControl, BonusControl, CarControl, DirectionControl, OilSlickControl, PlayerControl, ProjectileControl, TileTypeControl;

type
  TWorld = class
  private
    FTick: LongInt;
    FTickCount: LongInt;
    FLastTickIndex: LongInt;
    FWidth: LongInt;
    FHeight: LongInt;
    FPlayers: TPlayerArray;
    FCars: TCarArray;
    FProjectiles: TProjectileArray;
    FBonuses: TBonusArray;
    FOilSlicks: TOilSlickArray;
    FMapName: String;
    FTilesXY: TTileTypeArray2D;
    FWaypoints: TLongIntArray2D;
    FStartingDirection: TDirection;

  public
    constructor Create(const tick: LongInt; const tickCount: LongInt; const lastTickIndex: LongInt;
      const width: LongInt; const height: LongInt; const players: TPlayerArray; const cars: TCarArray;
      const projectiles: TProjectileArray; const bonuses: TBonusArray; const oilSlicks: TOilSlickArray;
      const mapName: String; const tilesXY: TTileTypeArray2D; const waypoints: TLongIntArray2D;
      const startingDirection: TDirection);

    function GetTick: LongInt;
    property Tick: LongInt read GetTick;
    function GetTickCount: LongInt;
    property TickCount: LongInt read GetTickCount;
    function GetLastTickIndex: LongInt;
    property LastTickIndex: LongInt read GetLastTickIndex;
    function GetWidth: LongInt;
    property Width: LongInt read GetWidth;
    function GetHeight: LongInt;
    property Height: LongInt read GetHeight;
    function GetPlayers: TPlayerArray;
    property Players: TPlayerArray read GetPlayers;
    function GetCars: TCarArray;
    property Cars: TCarArray read GetCars;
    function GetProjectiles: TProjectileArray;
    property Projectiles: TProjectileArray read GetProjectiles;
    function GetBonuses: TBonusArray;
    property Bonuses: TBonusArray read GetBonuses;
    function GetOilSlicks: TOilSlickArray;
    property OilSlicks: TOilSlickArray read GetOilSlicks;
    function GetMapName: String;
    property MapName: String read GetMapName;
    function GetTilesXY: TTileTypeArray2D;
    property TilesXY: TTileTypeArray2D read GetTilesXY;
    function GetWaypoints: TLongIntArray2D;
    property Waypoints: TLongIntArray2D read GetWaypoints;
    function GetStartingDirection: TDirection;
    property StartingDirection: TDirection read GetStartingDirection;

    function GetMyPlayer: TPlayer;

    destructor Destroy; override;

  end;

  TWorldArray = array of TWorld;

implementation

constructor TWorld.Create(const tick: LongInt; const tickCount: LongInt; const lastTickIndex: LongInt;
  const width: LongInt; const height: LongInt; const players: TPlayerArray; const cars: TCarArray;
  const projectiles: TProjectileArray; const bonuses: TBonusArray; const oilSlicks: TOilSlickArray;
  const mapName: String; const tilesXY: TTileTypeArray2D; const waypoints: TLongIntArray2D;
  const startingDirection: TDirection);
var
  i: LongInt;

begin
  FTick := tick;
  FTickCount := tickCount;
  FLastTickIndex := lastTickIndex;
  FWidth := width;
  FHeight := height;
  if Assigned(players) then begin
    FPlayers := Copy(players, 0, Length(players));
  end else begin
    FPlayers := nil;
  end;
  if Assigned(cars) then begin
    FCars := Copy(cars, 0, Length(cars));
  end else begin
    FCars := nil;
  end;
  if Assigned(projectiles) then begin
    FProjectiles := Copy(projectiles, 0, Length(projectiles));
  end else begin
    FProjectiles := nil;
  end;
  if Assigned(bonuses) then begin
    FBonuses := Copy(bonuses, 0, Length(bonuses));
  end else begin
    FBonuses := nil;
  end;
  if Assigned(oilSlicks) then begin
    FOilSlicks := Copy(oilSlicks, 0, Length(oilSlicks));
  end else begin
    FOilSlicks := nil;
  end;
  FMapName := mapName;
  if Assigned(tilesXY) then begin
    SetLength(FTilesXY, Length(tilesXY));

    for i := High(tilesXY) downto 0 do begin
      if Assigned(tilesXY[i]) then begin
        FTilesXY[i] := Copy(tilesXY[i], 0, Length(tilesXY[i]));
      end else begin
        FTilesXY[i] := nil;
      end;
    end;
  end else begin
    FTilesXY := nil;
  end;
  if Assigned(waypoints) then begin
    SetLength(FWaypoints, Length(waypoints));

    for i := High(waypoints) downto 0 do begin
      if Assigned(waypoints[i]) then begin
        FWaypoints[i] := Copy(waypoints[i], 0, Length(waypoints[i]));
      end else begin
        FWaypoints[i] := nil;
      end;
    end;
  end else begin
    FWaypoints := nil;
  end;
  FStartingDirection := startingDirection;
end;

function TWorld.GetTick: LongInt;
begin
  result := FTick;
end;

function TWorld.GetTickCount: LongInt;
begin
  result := FTickCount;
end;

function TWorld.GetLastTickIndex: LongInt;
begin
  result := FLastTickIndex;
end;

function TWorld.GetWidth: LongInt;
begin
  result := FWidth;
end;

function TWorld.GetHeight: LongInt;
begin
  result := FHeight;
end;

function TWorld.GetPlayers: TPlayerArray;
begin
  if Assigned(FPlayers) then begin
    result := Copy(FPlayers, 0, Length(FPlayers));
  end else begin
    result := nil;
  end;
end;

function TWorld.GetCars: TCarArray;
begin
  if Assigned(FCars) then begin
    result := Copy(FCars, 0, Length(FCars));
  end else begin
    result := nil;
  end;
end;

function TWorld.GetProjectiles: TProjectileArray;
begin
  if Assigned(FProjectiles) then begin
    result := Copy(FProjectiles, 0, Length(FProjectiles));
  end else begin
    result := nil;
  end;
end;

function TWorld.GetBonuses: TBonusArray;
begin
  if Assigned(FBonuses) then begin
    result := Copy(FBonuses, 0, Length(FBonuses));
  end else begin
    result := nil;
  end;
end;

function TWorld.GetOilSlicks: TOilSlickArray;
begin
  if Assigned(FOilSlicks) then begin
    result := Copy(FOilSlicks, 0, Length(FOilSlicks));
  end else begin
    result := nil;
  end;
end;

function TWorld.GetMapName: String;
begin
  result := FMapName;
end;

function TWorld.GetTilesXY: TTileTypeArray2D;
var
  i: LongInt;

begin
  if Assigned(FTilesXY) then begin
    SetLength(result, Length(FTilesXY));

    for i := High(FTilesXY) downto 0 do begin
      if Assigned(FTilesXY[i]) then begin
        result[i] := Copy(FTilesXY[i], 0, Length(FTilesXY[i]));
      end else begin
        result[i] := nil;
      end;
    end;
  end else begin
    result := nil;
  end;
end;

function TWorld.GetWaypoints: TLongIntArray2D;
var
  i: LongInt;

begin
  if Assigned(FWaypoints) then begin
    SetLength(result, Length(FWaypoints));

    for i := High(FWaypoints) downto 0 do begin
      if Assigned(FWaypoints[i]) then begin
        result[i] := Copy(FWaypoints[i], 0, Length(FWaypoints[i]));
      end else begin
        result[i] := nil;
      end;
    end;
  end else begin
    result := nil;
  end;
end;

function TWorld.GetStartingDirection: TDirection;
begin
  result := FStartingDirection;
end;

function TWorld.GetMyPlayer: TPlayer;
var
  playerIndex: LongInt;

begin
  for playerIndex := High(FPlayers) downto 0 do begin
    if FPlayers[playerIndex].GetMe then begin
      result := FPlayers[playerIndex];
      exit;
    end;
  end;

  result := nil;
end;

destructor TWorld.Destroy;
var
  i: LongInt;

begin
  if Assigned(FPlayers) then begin
    for i := High(FPlayers) downto 0 do begin
      if Assigned(FPlayers[i]) then begin
        FPlayers[i].Free;
      end;
    end;
  end;

  if Assigned(FCars) then begin
    for i := High(FCars) downto 0 do begin
      if Assigned(FCars[i]) then begin
        FCars[i].Free;
      end;
    end;
  end;

  if Assigned(FProjectiles) then begin
    for i := High(FProjectiles) downto 0 do begin
      if Assigned(FProjectiles[i]) then begin
        FProjectiles[i].Free;
      end;
    end;
  end;

  if Assigned(FBonuses) then begin
    for i := High(FBonuses) downto 0 do begin
      if Assigned(FBonuses[i]) then begin
        FBonuses[i].Free;
      end;
    end;
  end;

  if Assigned(FOilSlicks) then begin
    for i := High(FOilSlicks) downto 0 do begin
      if Assigned(FOilSlicks[i]) then begin
        FOilSlicks[i].Free;
      end;
    end;
  end;

  inherited;
end;

end.
