private["_grp","_side","_units","_vehicles"];
_grp = _this;
_side = side _grp;
_units = units _grp;
_vehicles = [];
{	
	private ["_veh"];
	_veh = vehicle _x;
	if(_veh != _x)then{
		if!(_veh in _vehicles)then{
			_vehicles set [count _vehicles, _veh];
		};
	};
}forEach _units;
if(leader _grp distance (waypointPosition [_grp, 0]) > 50)then{
	if({getNumber(LIB_cfgVeh >> typeOf _x >> "artilleryScanner") == 1}count _vehicles > 0)then{
		private["_targets","_targets2"];
		_targets = [];
		_targets2 = [];
		{
			_targets2 = _targets2 + (_x nearTargets 1000);
		}forEach allUnits;
		{
			private ["_side2","_pos"];
			_side2 = _x select 2;
			if((_side2 getFriend _side) < 0.6 )then{
				_pos = _x select 0;
				_targets set [count _targets, _pos];
			};

		}forEach _targets2;
		{
			private ["_veh"];
			_veh = _x;
			if(currentCommand _veh != "FIRE AT POSITION")then{
				if({(_x select 1) > 0}count (magazinesAmmo _veh) > 0)then{
					private ["_mag"];
					_mag = currentMagazine _veh;
					_veh commandArtilleryFire [_targets call BIS_fnc_selectRandom, _mag, 3];
				};
			};
		}forEach _vehicles;
	};
};
