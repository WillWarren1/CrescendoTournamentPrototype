///@func stick_check(stick,tilt,flick,dir,spd,dist,frames_back,single_frame)
///@param stick
///@param tilt
///@param flick
///@param dir
///@param spd
///@param dist
///@param frames_back
///@param single_frame
function stick_check() {
	var _stick = argument[0];

	//Get correct variables for each stick
	var _array, _tilt, _flick;
	if (_stick == Lstick)
		{
		_array = control_states_l;
		_tilt = control_tilted_l;
		_flick = control_flicked_l;
		}
	else
		{
		_array = control_states_r;
		_tilt = control_tilted_r;
		_flick = control_flicked_r;
		}

	//Figure out what has to be checked
	var _check_tilt = argument_count > 1 ? argument[1] : false;
	var _check_flick= argument_count > 2 ? argument[2] : false;
	var _check_dir  = argument_count > 3 ? argument[3] : undefined;
	var _check_spd  = argument_count > 4 ? argument[4] : undefined;
	var _check_dist = argument_count > 5 ? argument[5] : undefined;
	var _frames     = argument_count > 6 ? argument[6] : buff;
	var _single     = argument_count > 7 ? argument[7] : false;
	var _state = undefined;

	//Check if the control stick meets all of the given requirements in the past frames
	var _start = (_single) ? _frames : 0;
	var _end = (_single) ? _frames + 1 : _frames;
	for(var i = _start; i < _end; i++)
		{
		//Get the control state for that frame
		_state = _array[i];
	
		if (_check_tilt)
			{
			if (_tilt > _frames) continue;
			}
		
		if (_check_flick)
			{
			if (_flick > _frames) continue;
			}
	
		if (!is_undefined(_check_dir))
			{
			if (!stick_direction(_stick, _check_dir, i)) continue;
			}
	
		if (!is_undefined(_check_spd))
			{
			if (_state[@ CONTROL_STICK.spd] != _check_spd) continue;
			}
	
		if (!is_undefined(_check_dist))
			{
			if (_state[@ CONTROL_STICK.dist] != _check_dist) continue;
			}
		
		return true;
		}
	
	return false;
}