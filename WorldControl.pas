unit WorldControl;

interface

uses
  SysUtils, Math, TypeControl, BonusControl, CarControl, DirectionControl, OilSlickControl, 
  PlayerControl, ProjectileControl, TileTypeControl;

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
    FMapName: string;
    FTilesXY: TTileTypeArray2D;
    FWaypoints: TLongIntArray2D;
    FStartingDirection: TDirection;
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
    function GetMapName: string;
    function GetTilesXY: TTileTypeArray2D;
    function GetWaypoints: TLongIntArray2D;
    function GetStartingDirection: TDirection;
    function GetMyPlayer: TPlayer;
  public
    property Tick: LongInt read GetTick;
    property TickCount: LongInt read GetTickCount;
    property LastTickIndex: LongInt read GetLastTickIndex;
    property Width: LongInt read GetWidth;
    property Height: LongInt read GetHeight;
    property Players: TPlayerArray read GetPlayers;
    property Cars: TCarArray read GetCars;
    property Projectiles: TProjectileArray read GetProjectiles;
    property Bonuses: TBonusArray read GetBonuses;
    property OilSlicks: TOilSlickArray read GetOilSlicks;
    property MapName: string read GetMapName;
    property TilesXY: TTileTypeArray2D read GetTilesXY;
    property Waypoints: TLongIntArray2D read GetWaypoints;
    property StartingDirection: TDirection read GetStartingDirection;
    property MyPlayer: TPlayer read GetMyPlayer;
    constructor Create(const ATick: LongInt; const ATickCount: LongInt; const ALastTickIndex: LongInt; 
      const AWidth: LongInt; const AHeight: LongInt; const APlayers: TPlayerArray; 
      const ACars: TCarArray; const AProjecTiles: TProjectileArray; const ABonuses: TBonusArray; 
      const AOilSlicks: TOilSlickArray; const AMapName: string; const ATilesXY: TTileTypeArray2D; 
      const AWayPoints: TLongIntArray2D; const AStartingDirection: TDirection);
    destructor Destroy; override;
  end;

  TWorldArray = array of TWorld;

implementation

function TWorld.GetTick: LongInt;
begin
  Result := FTick;
end;

function TWorld.GetTickCount: LongInt;
begin
  Result := FTickCount;
end;

function TWorld.GetLastTickIndex: LongInt;
begin
  Result := FLastTickIndex;
end;

function TWorld.GetWidth: LongInt;
begin
  Result := FWidth;
end;

function TWorld.GetHeight: LongInt;
begin
  Result := FHeight;
end;

function TWorld.GetPlayers: TPlayerArray;
begin
  if Assigned(FPlayers) then 
    Result := Copy(FPlayers, 0, Length(FPlayers))
  else
    Result := nil;
end;

function TWorld.GetCars: TCarArray;
begin
  if Assigned(FCars) then 
    Result := Copy(FCars, 0, Length(FCars))
  else
    Result := nil;
end;

function TWorld.GetProjectiles: TProjectileArray;
begin
  if Assigned(FProjectiles) then
    Result := Copy(FProjectiles, 0, Length(FProjectiles))
  else  
    Result := nil;
end;

function TWorld.GetBonuses: TBonusArray;
begin
  if Assigned(FBonuses) then 
    Result := Copy(FBonuses, 0, Length(FBonuses))
  else  
    Result := nil;
end;

function TWorld.GetOilSlicks: TOilSlickArray;
begin
  if Assigned(FOilSlicks) then
    Result := Copy(FOilSlicks, 0, Length(FOilSlicks))
  else  
    Result := nil;
end;

function TWorld.GetMapName: string;
begin
  Result := FMapName;
end;

function TWorld.GetTilesXY: TTileTypeArray2D;
var
  I: LongInt;
begin
  if Assigned(FTilesXY) then 
  begin
    SetLength(Result, Length(FTilesXY));
    if Length(FTilesXY) > 0 then
    begin
      for i := High(FTilesXY) downto 0 do 
      begin
        if Assigned(FTilesXY[I]) then
          Result[i] := Copy(FTilesXY[I], 0, Length(FTilesXY[I]))
        else
          Result[i] := nil;
      end;
    end;
  end
  else
    Result := nil;
end;

function TWorld.GetWaypoints: TLongIntArray2D;
var
  I: LongInt;
begin
  if Assigned(FWaypoints) then 
  begin
    SetLength(Result, Length(FWaypoints));
    if Length(FWaypoints) > 0 then
    begin
      for I := High(FWaypoints) downto 0 do 
      begin
        if Assigned(FWaypoints[I]) then
          Result[I] := Copy(FWaypoints[I], 0, Length(FWaypoints[I]))
        else
          Result[I] := nil;
      end;
    end;
  end
  else
    Result := nil;
