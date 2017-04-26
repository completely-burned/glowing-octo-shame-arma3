if (getNumber(configFile >> "CfgVehicles" >> typeOf _this >> "isMan") == 1) then {
	if({isPlayer _x} count units _this > 0)then{
		// [nil, nil, "per", rSPAWN, _this, {
			_this addeventhandler ["HandleDamage",{
				_this call m_FirstAid_handleDamage
			}];
			// _this addeventhandler ["handleheal",{
				// _this spawn m_FirstAid_handleHeal;
			// }];
		// }] call RE;
	};
}else{
	// [nil, nil, "per", rSPAWN, _this, {
		_this addEventHandler ["HandleDamage", {_this call draga_fnc_vehicleHandleDamage}];
		_this addEventHandler ["GetIn", {
			if (isServer) then {
				private["_veh"];
				_veh = _this select 0;
				if (({!isNull _x} count crew _veh)>0) then{
					private["_time"];
					_time = (_veh getVariable "time");
					if ( isNil "_time" ) then {
						_time = ( time + ( 180 ) );
						_veh setVariable ["time", _time];
					};
					if ( _time < ( time + 180 ) )then {
						_time = time + 180;
						_veh setVariable ["time", _time];
					};
				};
			};
		}];
		_this addEventHandler ["GetOut", {
			if (isServer) then {
				private["_veh"];
				_veh = _this select 0;
				if (({!isNull _x} count crew _veh)>0) then{
					private["_time"];
					_time = (_veh getVariable "time");
					if ( isNil "_time" ) then {
						_time = ( time + ( 180 ) );
						_veh setVariable ["time", _time];
					};
					if ( _time < ( time + 180 ) )then {
						_time = time + 180;
						_veh setVariable ["time", _time];
					};
				};
			};
		}];
	// }] call RE;
	_this setVehicleLock "UNLOCKED";
	_this allowCrewInImmobile true;
};
