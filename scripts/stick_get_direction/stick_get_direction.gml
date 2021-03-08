///@func stick_get_direction(stick,[frame])
///@param stick
///@param [frame]
function stick_get_direction() {
	var _frame = argument_count > 1 ? argument[1] : 0;
	var _array = (argument[0] == Lstick) ? control_states_l : control_states_r;
	var _state = _array[_frame];
	return _state[@ CONTROL_STICK.dir];


}
