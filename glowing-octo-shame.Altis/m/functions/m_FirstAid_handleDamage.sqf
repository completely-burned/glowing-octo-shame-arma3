private["_unit","_selection","_damage","_source","_projectile","_canDie","_damageNone"];
_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if(isPlayer _source && isPlayer _unit)exitWith{_damage min (0.8 - 0.01)};
_damage

