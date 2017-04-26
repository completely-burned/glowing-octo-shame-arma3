private ["_side_str","_markerColor"];
switch (playerSide) do {
	case (resistance):
	{
		_side_str = "guerrila";
		_markerColor = "ColorGUER";
	};
	case (civilian):
	{
		_side_str = "civilian";
		_markerColor = "ColorCIV";
	};
	case (west):
	{
		_side_str = "west";
		_markerColor = "ColorWEST";
	};
	case (east):
	{
		_side_str = "east";
		_markerColor = "ColorEAST";
	};
	default {
		_side_str = str playerSide;
		_markerColor = "Default";
	};
};

private ["_objects"];
_objects = [];
{
	_objects = _objects + allMissionObjects _x;
} forEach HQ;

private ["_respawnMarkers"];
_respawnMarkers = [];

for "_i" from 0 to (count _objects - 1) do {
	private ["_obj","_marker","_pos"];
	_obj = _objects select _i;
	_pos = getPos _obj;
	if(_i == 0)then{
		_marker = createMarkerLocal [format["respawn_%1",_side_str], _pos];
	}else{
		_marker = createMarkerLocal [format["respawn_%1_%2",_side_str,_i], _pos];
	};
	_marker setMarkerTypeLocal "respawn_inf";
	_marker setMarkerColorLocal _markerColor;
	_respawnMarkers set [count _respawnMarkers, _marker];
};

draga_respawnMarkers = _respawnMarkers;
