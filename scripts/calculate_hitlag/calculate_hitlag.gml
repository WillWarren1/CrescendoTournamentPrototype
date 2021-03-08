///@func calculate_hitlag(base_hitlag, dmg, scaling)
///@param base_hitlag
///@param dmg
///@param scaling
function calculate_hitlag() {
	var _lag = argument[0];
	var _dmg = argument[1];
	var _sca = argument[2];
	return ceil(min((_dmg * _sca * hitlag_damage_multiplier) + (_lag * hitlag_multiplier), maximum_hitlag));


}
