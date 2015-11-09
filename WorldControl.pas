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
        constructor Create(tick: LongInt; tickCount: LongInt; lastTickIndex: LongInt; width: LongInt; height: LongInt;
                players: TPlayerArray; cars: TCarArray; projectiles: TProjectileArray; bonuses: TBonusArray;
                oilSlicks: TOilSlickArray; mapName: String; tilesXY: TTileTypeArray2D; waypoints: TLongIntArray2D;
                startingDirection: TDirection);

        function GetTick: LongInt;
        function GetTickCount: LongInt;
        function GetLastTickIndex: LongInt;
        function GetWidth: LongInt;
        function GetHeight: LongInt;
        function GetPlayers: TPlayerArray;
        function GetCars: TCarArray;
        function GetProjectiles: TProjectileArray;
        function GetBonuses: TBonusArray;
        function GetOilSlicks: TOilSlickArray;
        function GetMapName: String;
        function GetTilesXY: TTileTypeArray2D;
        function GetWaypoints: TLongIntArray2D;
        function GetStartingDirection: TDirection;

        function GetMyPlayer: TPlayer;

        destructor Destroy; override;

    end;

    TWorldArray = array of TWorld;

implementation

constructor TWorld.Create(tick: LongInt; tickCount: LongInt; lastTickIndex: LongInt; width: LongInt; height: LongInt;
        players: TPlayerArray; cars: TCarArray; projectiles: TProjectileArray; bonuses: TBonusArray;
        oilSlicks: TOilSlickArray; mapName: String; tilesXY: TTileTypeArray2D; waypoints: TLongIntArray2D;
        startingDirection: TDirection);
var
    i: LongInt;

begin
    FTick := tick;
    FTickCount := tickCount;
    FLastTickIndex := lastTickIndex;
    FWidth := width;
    FHeight := height;
    if players = nil then begin
        FPlayers := nil;
    end else begin
        FPlayers := Copy(players, 0, Length(players));
    end;
    if cars = nil then begin
        FCars := nil;
    end else begin
        FCars := Copy(cars, 0, Length(cars));
    end;
    if projectiles = nil then begin
        FProjectiles := nil;
    end else begin
        FProjectiles := Copy(projectiles, 0, Length(projectiles));
    end;
    if bonuses = nil then begin
        FBonuses := nil;
    end else begin
        FBonuses := Copy(bonuses, 0, Length(bonuses));
    end;
    if oilSlicks = nil then begin
        FOilSlicks := nil;
    end else begin
        FOilSlicks := Copy(oilSlicks, 0, Length(oilSlicks));
    end;
    FMapName := mapName;
    if tilesXY = nil then begin
        FTilesXY := nil;
    end else begin
        SetLength(FTilesXY, Length(tilesXY));

        for i := High(tilesXY) downto 0 do begin
            if tilesXY[i] = nil then begin
                FTilesXY[i] := nil;
            end else begin
                FTilesXY[i] := Copy(tilesXY[i], 0, Length(tilesXY[i]));
            end;
        end;
    end;
    if waypoints = nil then begin
        FWaypoints := nil;
    end else begin
        SetLength(FWaypoints, Length(waypoints));

        for i := High(waypoints) downto 0 do begin
            if waypoints[i] = nil then begin
                FWaypoints[i] := nil;
            end else begin
                FWaypoints[i] := Copy(waypoints[i], 0, Length(waypoints[i]));
            end;
        end;
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
    if FPlayers = nil then begin
        result := nil;
    end else begin
        result := Copy(FPlayers, 0, Length(FPlayers));
    end;
end;

function TWorld.GetCars: TCarArray;
begin
    if FCars = nil then begin
        result := nil;
    end else begin
        result := Copy(FCars, 0, Length(FCars));
    end;
end;

function TWorld.GetProjectiles: TProjectileArray;
begin
    if FProjectiles = nil then begin
        result := nil;
    end else begin
        result := Copy(FProjectiles, 0, Length(FProjectiles));
    end;
end;

function TWorld.GetBonuses: TBonusArray;
begin
    if FBonuses = nil then begin
        result := nil;
    end else begin
        result := Copy(FBonuses, 0, Length(FBonuses));
    end;
end;

function TWorld.GetOilSlicks: TOilSlickArray;
begin
    if FOilSlicks = nil then begin
        result := nil;
    end else begin
        result := Copy(FOilSlicks, 0, Length(FOilSlicks));
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
    if FTilesXY = nil then begin
        result := nil;
    end else begin
        SetLength(result, Length(FTilesXY));

        for i := High(FTilesXY) downto 0 do begin
            if FTilesXY[i] = nil then begin
                result[i] := nil;
            end else begin
                result[i] := Copy(FTilesXY[i], 0, Length(FTilesXY[i]));
            end;
        end;
    end;
end;

function TWorld.GetWaypoints: TLongIntArray2D;
var
    i: LongInt;

begin
    if FWaypoints = nil then begin
        result := nil;
    end else begin
        SetLength(result, Length(FWaypoints));

        for i := High(FWaypoints) downto 0 do begin
            if FWaypoints[i] = nil then begin
                result[i] := nil;
            end else begin
                result[i] := Copy(FWaypoints[i], 0, Length(FWaypoints[i]));
            end;
        end;
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
    if FPlayers <> nil then begin
        for i := High(FPlayers) downto 0 do begin
            if FPlayers[i] <> nil then begin
                FPlayers[i].Free;
            end;
        end;
    end;

    if FCars <> nil then begin
        for i := High(FCars) downto 0 do begin
            if FCars[i] <> nil then begin
                FCars[i].Free;
            end;
        end;
    end;

    if FProjectiles <> nil then begin
        for i := High(FProjectiles) downto 0 do begin
            if FProjectiles[i] <> nil then begin
                FProjectiles[i].Free;
            end;
        end;
    end;

    if FBonuses <> nil then begin
        for i := High(FBonuses) downto 0 do begin
            if FBonuses[i] <> nil then begin
                FBonuses[i].Free;
            end;
        end;
    end;

    if FOilSlicks <> nil then begin
        for i := High(FOilSlicks) downto 0 do begin
            if FOilSlicks[i] <> nil then begin
                FOilSlicks[i].Free;
            end;
        end;
    end;

    inherited;
end;

end.
