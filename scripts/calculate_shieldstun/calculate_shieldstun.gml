///@func calculate_shieldstun(damage,multiplier)
///@param damage
///@param multiplier
function calculate_shieldstun() {
	var _dmg = argument[0];
	var _multi = argument[1];
	return ceil(max(0, (_dmg * default_shieldstun_multiplier * _multi) + base_shieldstun));


}
