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
        constructor Create(id: Int64; me: Boolean; name: String; strategyCrashed: Boolean; score: LongInt);

        function GetId: Int64;
        function GetMe: Boolean;
        function GetName: String;
        function GetStrategyCrashed: Boolean;
        function GetScore: LongInt;

        destructor Destroy; override;

    end;

    TPlayerArray = array of TPlayer;

implementation

constructor TPlayer.Create(id: Int64; me: Boolean; name: String; strategyCrashed: Boolean; score: LongInt);
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
