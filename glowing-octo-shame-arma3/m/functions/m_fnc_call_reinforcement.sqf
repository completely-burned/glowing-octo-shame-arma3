﻿private["_side"];
if(count _this > 0)then{
		_side = _this select 0;
}else{
		//_side = [east,west,resistance] call BIS_fnc_selectRandom;
		_side = [[east,west,resistance],[0.5,0.5,0.5]] call BIS_fnc_selectRandomWeighted;
};

private["_pos"];
private["_typeList"];
private["_patrol"];
if(count _this > 1)then{
	private ["_players"];
	if(isMultiplayer)then{
		_players = [];
		{
			if(isPlayer _x) then
			{
				// [_players, _x] call BIS_fnc_arrayPush;
				_players = (_players + [_x]);
			}
		} foreach playableUnits;
	}else{
		_players = [player];
	};
	if (count _players > 0) then {
		_pos = getPos (_players call BIS_fnc_selectRandom);
	}else{
		_pos = civilianBasePos;
	};
	_patrol = true;
}else{
	_pos = civilianBasePos;
	_patrol = false;
	//_typeList=GroupsAll;
};

if(_patrol)then{
	switch (_side) do {
		case (east):
		{
			_typeList=AllGroupsEastOld;
		};
		case (west):
		{
			_typeList=AllGroupsWestOld;
		};
		case (resistance):
		{
			_typeList=AllGroupsGuerrilaOld;
		};
		default {};
	};
}else{
	switch (_side) do {
		case (east):
		{
			_typeList=AllGroupsEast;
		};
		case (west):
		{
			_typeList=AllGroupsWest;
		};
		case (resistance):
		{
			_typeList=AllGroupsGuerrila;
		};
		default {};
	};
};

private["_grp1"];
private["_types"];
private["_SafePosParams"];
private["_pos_resp"];
_grp1 = (_typeList call BIS_fnc_selectRandomWeighted);
_types = [_grp1, [0, 0, 0]] call BIS_fnc_returnNestedElement;

if(_types call draga_fnc_CheckSupport)then{
	_pos_resp = [];
}else{
_SafePosParams = ([_types] call m_fnc_SafePosParams);

if (_patrol)then{
	_SafePosParams set [0,((_SafePosParams select 0) * 2)];
	_SafePosParams set [1,((_SafePosParams select 1) * 2)];
};

_pos_resp = ([_pos]+_SafePosParams+[_side] call m_fnc_findSafePos);
};

if(count _pos_resp > 0)then{
private["_groups"];
_groups = ([_pos_resp, _side, _grp1 select 0] call m_fnc_spawnGroup);

private ["_units","_vehicles","_crew","_cargo"];
_units = []; _vehicles=[]; _crew = []; _cargo=[];
{
	private ["_grp"];
	_grp = _x;
	if(_patrol)then{
		_grp setVariable ["patrol", true];
	};
	{
		_units set [count _units, _x];
		private ["_veh"];
		_veh = vehicle _x;
		if(_veh != _x)then{
			_crew set [count _crew, _x];
			if!(_veh in _vehicles)then{
				_vehicles set [count _vehicles, _veh];
			};
		}else{
			_cargo set [count _cargo, _x];
		};
		while {(count (waypoints _grp)) > 0} do
		{
			deleteWaypoint ((waypoints _grp) select 0);
		};
	}forEach units _grp;

	_grp enableIRLasers true;
	_grp enableGunLights "forceOn";

}forEach _groups;

private["_cargo2"];
_cargo2 = _cargo - (units (_groups select 0));

{
	_x setSkill m_skill;
	_x enableAI "TARGET";
	_x enableAI "AUTOTARGET";
	_x setSkill ["commanding", 1];
} foreach _units + _vehicles;

[_units + _vehicles] call m_fnc_reweapon; // перевооружить
// _units call m_fnc_RankToSkill; //выставить skill в зависимости от ранга
if (count _vehicles > 0) then {
	[_vehicles, _cargo] call m_fnc_MoveInCargo; // посадить в багажное отделение
};


// время удаления, и прочее
private["_random2","_random5","_random10"];
_random2 = random 2; _random5 = random 5; _random10 = random 10;
if (_patrol)then{
	{
		_x setVariable ["time", time + (60 * 9) + (60 * _random2)];
	} foreach (_units );
	_groups select 0 setVariable ["patrol_pos", _pos_resp];
	_groups select 0 setBehaviour "SAFE";
}else{
	if (("air" in _types) || ("plane" in _types) || ("uav" in _types))then{
		{
			_x setVariable ["time", time + (60 * (5 + _random5))];
		} foreach _units;
	}else{
		{
			_x setVariable ["time", time + (60 * (40 + _random10))];
		} foreach (_units);
	};
};

if(count _cargo2 > 0)then{
	{
		_x setVariable ["time", time + (60 * (10 + _random5))];
	} foreach (_cargo2);
};

{_x setVariable ["grp_created",true]}forEach _groups;

_groups;
}else{
	grpNull;
};
