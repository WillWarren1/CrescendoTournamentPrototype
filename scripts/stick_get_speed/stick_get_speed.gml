///@func stick_get_speed(stick,[frame])
///@param stick
///@param [frame]
function stick_get_speed() {
	//Grab the cached speed values
	var _frame = argument_count > 1 ? argument[1] : 0;
	var _array = (argument[0] == Lstick) ? control_states_l : control_states_r;
	var _state = _array[_frame];
	return _state[@ CONTROL_STICK.spd];


}
