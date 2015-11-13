unit PlayerControl;

interface

uses
  Math, TypeControl;

type
  TPlayer = class
  private
    FId: Int64;
    FIsMe: Boolean;
    FName: String;
    FStrategyCrashed: Boolean;
    FScore: LongInt;
    function GetId: Int64;
    function GetIsMe: Boolean;
    function GetName: string;
    function GetStrategyCrashed: Boolean;
    function GetScore: LongInt;
  public
    property Id: Int64 read GetId;
    property IsMe: Boolean read GetIsMe;
    property Name: string read GetName;
    property StrategyCrashed: Boolean read GetStrategyCrashed;
    property Score: LongInt read GetScore;
    constructor Create(const AId: Int64; const AIsMe: Boolean; const AName: string; 
      const AStrategyCrashed: Boolean; const AScore: LongInt);
    destructor Destroy; override;
  end;

  TPlayerArray = array of TPlayer;

implementation

function TPlayer.GetId: Int64;
begin
  Result := FId;
end;

function TPlayer.GetIsMe: Boolean;
begin
  Result := FIsMe;
end;

function TPlayer.GetName: string;
begin
  Result := FName;
end;

function TPlayer.GetStrategyCrashed: Boolean;
begin
  Result := FStrategyCrashed;
end;

function TPlayer.GetScore: LongInt;
begin
  Result := FScore;
end;

constructor TPlayer.Create(const AId: Int64; const AIsMe: Boolean; const AName: string; 
  const AStrategyCrashed: Boolean; const AScore: LongInt);
begin
  FId := AId;
  FIsMe := AIsMe;
  FName := AName;
  FStrategyCrashed := AStrategyCrashed;
  FScore := AScore;
end;

destructor TPlayer.Destroy;
begin
  inherited;
end;

end.
