EnableTeamSwitch false;

LIB_cfgVeh = configFile >> "CfgVehicles";
LIB_cfgWea = configFile >> "CfgWeapons";
// LIB_cfgAmm = configFile >> "CfgAmmo";
LIB_cfgWor = configFile >> "CfgWorlds" >> worldName;
// LIB_cfgWAr = LIB_cfgWor >> "Armory";
// LIB_cfgArm = configFile >> "CfgArmory";
// LIB_disableShips = getNumber(LIB_cfgWAr >> "disableShips");
LIB_a2Avail = false;
if (configName(LIB_cfgVeh >> "RU_Commander") != "") then {LIB_a2Avail = true};
LIB_ahAvail = false;
if (configName(LIB_cfgVeh >> "TK_Soldier_Officer_EP1") != "") then {LIB_ahAvail = true};
ACE_Avail = false;
if (configName(LIB_cfgVeh >> "ACE_Logic") != "") then {ACE_Avail = true};
acex_ru_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_ru") != "") then {acex_ru_Avail = true};
acex_usnavy_Avail = false;
if (configName(configFile >> "CfgMods" >> "acex_usnavy") != "") then {acex_usnavy_Avail = true};

///--- функции
[] call compile preprocessFileLineNumbers "m\functions\INIT_fnc.sqf";

listSalvageTruck = ["WarfareSalvageTruck_RU","WarfareSalvageTruck_USMC","WarfareSalvageTruck_CDF","WarfareSalvageTruck_Gue","WarfareSalvageTruck_INS",
"MtvrSalvage_DES_EP1","UralSalvage_TK_EP1","V3S_Salvage_TK_GUE_EP1"];
Airport = ["Land_SS_hangar","WarfareBAirport","Land_Mil_hangar_EP1","Land_Hangar_F","Land_Airport_01_terminal_F","Land_Airport_02_hangar_right_F","Land_Airport_02_hangar_left_F","Land_TentHangar_V1_F"];
pier = ["Land_nav_pier_m_2","Piers_base_F"];

safeDistance = 15;

/// listCrew + listMHQ ///
listCrew = [];
listMHQ=[];
	listMHQ=listMHQ+["B_Truck_01_medical_F","O_Truck_03_medical_F","O_Truck_02_medical_F","I_Truck_02_medical_F","B_T_Truck_01_medical_F","O_T_Truck_03_medical_ghex_F"
	];
	listCrew=listCrew+[
		"B_helicrew_F",
		"B_crew_F",
		"B_Pilot_F",
		"B_Helipilot_F",
		"B_T_Helicrew_F",
		"B_T_Crew_F",
		"B_T_Pilot_F",
		"B_T_Helipilot_F",
		"O_helicrew_F",
		"O_crew_F",
		"O_Pilot_F",
		"O_helipilot_F",
		"O_T_Helicrew_F",
		"O_T_Crew_F",
		"O_T_Pilot_F",
		"O_T_Helipilot_F",
		"I_helicrew_F",
		"I_crew_F",
		"I_pilot_F",
		"I_helipilot_F"
	];

HQ = ["Land_BagBunker_Large_F","Cargo_HQ_base_F","Cargo_Tower_base_F"];
Warfare_HQ = [];

UAVterminal = listMHQ + HQ + ["Base_WarfareBUAVterminal","HMMWV_Terminal_EP1"];

draga_objectsTeleport = listMHQ + HQ + ["WarfareBBaseStructure","BASE_WarfareBFieldhHospital"];

draga_objectsReammo = listMHQ + HQ + ["Base_WarfareBBarracks","Base_WarfareBLightFactory"];
draga_distanceReammo = 150;
draga_objectsCoinBase = Warfare_HQ+HQ;
draga_distanceCoinBase = 150;
draga_objectsCoinMHQ = listMHQ;
draga_distanceCoinMHQ = 15;
draga_BuyDistance = draga_distanceCoinBase;
respawnSafeDistance = 10;

[] execVM ("m\draga_update_vehicle_init.sqf");
