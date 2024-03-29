﻿// #define true 1
// #define false 0

private ["_type","_crewType","_typicalCargo","_unit","_crew","_vehicle","_grp","_entry","_hasDriver","_turrets"];
_vehicle = _this select 0;
_grp = _this select 1;

_type = typeOf _vehicle;

_entry = configFile >> "CfgVehicles" >> _type;
_crew = [];

if ((count _this) > 2) then {
	_typicalCargo = (_this select 2);
	_crewType = (_typicalCargo select 0);
}else{
	_typicalCargo=[];
	if (((getNumber (_entry >> "side")) call m_fnc_getSide) == side _grp) then {
		_crewType = getText (_entry >> "crew");
	}else{
		_crewType = ([side _grp, _type] call m_fnc_defaultCrew);
	};
};

_hasDriver = getNumber (_entry >> "hasDriver");

if ((_hasDriver == 1) && (isNull (driver _vehicle))) then
{
		_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "FORM"];
		_crew = _crew + [_unit];

		_unit moveInDriver _vehicle;
};

_turrets = ([_entry >> "turrets",[]] call m_fnc_returnVehicleTurrets);
if(_type == "I_MBT_03_cannon_F")then{
	_turrets = [[0],[0,0]];
};
if(_type == "M1A2_TUSK_MG")then{
	_turrets = [[0],[0,0]];
};
if(_type == "M1A2_US_TUSK_MG_EP1")then{
	_turrets = [[0],[0,0]];
};
if(_type == "FDF_leopard2a4")then{
	_turrets = [[0],[0,0]];
};

{
	if (isNull (_vehicle turretUnit _x)) then {
		if(count _typicalCargo > count _crew)then{
			_unit = _grp createUnit [(_typicalCargo select (count _crew)), position _vehicle, [], 0, "FORM"];
		}else{
			_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "FORM"];
		};
		_unit moveInTurret [_vehicle, _x];
		if(_vehicle getCargoIndex _unit == -1) then {
			_crew = _crew + [_unit];
		}else{
			deleteVehicle _unit;
		};
	};
} forEach _turrets;

_crew
