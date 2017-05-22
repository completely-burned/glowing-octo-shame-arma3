onEachFrame {

	private ["_units"];
	_units = [];
	{
		if(!(_x in _units) && (side _x == side player))then{
			_units set [count _units, _x];
		};
	}forEach playableUnits;
	{
		if(!(_x in _units) && ([[_x],listMHQ] call m_fnc_CheckIsKindOfArray))then{
			_units set [count _units, _x];
		};
	}forEach vehicles;
	{
		private ["_unit"];
		_unit = _x;
		private ["_distance"];
		_distance = [player, _unit] call BIS_fnc_distance2D;
		if (_distance < 1000) then {
			if (!isNull _unit && alive _unit) then {
				private ["_veh"];
				_veh = vehicle _unit;							
				private ["_text"];
				private ["_box","_z","_pos"];
				if([[_unit],listMHQ] call m_fnc_CheckIsKindOfArray && ({isPlayer _x && alive _x} count crew _unit == 0) && !(getNumber(configFile >> "CfgVehicles">> typeOf _unit >> "side") call m_fnc_getSide getFriend playerSide < 0.6))then{
					_text = (getText(configFile >> 'CfgVehicles' >> (typeOf _unit) >> 'displayName'));
					_box = boundingBox _veh;	
					_z = (_box select 1  select 2) - (_box select 0  select 2);
					_pos = getPosATL _veh;
					_pos set [2,(_pos select 2) + _z],
					drawIcon3D [
						[_unit,"texture"] call BIS_fnc_rankParams,
						[255,255,255,1.0],
						_pos,
						0.5,
						0.5,
						0,
						_text,
						1,
						0.025
					];
				}else{
					if (_unit == effectiveCommander _veh) then {	
						if (_veh == _unit) then {	
							_text = "";
						}else{
							_text = getText(configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName');
						};
						_text = (_text + " " + name _unit);
						if (lifeState _unit == "INCAPACITATED") then {
							_text = _text + (" " + Localize "str_reply_injured");
						};
						_box = boundingBox _veh;	
						_z = (_box select 1  select 2) - (_box select 0  select 2);
						_pos = getPosATL _veh;
						_pos set [2,(_pos select 2) + _z],
						drawIcon3D [
							[_unit,"texture"] call BIS_fnc_rankParams,
							[255,255,255,1.0],
							_pos,
							0.5,
							0.5,
							0,
							_text,
							1,
							0.025
						];
					};
				};
			};
		};
	} forEach _units;
};
