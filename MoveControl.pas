unit MoveControl;

interface

uses
    Math, TypeControl;

type
    TMove = class
    private
        FEnginePower: Double;
        FBrake: Boolean;
        FWheelTurn: Double;
        FThrowProjectile: Boolean;
        FUseNitro: Boolean;
        FSpillOil: Boolean;

    public
        constructor Create;

        function GetEnginePower: Double;
        procedure SetEnginePower(enginePower: Double);
        function GetBrake: Boolean;
        procedure SetBrake(brake: Boolean);
        function GetWheelTurn: Double;
        procedure SetWheelTurn(wheelTurn: Double);
        function GetThrowProjectile: Boolean;
        procedure SetThrowProjectile(throwProjectile: Boolean);
        function GetUseNitro: Boolean;
        procedure SetUseNitro(useNitro: Boolean);
        function GetSpillOil: Boolean;
        procedure SetSpillOil(spillOil: Boolean);

        destructor Destroy; override;

    end;

    TMoveArray = array of TMove;

implementation

constructor TMove.Create;
begin
    FEnginePower := 0.0;
    FBrake := False;
    FWheelTurn := 0.0;
    FThrowProjectile := False;
    FUseNitro := False;
    FSpillOil := False;
end;

function TMove.GetEnginePower: Double;
begin
    result := FEnginePower;
end;

procedure TMove.SetEnginePower(enginePower: Double);
begin
    FEnginePower := enginePower;
end;

function TMove.GetBrake: Boolean;
begin
    result := FBrake;
end;

procedure TMove.SetBrake(brake: Boolean);
begin
    FBrake := brake;
end;

function TMove.GetWheelTurn: Double;
begin
    result := FWheelTurn;
end;

procedure TMove.SetWheelTurn(wheelTurn: Double);
begin
    FWheelTurn := wheelTurn;
end;

function TMove.GetThrowProjectile: Boolean;
begin
    result := FThrowProjectile;
end;

procedure TMove.SetThrowProjectile(throwProjectile: Boolean);
begin
    FThrowProjectile := throwProjectile;
end;

function TMove.GetUseNitro: Boolean;
begin
    result := FUseNitro;
end;

procedure TMove.SetUseNitro(useNitro: Boolean);
begin
    FUseNitro := useNitro;
end;

function TMove.GetSpillOil: Boolean;
begin
    result := FSpillOil;
end;

procedure TMove.SetSpillOil(spillOil: Boolean);
begin
    FSpillOil := spillOil;
end;

destructor TMove.Destroy;
begin
    inherited;
end;

end.
