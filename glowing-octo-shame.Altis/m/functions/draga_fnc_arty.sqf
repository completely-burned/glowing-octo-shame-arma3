private["_grp","_units","_vehicles"];
_grp = _this;
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
		private["_targets"];
		_targets = [];
		{
			private["_unit"];
			_unit = _x;
			{
				private ["_side"];
				_side = _x select 2;
				if((_side getFriend side _unit) < 0.6 )then{
					if(_unit knowsAbout (_x select 4) >= 1.5)then{
					private ["_type"];
					_type = _x select 1;
					if(_type isKindOf "Land")then{
						private ["_pos"];
						_pos = _x select 0;
						_targets set [count _targets, _pos];
					};
					};
				};
			}forEach (_unit nearTargets 1000);
		}forEach allUnits;
		private ["_pos"];
		if(count _targets > 0)then{
			_pos = _targets call BIS_fnc_selectRandom;
			if(leader _grp countFriendly (_pos nearEntities 150) == 0)then{
				{
					private ["_veh"];
					_veh = _x;
					if(currentCommand _veh != "FIRE AT POSITION")then{
						private ["_mag","_true"];
						_mag = "";
						_true = false;
						if("32Rnd_155mm_Mo_shells" in getArtilleryAmmo [_veh])then{_mag = "32Rnd_155mm_Mo_shells";_true = true;};
						if("12Rnd_230mm_rockets" in getArtilleryAmmo [_veh])then{_mag = "12Rnd_230mm_rockets";_true = true;};
						if("rhs_mag_HE_2a33" in getArtilleryAmmo [_veh])then{_mag = "rhs_mag_HE_2a33";_true = true;};
						if(_true)then{
							if(_pos inRangeOfArtillery [[_veh], _mag])then{
								_veh commandArtilleryFire [_pos, _mag, 3];
							};
						};
					};
				}forEach _vehicles;
			};
		};
	};
};
