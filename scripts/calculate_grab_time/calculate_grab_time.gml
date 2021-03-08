///@func calculate_grab_time(target_hp)
///@param target_hp
function calculate_grab_time() {
	var _hp = argument[0];
	return ceil(base_grab_time + (_hp * grab_time_multiplier));


}
