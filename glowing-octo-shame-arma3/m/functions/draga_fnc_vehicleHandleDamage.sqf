private["_unit","_selectionName","_damage","_source","_projectile"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
if(isPlayer _source && isPlayer effectiveCommander _unit)exitWith{_damage min (0.8 - 0.01)};
_damage
