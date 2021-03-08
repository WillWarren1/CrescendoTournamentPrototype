///@func calculate_smash_damage(base_damage,[charge],[max],[multiplier])
///@param base_damage
///@param [charge]
///@param [max]
///@param [multiplier]
function calculate_smash_damage() {
	var _dmg =		argument[0],
		_charge =	argument_count > 1 ? argument[1] : charge,
		_max =		argument_count > 2 ? argument[2] : smash_attack_max_charge,
		_mult =		argument_count > 3 ? argument[3] : smash_attack_multiplier;
	return floor(_dmg * (1 + (_charge / _max) * _mult));
}