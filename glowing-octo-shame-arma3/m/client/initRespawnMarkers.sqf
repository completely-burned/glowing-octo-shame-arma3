private ["_side_str","_markerColor"];
switch (playerSide) do {
	case (resistance):
	{
		_side_str = "guerrila";
		_markerColor = "ColorGUER";
	};
	case (civilian):
	{
		_side_str = "civilian";
		_markerColor = "ColorCIV";
	};
	case (west):
	{
		_side_str = "west";
		_markerColor = "ColorWEST";
	};
	case (east):
	{
		_side_str = "east";
		_markerColor = "ColorEAST";
	};
	default {
		_side_str = str playerSide;
		_markerColor = "Default";
	};
};

private ["_objects"];
_objects = [];
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;

private ["_respawnMarkers"];
_respawnMarkers = [];

for "_i" from 0 to (count _objects - 1) do {
	private ["_obj","_marker","_pos"];
	_obj = _objects select _i;
	_pos = getPos _obj;
	if(_i == 0)then{
		_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	}else{
		_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i], _pos];
	};
	_marker setMarkerTypeLocal "respawn_inf";
	_marker setMarkerColorLocal _markerColor;
	_respawnMarkers set [count _respawnMarkers, _marker];
};

draga_respawnMarkers = _respawnMarkers;

if(true)then{

	private ["_markers","_units"];
	_markers = [];
	_units = [];

	while {true} do {
		{
			if(!(_x in _units) && (side _x == playerSide))then{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x,position _x]];
			};
		}forEach playableUnits;
		{
			if(!(_x in _units) && ([[_x],listMHQ] call m_fnc_CheckIsKindOfArray))then{
				_units set [count _units, _x];
				_markers set [count _markers, createMarkerLocal [str _x + "_veh",position _x]];
			};
		}forEach vehicles;

		for "_i" from 0 to (count _units - 1) do {
			private ["_unit","_marker"];
			_unit = (_units select _i);
			_marker = (_markers select _i);
			if (!isNull _unit && alive _unit) then {
				if([[_unit],listMHQ] call m_fnc_CheckIsKindOfArray && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call m_fnc_getSide getFriend playerSide < 0.6))then{
					if ({isPlayer _x} count crew _unit == 0) then {	
						_marker setMarkerPosLocal (position _unit);
						_marker setMarkerTypeLocal "hd_dot";
						_marker setMarkerDirLocal getDir _unit;
						_marker setMarkerSizeLocal [1,1];
						_marker setMarkerColorLocal _markerColor;
					}else{
						_marker setMarkerPosLocal [35000,35000];
					};
				}else{
					private ["_veh"];
					_veh = vehicle _unit;							
					if (((_veh == _unit) || (_unit == (effectiveCommander _veh))) && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call m_fnc_getSide getFriend playerSide < 0.6)) then {	
						_marker setMarkerPosLocal (position _veh);
						_marker setMarkerTypeLocal "hd_dot";
						_marker setMarkerDirLocal getDir _veh;
						_marker setMarkerSizeLocal [1,1];
						_marker setMarkerColorLocal "ColorBlack";
						private ["_text"];
						_text = "";
						_text = (_text + "" + getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName'));
						_text = (_text + " " + name _unit);
						if (lifeState _unit == "INCAPACITATED") then {
							_text = _text + (" " + Localize "str_reply_injured");
						};
						_marker setMarkerTextLocal _text;
					}else{
						_marker setMarkerPosLocal [35000,35000];
					};
				};
			}else{
				deleteMarkerLocal _marker;
				_units set [_i,-1];
				_markers set [_i,-1];
			};
		};

		_units = (_units - [-1]);
		_markers = (_markers - [-1]);
		
		sleep 0.1
	};
};




