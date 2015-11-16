uses
  SysUtils, RemoteProcessClient, StrategyControl, MyStrategy,
  CarControl, PlayerContextControl, MoveControl, GameControl;

type
  TRunner = class
  private
    FRemoteProcessClient: TRemoteProcessClient;
    FToken: String;

  public
    constructor Create(arguments: array of String);

    procedure Run;

    destructor Destroy; override;

  end;

constructor TRunner.Create(arguments: array of String);
begin
  if Length(arguments) = 4 then begin
    FRemoteProcessClient := TRemoteProcessClient.Create(arguments[1], StrToInt(arguments[2]));
    FToken := arguments[3];
  end else begin
    FRemoteProcessClient := TRemoteProcessClient.Create('127.0.0.1', 31001);
    FToken := '0000000000000000';
  end;
end;

procedure TRunner.Run;
var
  teamSize: LongInt;
  carIndex: LongInt;
  strategyIndex: LongInt;
  strategies: array of TStrategy;
  playerCar: TCar;
  playerCars: TCarArray;
  playerContext: TPlayerContext;
  move: TMove;
  moves: TMoveArray;
  game: TGame;

begin
  FRemoteProcessClient.WriteTokenMessage(FToken);
  teamSize := FRemoteProcessClient.ReadTeamSizeMessage;
  FRemoteProcessClient.WriteProtocolVersionMessage;
  game := FRemoteProcessClient.ReadGameContextMessage;

  SetLength(strategies, teamSize);

  for strategyIndex := 0 to teamSize - 1 do begin
    strategies[strategyIndex] := TMyStrategy.Create;
  end;

  while true do begin
    playerContext := FRemoteProcessClient.ReadPlayerContextMessage;
    if playerContext = nil then begin
      break;
    end;

    playerCars := playerContext.GetCars;
    if Length(playerCars) <> teamSize then begin
      break;
    end;

    SetLength(moves, teamSize);

    for carIndex := 0 to teamSize - 1 do begin
      playerCar := playerCars[carIndex];

      move := TMove.Create;
      moves[carIndex] := move;
      strategies[playerCar.GetTeammateIndex].Move(playerCar, playerContext.GetWorld, game, move);
    end;

    FRemoteProcessClient.WriteMovesMessage(moves);

    for carIndex := 0 to teamSize - 1 do begin
      moves[carIndex].Free;
    end;

    SetLength(moves, 0);

    playerContext.Free;
  end;

  for strategyIndex := 0 to teamSize - 1 do begin
    strategies[strategyIndex].Free;
  end;

  SetLength(strategies, 0);
end;

destructor TRunner.Destroy;
begin
  FRemoteProcessClient.Free;

  inherited;
end;

var
  i: LongInt;
  runner: TRunner;
  arguments: array of String;

begin
  try
    SetLength(arguments, paramCount + 1);

    for i := 0 to paramCount do begin
      arguments[i] := ParamStr(i);
    end;

    runner := TRunner.Create(arguments);
    runner.Run;
    runner.Free;

    SetLength(arguments, 0);
  except
    on E: Exception do begin
      WriteLn('Exception occured: type=', E.ClassName, ', message="', E.Message, '".');
      HALT(239);
    end;
  end;
end.
