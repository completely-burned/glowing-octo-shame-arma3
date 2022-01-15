m_friendlySide = [];

private ["_i","_ii"];
for [{_i = 0}, {_i < count (missionConfigFile >> "MissionSQM" >> "Mission" >> "Entities")}, {_i = _i + 1}] do {
	private["_grpCFG"];
    _grpCFG = (missionConfigFile >> "MissionSQM" >> "Mission" >> "Entities") select _i;
		if (isClass _grpCFG) then {
			if (getText (_grpCFG >> "dataType") == "Group") then {
				private["_sideCFG","_unitsCFG"];
				_sideCFG = getText (_grpCFG >> "side");
				_unitsCFG = _grpCFG >> "Entities";
				for [{_ii = 0}, {_ii < count _unitsCFG}, {_ii = _ii + 1}] do {
					private ["_unitCFG"];
					_unitCFG = _unitsCFG select _ii;
					if (isClass _unitCFG) then {
						private ["_isPlayable"];
						_isPlayable = false;
						if (getNumber (_unitCFG >> "Attributes" >> "isPlayer") == 1) then {
							_isPlayable = true;
						};
						if (getNumber (_unitCFG >> "Attributes" >> "isPlayable") == 1) then {
							_isPlayable = true;
						};
						if (_isPlayable) then {
							switch (_sideCFG) do {
								case "East": {if !(east in m_friendlySide) then {m_friendlySide = m_friendlySide + [east]}};
								case "West": {if !(west in m_friendlySide) then {m_friendlySide = m_friendlySide + [west]}};
								case "Independent": {if !(resistance in m_friendlySide) then {m_friendlySide = m_friendlySide + [resistance]}};
								case "Civilian": {if !(civilian in m_friendlySide) then {m_friendlySide = m_friendlySide + [civilian]}};
								default {};
							};
						};
					};
				};
			};
		};
};

