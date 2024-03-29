﻿private ["_type","_HQ","_fnc_1","_isUAV"];
_type = _this Select 0;

_HQ = HQ;

_isUAV=false;
if(_type isKindOf "UAV")then{
	_isUAV=true;
}else{
	if(getNumber (LIB_cfgVeh >> _type >> "isUav") == 1)then{
		_isUAV=true;
	};
};

_fnc_1={
	_this setVectorUp [0,0,1];
	group player addVehicle _this;
	player reveal _this;
	[[_this], true] call m_fnc_reweapon;
	{
	    _x disableAI "AUTOCOMBAT";
	} forEach crew _this;
};

private ["_respawn_pos"];
_respawn_pos = [vehicle player, 101] call draga_fnc_CheckRespawnDistance;

if (true) then {
	if (_type == "draga_megaAmmoBox") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
				Private["_pos"];
				_pos = position vehicle player;
				_pos = [_pos, 1.5, getDir vehicle player] call BIS_fnc_relPos;
				Private["_veh"];
				_veh = ("Box_NATO_Wps_F" createVehicleLocal _pos);
				_veh setPos _pos;
				player reveal _veh;
				_veh setVariable ["draga_megaAmmoBox",true];
				hint format["%1: %2", localize "str_support_done", "Box_NATO_Wps_F"];
		};
	};
	if ((_type isKindOf "ReammoBox_F") or (_type isKindOf "ReammoBox") or (getText(configFile >> "CfgVehicles" >> _type >> "vehicleclass") in ["Ammo","ACE_Ammunition"])) then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
				Private["_pos"];
				_pos = position vehicle player;
				_pos = [_pos, 1.5, getDir vehicle player] call BIS_fnc_relPos;
				Private["_veh"];
				_veh = (_type createVehicleLocal _pos);
				_veh setPos _pos;
				player reveal _veh;
				hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "Man") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0 ) or _respawn_pos) then {
			if ((count units player) < 10 or true)then{
				Private["_pos"];
				_pos = position vehicle player;
				// _pos = ([_pos, (sizeOf typeOf (_Objects select 0)) / 2 + (sizeOf _type) / 2, random 360] call BIS_fnc_relPos);
				if (true or !isMultiplayer) then {
					Private["_veh"];
					_veh = (group player createUnit [_type, _pos, [], 0.2, "FORM"]);
					if(!isMultiplayer)then{
						addSwitchableUnit _veh;
						Private["_cost","_rank"];
						_cost = getNumber (configFile >> "CfgVehicles" >> _type >> "cost");
						_rank="PRIVATE";
						if(_cost>=50000)then{_rank="CORPORAL"};
						if(_cost>=150000)then{_rank="SERGEANT"};
						if(_cost>=250000)then{_rank="LIEUTENANT"};
						if(_cost>=350000)then{_rank="CAPTAIN"};
						if(_cost>=500000)then{_rank="MAJOR"};
						if(_cost>=750000)then{_rank="COLONEL"};
						_veh setRank _rank;
					};
					_veh call _fnc_1;
					hint format["%1: %2", localize "str_support_done", _type];
				}else{
					// _type createUnit [_pos, group player,"
									// if (isServer) then {
										// this addEventHandler ['killed',{[_this select 0] call BIS_GC_trashItFunc}];
										// if ((!alive this) or (isNil 'BIS_GC_trashItFunc')) then {
											// deleteVehicle this;
										// };
									// };
					// "];
				};
			}else{
				hint "10 max";
			};
		};
	};
	if (_type isKindOf "Car") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBLightFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0)  or _respawn_pos) then {
			Private["_veh"];
			_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
			_veh setDir getDir vehicle player;
			Private["_pos"];
			_pos = position vehicle player;
			_pos resize 2;
			_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "Motorcycle") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBLightFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
			Private["_veh"];
			_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
			_veh setDir getDir vehicle player;
			Private["_pos"];
			_pos = position vehicle player;
			_pos resize 2;
			_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "Tank") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBHeavyFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
			Private["_veh"];
			_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
			_veh setDir getDir vehicle player;
			Private["_pos"];
			_pos = position vehicle player;
			_pos resize 2;
			_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "Helicopter") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBAircraftFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
			if(_isUAV)then{
				Private["_side","_grp","_wp"];
				_side = playerSide;
				_grp = createGroup _side;
				_pos = ([_pos]+([[_type]] call m_fnc_SafePosParams)+[_side] call m_fnc_findSafePos);
				Private["_veh"];
				_veh = [_pos, random 360, _type, _grp] call m_fnc_spawnVehicle;
				_veh = _veh select 0;
				_veh call _fnc_1;
				_wp = _grp addWaypoint [getPos player, draga_distanceCoinBase];
				_wp setWaypointType "MOVE";
				hint format["%1: %2", localize "str_support_done", _type];
			}else{
				Private["_veh"];
				_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
				_veh setDir getDir vehicle player;
				Private["_pos"];
				_pos = position vehicle player;
				_pos resize 2;
				_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
				_veh call _fnc_1;
				hint format["%1: %2", localize "str_support_done", _type];
			};
		};
	};
	if (_type isKindOf "Plane") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, _HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
			if(_type isKindOf "UAV")then{
				Private["_side","_grp","_wp"];
				_side = playerSide;
				_grp = createGroup _side;
				_pos = ([_pos]+([[_type]] call m_fnc_SafePosParams)+[_side] call m_fnc_findSafePos);
				Private["_veh"];
				_veh = [_pos, random 360, _type, _grp] call m_fnc_spawnVehicle;
				_veh = _veh select 0;
				_veh call _fnc_1;
				_wp = _grp addWaypoint [getPos player, 100];
				_wp setWaypointType "MOVE";
				hint format["%1: %2", localize "str_support_done", _type];
			}else{
				Private["_veh"];
				_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
				_veh setDir getDir vehicle player;
				Private["_pos"];
				_pos = position vehicle player;
				_pos resize 2;
				_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
				_veh call _fnc_1;
			};
			hint format["%1: %2", localize "str_support_done", _type];
		}else{
			if (_type isKindOf "MV22") then {
				_Objects = (nearestObjects [vehicle player, ["Base_WarfareBAircraftFactory"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
				if ( (count _Objects > 0) or _respawn_pos) then {
					Private["_veh"];
					_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
					_veh setDir getDir vehicle player;
					Private["_pos"];
					_pos = position vehicle player;
					_pos resize 2;
					_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
					_veh call _fnc_1;
					hint format["%1: %2", localize "str_support_done", _type];
				};
			};
		};
	};
	if ((_type isKindOf "Ship")) then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, pier, draga_distanceCoinBase]);
		if ( count _Objects > 0 ) then {
			Private["_Object","_dir","_pos","_veh","_vel","_speed"];
			_Object = (_Objects select 0);
			_dir = direction _Object;
			_pos = position _Object;
			_pos = _pos findEmptyPosition [0,100,_type];
			_veh = createVehicle[_type, [0,0], [], 5, "FORM"];
			// _pos = ([_pos, (sizeOf typeOf _Object) / 2 + (sizeOf _type) / 2, (180 + _dir)] call BIS_fnc_relPos);
			_dir = [_veh, _Object] call BIS_fnc_dirTo;
			_veh setDir (_dir+180);
			_vel = velocity _veh;
			_dir = direction _veh;
			_veh setPos ([_pos,0, 1 max sizeOf _type, true] call draga_fn_getSafePos);
			_speed = -3;
			_veh call _fnc_1;
			hint format["%1: %2", localize "str_support_done", _type];
		};
	};
	if (_type isKindOf "StaticWeapon") then {
		Private["_Objects"];
		_Objects = (nearestObjects [vehicle player, ["Base_WarfareBBarracks"]+_HQ+Airport+["WarfareBDepot","WarfareBCamp"], draga_distanceCoinBase]);
		if ( (count _Objects > 0) or _respawn_pos) then {
			if(getNumber (LIB_cfgVeh >> _type >> "isUav") == 1 or getText(LIB_cfgVeh >> _type >> "vehicleClass") == "Autonomous")then{
				Private["_side","_grp","_list","_grp2","_obj"];
				_side = playerSide;
				_pos = position vehicle player;;
				_pos resize 2;
				_list = _pos nearEntities ["StaticWeapon", 300];
				scopeName "scopeName_list";
				{
					_obj = _x;
					_grp2 = group _obj;
						if (({isPlayer _x} count units _grp2) == 0 && (_side == side _obj) && !isNull _grp2) then {
								_grp = _grp2;
								breakTo "scopeName_list";
						};
				} forEach _list;
				if (isNil {_grp}) then {
					 _grp = createGroup _side;
				};
				Private["_veh"];
				_veh = [_pos, random 360, _type, _grp] call m_fnc_spawnVehicle;
				_veh = _veh select 0;
				_veh setDir getDir vehicle player;
				_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
				_veh call _fnc_1;
				hint format["%1: %2", localize "str_support_done", _type];
			}else{
				Private["_veh"];
				_veh = (createVehicle [_type, [0,0], [], 20, "FORM"]);
				_veh setDir getDir vehicle player;
				Private["_pos"];
				_pos = position vehicle player;
				_pos resize 2;
				_veh setPos ([_pos,0, 1 max sizeOf _type] call draga_fn_getSafePos);
				_veh call _fnc_1;
				hint format["%1: %2", localize "str_support_done", _type];
			};
		};
	};
	// [_type] call m_fnc_setTimeAvailableVehiclesBuyMenu;
}else{
	hint format ["respawn safe distance %1m",safeDistance];
};
