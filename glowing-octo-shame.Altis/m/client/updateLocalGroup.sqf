private["_player"];
while {true} do {
	_player = player;
	if(leader _player == _player) then {
		{
			if (isPlayer _x) then{
				if (!stopped _x) then{
					doStop _x;
				};
			};
		}forEach units _player - [_player];
	};
	sleep 2;
};
