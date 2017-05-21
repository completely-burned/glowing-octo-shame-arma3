while{true}do{
	{
		if(!isPlayer leader _x)then{
			_x call draga_fnc_arty;
		};
	}forEach allGroups;
	sleep 1;
};
