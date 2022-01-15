private["_unit","_healer","_isMedic"];

_unit = _this select 0;
_healer = _this select 1;
_isMedic = _this select 2;

if (lifestate _unit == "HEALTHY") exitWith {false};

_healer attachto [_unit,[-0.75,0.1,0],""];
_healer setdir 90;

_healer playActionNow "medicStart";
sleep 5;
detach _healer;
if (lifestate _healer == "INCAPACITATED") exitWith {false};
_healer playActionNow "medicStop";

if (_isMedic) then {
	_unit setdamage (damage _unit / 2);
};

_unit setvariable ["BIS_lifeState","HEALTHY",true];
waitUntil{lifestate _unit == "HEALTHY" or lifestate _healer == "INCAPACITATED" or !alive _unit or !alive _healer};
AISFinishHeal _this;
