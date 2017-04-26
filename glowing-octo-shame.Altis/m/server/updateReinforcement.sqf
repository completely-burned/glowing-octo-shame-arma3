// тут все сделано неправильно, надо исправить

waitUntil {!isNil "bis_fnc_init"};
waitUntil {!isNil "m_fnc_init"};
waitUntil {!isNil "locationStarted"};
waitUntil {!isNil "GroupsStarted"};
waitUntil {!isNil "serverFPS"};

private["_minFPS","_minGroups","_maxGroups","_enemyCoefficient","_playerCoefficient","_enemyCoefficientCfg","_timeFriendlyReinforcements"];
_minFPS = missionNamespace getVariable "serverFPSmin";
_minGroups = missionNamespace getVariable "minGroups";
_maxGroups = missionNamespace getVariable "maxGroups";
_enemyCoefficientCfg = missionNamespace getVariable "enemyCoefficient";
_playerCoefficient = missionNamespace getVariable "playerCoefficient";
_timeFriendlyReinforcements = (missionNamespace getVariable "timeFriendlyReinforcements") * 60;

private["_all_groups","_friendlyGroups","_friendlyPatrols","_enemyGroups","_enemyPatrols","_enemySide"];
	
_enemySide = [west,east,resistance] - m_friendlySide;

while{true}do{
	// diag_log format ["UpdateReinforcement.sqf 17, %1", time];
	_friendlyGroups = 0; _friendlyPatrols = 0; _enemyGroups = 0; _enemyPatrols = 0;
	{
		private ["_grp"];
		_grp=_x;
		Private["_visible"];
		_visible = false;
		Private["_side"];
		_side = side _grp;

		ScopeName "Check1";
		{
			if(alive _x)then{
				_visible = true;
				BreakTo "Check1";
			};
		} forEach (units _grp);

		if(_visible)then{
			if(!isPlayer leader _grp)then{
				if (!isNil {_grp GetVariable "patrol"}) then {
					if (_side in m_friendlySide) then {
						_friendlyPatrols = _friendlyPatrols + 1;
					}else{
						_enemyPatrols = _enemyPatrols + 1;
					};
				}else{
					if (_side in m_friendlySide) then {
						_friendlyGroups = _friendlyGroups + 1;
					}else{
						_enemyGroups = _enemyGroups + 1;
					};
				};
			};
		}else{
			deleteGroup _grp;
		};
	}forEach allGroups;

	_all_groups=(_friendlyPatrols+_enemyPatrols+_friendlyGroups+_enemyGroups);
	
	if (isMultiplayer)then{
		{
			if(isPlayer _x)then{
				_friendlyGroups = _friendlyGroups + _playerCoefficient;
			};
		}forEach playableUnits;
	}else{
		_friendlyGroups = _friendlyGroups + _playerCoefficient;
	};

	if(!isNil {CivilianLocationStartTime})then{
		private["_time"];
		_time = time - CivilianLocationStartTime;
		_enemyCoefficient =  _timeFriendlyReinforcements / _time;
		_enemyCoefficient = _enemyCoefficientCfg min _enemyCoefficient;
	}else{
		_enemyCoefficient = _enemyCoefficientCfg;
	};

	if(_all_groups < _maxGroups or _maxGroups == 0)then{
		if((serverFPS > _minFPS) or (_all_groups < _minGroups))then{
			private ["_difference"];
			_difference = (((_all_groups / 5) min 4) max 2);
			// diag_log format ["UpdateReinforcement.sqf 106, %1", time];
			if (_friendlyGroups * _enemyCoefficient + _difference >= _enemyGroups) then {
				[_enemySide call BIS_fnc_selectRandom] call m_fnc_call_reinforcement;
			};
			if (_enemyGroups + _difference >= _friendlyGroups * _enemyCoefficient) then {
				[m_friendlySide call BIS_fnc_selectRandom] call m_fnc_call_reinforcement;
			};
			if ((_enemyPatrols + _friendlyPatrols) < ((_enemyGroups + _friendlyGroups) / 4)) then {
				if (_friendlyPatrols * _enemyCoefficient + _difference >= _enemyPatrols) then {
					[_enemySide call BIS_fnc_selectRandom,"patrol"] call m_fnc_call_reinforcement;
				};
				if (_enemyPatrols + _difference >= _friendlyPatrols * _enemyCoefficient) then {
					[m_friendlySide call BIS_fnc_selectRandom,"patrol"] call m_fnc_call_reinforcement;
				};
			};
			if (debug) then {
				player globalChat format ["UpdateReinforcement.sqf: %1", _all_groups];
			};
		};
	};
	// diag_log format ["UpdateReinforcement.sqf 121, %1", time];
	sleep 0.1;
};
		// if ((_guer < maxGroups/7*2)&&(_east+4 > _guer)&&(_west+4 > _guer)) then {