/// silvieManager ///
silvieManagerBlacklist=[
	"UGV_01_base_F",
	"Land_sloup_vn_dratZ",
	"Land_sloup_vn",
	"Land_Farm_WTower",
	"land_nav_pier_c",
	"land_nav_pier_c2",
	"land_nav_pier_c2_end",
	"land_nav_pier_c_270",
	"land_nav_pier_c_90",
	"land_nav_pier_c_big",
	"land_nav_pier_C_L",
	"land_nav_pier_C_L10",
	"land_nav_pier_C_L30",
	"land_nav_pier_C_R",
	"land_nav_pier_C_R10",
	"land_nav_pier_C_R30",
	"land_nav_pier_c_t15",
	"land_nav_pier_c_t20",
	"land_nav_pier_F_17",
	"land_nav_pier_F_23",
	"land_nav_pier_m",
	"land_nav_pier_m_1",
	"land_nav_pier_m_end",
	"land_nav_pier_M_fuel",
	"land_nav_pier_pneu",
	"land_nav_pier_uvaz",

	"WarfareBDepot",
	"WarfareBAirport",
	"USMC_WarfareBBarracks",
	"RU_WarfareBBarracks",
	"CDF_WarfareBBarracks",
	"Ins_WarfareBBarracks",
	"Gue_WarfareBBarracks",
	"USMC_WarfareBLightFactory",
	"RU_WarfareBLightFactory",
	"CDF_WarfareBLightFactory",
	"Ins_WarfareBLightFactory",
	"Gue_WarfareBLightFactory",
	"USMC_WarfareBHeavyFactory",
	"RU_WarfareBHeavyFactory",
	"CDF_WarfareBHeavyFactory",
	"Ins_WarfareBHeavyFactory",
	"Gue_WarfareBHeavyFactory",
	"USMC_WarfareBAircraftFactory",
	"RU_WarfareBAircraftFactory",
	"CDF_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_CDF",
	"INS_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_Ins",
	"GUE_WarfareBAircraftFactory",
	"WarfareBAircraftFactory_Gue",
	"USMC_WarfareBAntiAirRadar",
	"RU_WarfareBAntiAirRadar",
	"CDF_WarfareBAntiAirRadar",
	"INS_WarfareBAntiAirRadar",
	"GUE_WarfareBAntiAirRadar",
	"USMC_WarfareBArtilleryRadar",
	"RU_WarfareBArtilleryRadar",
	"CDF_WarfareBArtilleryRadar",
	"Ins_WarfareBArtilleryRadar",
	"Gue_WarfareBArtilleryRadar",
	"USMC_WarfareBUAVterminal",
	"RU_WarfareBUAVterminal",
	"CDF_WarfareBUAVterminal",
	"INS_WarfareBUAVterminal",
	"GUE_WarfareBUAVterminal",
	"USMC_WarfareBVehicleServicePoint",
	"RU_WarfareBVehicleServicePoint",
	"CDF_WarfareBVehicleServicePoint",
	"INS_WarfareBVehicleServicePoint",
	"GUE_WarfareBVehicleServicePoint",
	"Base_WarfareBBarrier5x",
	"Base_WarfareBBarrier10x",
	"Base_WarfareBBarrier10xTall",
	"BRDM2_HQ_Gue_unfolded",
	"BTR90_HQ_unfolded",
	"LAV25_HQ_unfolded",
	"BMP2_HQ_INS_unfolded",
	"BMP2_HQ_CDF_unfolded"
];
silvieManagerVehicles = [];
for [{_i = 0}, {_i < count (configfile >> "cfgVehicles")}, {_i = _i + 1}] do {
	private "_actual";
	_actual = (configfile >> "cfgVehicles") select _i;
	if (isclass _actual) then {
		private ["_class","_vehicleclass"];
		_class = configname _actual;
		_vehicleclass = gettext (configfile >> "cfgvehicles" >> _class >> "vehicleClass");
		if !(_vehicleclass in ["Sounds","Mines"]) then {
			private ["_scope","_side"];
			_scope = getnumber (_actual >> "scope");
			_side = getnumber (_actual >> "side");
			if (_class iskindof "LandVehicle" && _scope == 2 && _side == 3 && !([[_class], silvieManagerBlacklist] call m_fnc_CheckIsKindOfArray)) then {
				silvieManagerVehicles = silvieManagerVehicles + [_class];
			};
		};
	};
};
/// silvieManager ///

availableVehicles = [] call m_fnc_availableVehicles;
publicVariable "availableVehicles";
availableWeapons = [] call m_fnc_availableWeapons;
publicVariable "availableWeapons";
availableMagazines = [] call m_fnc_availableMagazines;
publicVariable "availableMagazines";
availableBackpacks = [] call m_fnc_availableBackpacks;
publicVariable "availableBackpacks";

_woodland=false; _deserted=false;
if(toLower worldname in ["altis","vr"])then{_deserted=true};
if(toLower worldname in ["tanoa"])then{_woodland=true};
airTransportsWest=[];airTransportsEast=[];airTransportsGuer=[];
airTransportsWest=airTransportsWest+["B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"];
airTransportsEast=airTransportsEast+["O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_unarmed_F"];
airTransportsGuer=airTransportsGuer+["I_Heli_Transport_02_F","I_Heli_light_03_dynamicLoadout_F","I_Heli_light_03_unarmed_F","I_C_Heli_Light_01_civil_F"];
if(!_deserted)then{
	airTransportsWest=airTransportsWest+["B_CTRG_Heli_Transport_01_tropic_F"];
};
if(!_woodland)then{
	airTransportsWest=airTransportsWest+["B_CTRG_Heli_Transport_01_sand_F"];
};
 {
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsWest=airTransportsWest-[_x]};
}forEach airTransportsWest;
{
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsEast=airTransportsEast-[_x]};
}forEach airTransportsEast;
{
	if(configName(configfile >> "cfgVehicles" >> _x) == "")then{airTransportsGuer=airTransportsGuer-[_x]};
}forEach airTransportsGuer;
