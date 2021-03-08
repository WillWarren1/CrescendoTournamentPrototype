/// @description
/*
- Numbers are taken from fsmash_combat, but you can change them to graph the knockback of other moves
*/
damage1 = 10;
base_knockback1 = 10;
knockback_scaling1 = 1;
formula1 = calculate_knockback;

damage2 = 10;
base_knockback2 = 10;
knockback_scaling2 = 1;
formula2 = function(_target_hp, _damage, _target_weight, _scaling, _knockback) {
	return _knockback + (power((_target_hp + _damage) / 25, 1 + _scaling) * _target_weight);
};