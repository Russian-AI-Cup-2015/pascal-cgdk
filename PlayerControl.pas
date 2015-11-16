unit PlayerControl;

interface

uses
  Math, TypeControl;

type
  TPlayer = class
  private
    FId: Int64;
    FMe: Boolean;
    FName: String;
    FStrategyCrashed: Boolean;
    FScore: LongInt;

  public
    constructor Create(const id: Int64; const me: Boolean; const name: String; const strategyCrashed: Boolean;
      const score: LongInt);

    function GetId: Int64;
    property Id: Int64 read GetId;
    function GetMe: Boolean;
    property IsMe: Boolean read GetMe;
    function GetName: String;
    property Name: String read GetName;
    function GetStrategyCrashed: Boolean;
    property IsStrategyCrashed: Boolean read GetStrategyCrashed;
    function GetScore: LongInt;
    property Score: LongInt read GetScore;

    destructor Destroy; override;

  end;

  TPlayerArray = array of TPlayer;

implementation

constructor TPlayer.Create(const id: Int64; const me: Boolean; const name: String; const strategyCrashed: Boolean;
  const score: LongInt);
begin
  FId := id;
  FMe := me;
  FName := name;
  FStrategyCrashed := strategyCrashed;
  FScore := score;
end;

function TPlayer.GetId: Int64;
begin
  result := FId;
end;

function TPlayer.GetMe: Boolean;
begin
  result := FMe;
end;

function TPlayer.GetName: String;
begin
  result := FName;
end;

function TPlayer.GetStrategyCrashed: Boolean;
begin
  result := FStrategyCrashed;
end;

function TPlayer.GetScore: LongInt;
begin
  result := FScore;
end;

destructor TPlayer.Destroy;
begin
  inherited;
end;

end.
