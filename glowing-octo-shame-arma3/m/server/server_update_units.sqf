﻿
private ["_allowGetin","_deleteList","_getOut","_getIn"];
while{true}do{
_deleteList=[];
_getOut=[];
{
	Private["_assignedVehicle"];
	_assignedVehicle = assignedVehicle _x;
	_allowGetin=true;
	if(!isNull _x)then{
		if(true)then{
			if(!isNull _assignedVehicle)then{
				private ["_VehicleRole"];
				_VehicleRole = assignedVehicleRole _x;

				// if(_allowGetin)then{
					// if(!canMove _assignedVehicle)then{
						// if(isNull assignedTarget _assignedVehicle)then{
							// _allowGetin=false;
						// };
					// };
				// };

				if(_allowGetin)then{
				// private ["_behaviour"];
				// _behaviour = behaviour _x;
					if((behaviour _x == "COMBAT"))then{
						if(count _VehicleRole > 0)then{
							if(_VehicleRole select 0 == "Cargo")then{
								_allowGetin=false;
							};
							if(_VehicleRole select 0 == "Turret")then{
								if(_assignedVehicle isKindOf "BMP3")then{
									if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
										_allowGetin=false;
									};
								};
								if(_assignedVehicle isKindOf "I_MRAP_03_F")then{
									if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [0])then{
										_allowGetin=false;
									};
								};
								if(_assignedVehicle isKindOf "I_MRAP_03_gmg_F")then{
									if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
										_allowGetin=false;
									};
								};
								if(_assignedVehicle isKindOf "I_MRAP_03_hmg_F")then{
									if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
										_allowGetin=false;
									};
								};
							};
						};
					};
				};

				if(_allowGetin && true)then{
					if(((civilianBasePos distance vehicle _x)<(500 max sizeLocation))or ((civilianBasePos distance _assignedVehicle)<(500 max sizeLocation)))then{
						private ["_enableAttack"];
						_enableAttack = true;
						if(_enableAttack)then{
							if(getNumber(LIB_cfgWea >> currentWeapon _assignedVehicle >> "enableAttack")==0)then{
								_enableAttack = false;
							};
						};
						if!(_enableAttack)then{
							if([[_assignedVehicle], ["M1128_MGS_EP1", "Pandur2_ACR","I_LT_01_scout_F"]] call m_fnc_CheckIsKindOfArray)then{
								_enableAttack = true;
							};
						};
						if!(_enableAttack)then{
							if!(_assignedVehicle isKindOf "Air")then{
								_allowGetin=false;
							};
						}else{
							if(count _VehicleRole > 0)then{
								if(_VehicleRole select 0 == "Cargo")then{
									_allowGetin=false;
								};
								if(_VehicleRole select 0 == "Turret")then{
									if(_assignedVehicle isKindOf "BMP3")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [0])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_gmg_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_hmg_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
											_allowGetin=false;
										};
									};
								};
								if(_allowGetin)then{
									if(_VehicleRole select 0 == "Turret")then{
										if (!canFire _assignedVehicle) then {
											_allowGetin=false;
										};
									};
								};
								if(_allowGetin)then{
									if(_VehicleRole select 0 == "Driver")then{
										if (!canMove _assignedVehicle or !canFire _assignedVehicle) then {
											_allowGetin=false;
										};
									};
								};
							};
						};
					}else{
						if(_allowGetin)then{
							if (!canMove _assignedVehicle) then {
								_allowGetin=false;
							};
						};
					};
				};

				if(_allowGetin && true)then{
					if(_assignedVehicle isKindOf "LandVehicle")then{
						if(([vehicle _x, 300, side _x] call m_fnc_CheckCombatNearUnits))then{
							if(count _VehicleRole > 0)then{
								if(_VehicleRole select 0 == "Cargo")then{
									_allowGetin=false;
								};
								if(_VehicleRole select 0 == "Turret")then{
									if(_assignedVehicle isKindOf "BMP3")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1,2])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [0])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_gmg_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
											_allowGetin=false;
										};
									};
									if(_assignedVehicle isKindOf "I_MRAP_03_hmg_F")then{
										if(([_VehicleRole, [1, 0]] call BIS_fnc_returnNestedElement) in [1])then{
											_allowGetin=false;
										};
									};
								};
							};
						};
					};
				};

				if(_allowGetin)then{
					if(_assignedVehicle != vehicle _x)then{
						if((_assignedVehicle distance vehicle _x)>1000)then{
							_allowGetin=false;
						};
					};
				};

				if(_allowGetin)then{
					if(_assignedVehicle isKindOf "LandVehicle")then{
						if!([_assignedVehicle, false] call draga_fnc_CheckTurretAlive)then{
							_allowGetin=false;
						};
					}
				};

				if(toLower getText(configFile >> "CfgVehicles" >> typeOf _assignedVehicle >> "simulation") == "airplane")then{
					if(_x == vehicle _x)then{
						_allowGetin=false;
					};
					if(_assignedVehicle == vehicle _x)then{
						_allowGetin=true;
					};
				};

				if!(_allowGetin)then{
					if(_assignedVehicle isKindOf "Ship")then{
						_allowGetin=true;
					};
				};

				if!(_allowGetin)then{
					if(waypointType [group _x, currentwaypoint group _x] == "SUPPORT")then{
						_allowGetin=true;
					};
				};

				if(_allowGetin)then{
					if(currentCommand _x in ["GET OUT"])then{
						_allowGetin=false;
					};
				};
			};
		};

		if (!isPlayer _x) then {

			Private["_time","_delete"];
			_delete = false;
			_time = (_x getVariable "time");
			if ( isNil "_time" ) then {
				_time = ( time + ( 60 * 30 ) );
				_x setVariable ["time", _time];
			}else{
				if ( _time < time )then {
					_delete = true;
				};
			};

				//�������� ���
				// if (true) then {
					// if(isNull _assignedVehicle)then{
						// _delete = true;
					// };
				// };

				if (!_delete) then {
					if (isNull _assignedVehicle) then {
						if (isNil {group _x getVariable "patrol"}) then {
							if (_x distance civilianBasePos > 2500 max sizeLocation) then {
								_delete = true;
								_x setVariable ["time", 0];
							};
						};
					};
				};

				if (!_delete) then {
					if (!isNull _assignedVehicle) then {
						if (getNumber(LIB_cfgWea >> currentWeapon _assignedVehicle >> "enableAttack")==0) then {
							if (count assignedCargo _assignedVehicle == 0)then{
								if (isNull assignedCommander _assignedVehicle)then{
									if (isNull assignedGunner _assignedVehicle)then{
										if ( _time > time + (60 * 2) )then {
											_x setVariable ["time", time + (60 * 2)];
										};
									};
								};
							};
						};
					};
				};

				if (_delete) then {
					if ((vehicle _x distance civilianBasePos) <= (sizeLocation / 2 + sizeLocation)) then {
						_delete = false;
						if ( _time < ( time + 180 ) )then {
							_time = time + 180;
							_x setVariable ["time", _time];
						};
					};
				};

				if (!_delete) then {
					if (fleeing _x) then {
						_delete = true;
						_x setVariable ["time", 0];
					};
				};

				// �������� ������ ������� � �������
				if (!_delete) then {
					if([[_x], listCrew] call m_fnc_CheckIsKindOfArray)then{
						// _assignedVehicle = assignedVehicle _x;
						if(isNull _assignedVehicle)then{
							_delete = true;
						};
					};
				};

				// �������� ����������
				if (true) then {
					if ((side _x) in [west,east,resistance]) then {
						if ((count magazines _x) == 0) then {
							_delete = true;
						};
					};
				};

				if !(canStand _x) then {
					if !([vehicle _x, 100] call m_fnc_CheckPlayersDistance)then{
						_x setHit["legs",0];
					};
				};

				// if !(isNull assignedTarget _x) then {
					// Private["_currentWeapon"];
					// _currentWeapon = currentWeapon _x;
					// if (ACE_Avail) then {
						// _type=getNumber (LIB_cfgWea >> _currentWeapon >> "ace_sys_weapons_TYPE");
					// }else{
						// _type=getNumber (LIB_cfgWea >> _currentWeapon >> "type");
					// };
					// if (_type == 5) then {
						// if (getNumber (LIB_cfgWea >> _currentWeapon >> "autoFire") == 1) then {
							// if (unitPos _x != "DOWN") then {
								// _x setUnitPos "DOWN";
							// };
						// };
					// };
				// };

				// if{false}then{
					// {
						// if((damage _x)>0.1)then{
							// _x action ["HealSoldier",_x];
						// };
					// } forEach (_x nearEntities ["Man",50]);
				// };

					// if (vehicle _x == _x) then {
						// if (surfaceIsWater getPos _x) then {
							// _timeIsWater = (_x getVariable "timeIsWater");
							// if ( isNil "_timeIsWater" ) then {
								// _timeIsWater = ( time + ( 60 * 3 ) );
								// _x setVariable ["timeIsWater", _timeIsWater];
							// }else{
								// if ( _timeIsWater < time )then {
									// _x setDamage 1;
								// };
							// };
						// }else{
							// _x setVariable ["timeIsWater", nil];
						// };
					// };

					if(waypointType [group _x, currentwaypoint group _x] == "SUPPORT")then{
						if(!alive _assignedVehicle or !canMove _assignedVehicle)then{
							_delete = true;
						};
					};

			if (_delete) then {
				_deleteList set [count _deleteList,_x];
			};

		};

	};

	if!(_allowGetin)then{
		_getOut set [count _getOut,_x];
	};
} forEach allUnits-playableUnits-switchableUnits;

_getIn = allUnits - _getOut;

	{
		private["_veh","_unit","_move"];
		_unit = _x;
		_veh = vehicle _unit;
		_move = true;
		if(_veh != _unit)then{
			private["_driver"];
			_driver = driver _veh;
			if(_driver == _unit)then{
				if(_move)then{
					if({_x in _getOut}count crew _veh > 0)then {
						_move = false;
					};
				};
				if(_move)then{
					if({assignedVehicle _x == _veh && !(_x in _veh)}count _getIn > 0)then {
						_move = false;
					};
				};
			};
		};
		if(_move)then{_unit enableAI "MOVE"}else{_unit disableAI "MOVE"};
	}forEach allUnits-playableUnits-switchableUnits;

_getOut allowGetin false;
_getIn allowGetin true;

_deleteList call fnc_cleanup;
	sleep 1;
};
