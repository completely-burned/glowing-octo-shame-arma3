waitUntil{!isNil "bis_fnc_init"};
waitUntil{!isNil "m_fnc_init"};

availableVehiclesBuyMenu = [[],[],[]];

// setTerrainGrid 12.5;
// enableRadio false;
// if(worldName == "namalsk")then{
	// enableEnvironment false;
// };
SetGroupIconsVisible [true,false];

// [] spawn {
	// // BIS_Effects_AirDestructionStage2
	// waitUntil {!isNil "BIS_Effects_Secondaries"};
	// if (ACE_Avail) then {waitUntil {!isNil "WARFX_Effects_Init"}}; // ����� �� ����� ���� ������� ��� ���� ACE
	// BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "m\Client\AirDestructionStage2.sqf";
// };

[] execVM "m\client\initRespawnMarkers.sqf";
[] spawn m_fnc_rating;
// [] spawn ACT_WinchManager;
// [] spawn m_fnc_handleFirstAid;
[] spawn m_fnc_handlePlayableUnitsMarker;
[] spawn m_fnc_handleJoinGroup;
// [] spawn m_fnc_handleTeleport;
[] spawn m_fnc_handleLocationTask;
[] spawn m_fnc_handleBuyMenu;
[] spawn compile preprocessFileLineNumbers "m\client\clientMenu.sqf";
[] spawn compile preprocessFileLineNumbers "m\client\updateClient.sqf";
[] execVM "m\client\updateLocalGroup.sqf";
// [] execVM "m\client\handleBuyMenuTimeAvailable.sqf";
[] execVM "m\client\3Dmarkers.sqf";


waitUntil{(!isNull player)};

player addEventHandler ["killed", {
	BIS_COIN_QUIT = true;
    if(!isNil "BIS_CONTROL_CAM_Handler")then{
        ["",""] call BIS_CONTROL_CAM_Handler;
    };
}];
// [] call compile preprocessFileLineNumbers  "m\Client\coin.sqf";

/* _player = (createVehicle [typeOf player, position player, [], 0, "FORM"]);
selectPlayer _player;
 */

"respawn" spawn m_fnc_RespawnWeaponsAdd;

if ( isMultiplayer ) then {
	waitUntil{!isNil "m_fnc_init"};
	// player addEventHandler ["killed", {_this spawn m_fnc_killcam}];
	// player addEventHandler ["respawn", {player spawn m_fnc_RespawnWeaponsAdd}];
	player addEventHandler ["killed", {"respawn" spawn m_fnc_RespawnWeaponsAdd}];
	player addEventHandler ["killed", {_this spawn m_fnc_resetActions}];
	player addEventHandler ["killed", {_this select 0 call {_this setVariable ["BIS_lifestate","ALIVE",true]}}];
}else{
	onTeamSwitch {
		SetGroupIconsVisible [true,false];
		// if(side _from != side _to)then{
			// [] call compile preprocessFileLineNumbers "m\Client\ClientMenu.sqf";
		// };
		40 CutRsc["OptionsAvailable","PLAIN",0];
	};
	{deleteVehicle _x}forEach SwitchableUnits-(units group player);
	EnableTeamSwitch true;

	waitUntil{!isNil "m_fnc_init"};
	PlayerType = [typeOf leader player, rank leader player];
	leader player addEventHandler ["killed", {_this call m_fnc_playerRespawnSP}];
	// [] spawn m_fnc_playerRespawn;
};

if(debug)then{
	// радио 0-0, чтоб разные скрипты тестировать
	[] call compile preprocessFileLineNumbers  "m\Client\radio\init.sqf";

	// военные обозначения, показ всех, чтобы видеть как и где создаются боты
	waitUntil{!isNil "bis_fnc_init"};
	private ["_martaFactions"];
	_martaFactions=[];
	{ _martaFactions = (_martaFactions + [_x,1]) } foreach ([] call BIS_fnc_getFactions);
	player setVariable ["MARTA_showRules",_martaFactions];
	SetGroupIconsVisible [true,true];
};

// player addAction ["main menu", "m\client\main_menu.sqf", nil, 1.5, false];