end;

function TWorld.GetStartingDirection: TDirection;
begin
  Result := FStartingDirection;
end;

function TWorld.GetMyPlayer: TPlayer;
var
  I: LongInt;
begin
  Result := nil;
  if Length(FPlayers) > 0 then
  begin
    for I := High(FPlayers) downto 0 do 
    begin
      if FPlayers[I].IsMe then 
      begin
        Result := FPlayers[I];
        Exit;
      end;
    end;
  end;
end;

constructor TWorld.Create(const ATick: LongInt; const ATickCount: LongInt; const ALastTickIndex: LongInt; 
  const AWidth: LongInt; const AHeight: LongInt; const APlayers: TPlayerArray; 
  const ACars: TCarArray; const AProjectiles: TProjectileArray; const ABonuses: TBonusArray; 
  const AOilSlicks: TOilSlickArray; const AMapName: string; const ATilesXY: TTileTypeArray2D; 
  const AWayPoints: TLongIntArray2D; const AStartingDirection: TDirection);
var
  I: LongInt;
begin
  FTick := ATick;
  FTickCount := ATickCount;
  FLastTickIndex := ALastTickIndex;
  FWidth := AWidth;
  FHeight := AHeight;
  if Assigned(APlayers) then
    FPlayers := Copy(APlayers, 0, Length(APlayers))
  else
    FPlayers := nil;
  if Assigned(ACars) then
    FCars := Copy(ACars, 0, Length(ACars))
  else  
    FCars := nil;
  if Assigned(AProjectiles) then
    FProjectiles := Copy(AProjectiles, 0, Length(AProjectiles))
  else
    FProjectiles := nil;
  if Assigned(ABonuses) then
    FBonuses := Copy(ABonuses, 0, Length(ABonuses))
  else  
    FBonuses := nil;
  if Assigned(AOilSlicks) then 
    FOilSlicks := Copy(AOilSlicks, 0, Length(AOilSlicks))
  else
    FOilSlicks := nil;
  FMapName := AMapName;
  if Assigned(ATilesXY) then
  begin
    SetLength(FTilesXY, Length(ATilesXY));
    if Length(ATilesXY) > 0 then
    begin
      for I := High(ATilesXY) downto 0 do 
      begin
        if Assigned(ATilesXY[I]) then
          FTilesXY[I] := Copy(ATilesXY[I], 0, Length(ATilesXY[I]))
        else  
          FTilesXY[I] := nil;
      end;
    end;
  end  
  else
    FTilesXY := nil;
  if Assigned(AWaypoints) then 
  begin
    SetLength(FWaypoints, Length(AWaypoints));
    if Length(AWaypoints) > 0 then
    begin
      for I := High(AWaypoints) downto 0 do 
      begin
        if Assigned(AWaypoints[I]) then 
          FWaypoints[I] := Copy(AWaypoints[I], 0, Length(AWaypoints[I]))
        else  
          FWaypoints[I] := nil;
      end;
    end;
  end
  else
    FWaypoints := nil;
  FStartingDirection := AStartingDirection;
end;

destructor TWorld.Destroy;
var
  I: LongInt;
begin
  if Assigned(FPlayers) then 
  begin
    if Length(FPlayers) > 0 then
    begin
      for I := High(FPlayers) downto 0 do 
      begin
        if Assigned(FPlayers[I]) then 
          FPlayers[I].Free;
      end;
      SetLength(FPlayers, 0);
    end;
  end;
  if Assigned(FCars) then 
  begin
    if Length(FCars) > 0 then
    begin
      for I := High(FCars) downto 0 do 
      begin
        if Assigned(FCars[I]) then 
          FCars[I].Free;
      end;
      SetLength(FCars, 0);
    end;
  end;
  if Assigned(FProjectiles) then 
  begin
    if Length(FProjectiles) > 0 then
    begin
      for I := High(FProjectiles) downto 0 do 
      begin
        if Assigned(FProjectiles[I]) then 
          FProjectiles[I].Free;
      end;
      SetLength(FProjectiles, 0);
    end;
  end;
  if Assigned(FBonuses) then 
  begin
    if Length(FBonuses) > 0 then
    begin
      for I := High(FBonuses) downto 0 do 
      begin
        if Assigned(FBonuses[I]) then 
          FBonuses[I].Free;
      end;
      SetLength(FBonuses, 0);
    end;
  end;
  if Assigned(FOilSlicks) then 
  begin
    if Length(FOilSlicks) > 0 then
    begin
      for I := High(FOilSlicks) downto 0 do 
      begin
        if Assigned(FOilSlicks[I]) then 
          FOilSlicks[i].Free;
      end;
      SetLength(FOilSlicks, 0);
    end;
  end;
  inherited;
end;

end.
