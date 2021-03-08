///@func stick_get_value(stick,direction,[frame])
///@param stick
///@param direction
///@param [frame]
function stick_get_value() {
	var _frame = argument_count > 2 ? argument[2] : 0;
	var _array = (argument[0] == Lstick) ? control_states_l : control_states_r;
	var _state = _array[_frame];
	var _stick_x = _state[@ CONTROL_STICK.xval];
	var _stick_y = _state[@ CONTROL_STICK.yval];

	switch(argument[1])
		{
		case DIR.horizontal:
			return _stick_x;
			break;
		case DIR.left:
			return _stick_x < 0 ? _stick_x : 0;
			break;
		case DIR.right:
			return _stick_x > 0 ? _stick_x : 0;
		case DIR.vertical:
			return _stick_y;
			break;
		case DIR.down:
			return _stick_y > 0 ? _stick_y : 0;
			break;
		case DIR.up:
			return _stick_y < 0 ? _stick_y : 0;
			break;
		case DIR.any:
			return point_distance(0, 0, _stick_x, _stick_y);
			break;
		case DIR.none:
			return 0;
			break;
		default: crash("stick_get_value direction is invalid"); break;
		}
	return 0;
}