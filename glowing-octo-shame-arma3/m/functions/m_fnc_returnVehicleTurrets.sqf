#define true 1
#define false 0

private ["_entry", "_turrets", "_turretIndex", "_subEntry", "_hasGunner", "_path"];
_entry = _this select 0;
_path = _this select 1;
_turrets=[];
_turretIndex = 0;

for "_i" from 0 to ((count _entry) - 1) do{
	_subEntry = _entry select _i;
	
	if (isClass _subEntry) then {
		_hasGunner = [_subEntry, "hasGunner"] call BIS_fnc_returnConfigEntry;
		if (!isNil "_hasGunner") then {
			if (_hasGunner == 1) then {
				private ["_isPersonTurret"];
				_isPersonTurret = [_subEntry, "isPersonTurret"] call BIS_fnc_returnConfigEntry;
				if (isNil "_isPersonTurret") then {
					_isPersonTurret = 0;
				};
				if (_isPersonTurret == 0) then {
					_turrets = _turrets + [_path+[_turretIndex]];
					if (isClass (_subEntry >> "Turrets")) then {
						_turrets = _turrets + ([_subEntry >> "turrets",_path+[_turretIndex]] call m_fnc_returnVehicleTurrets);
					};
				};
			};
		};
		_turretIndex = _turretIndex + 1;
	};
};



_turrets




