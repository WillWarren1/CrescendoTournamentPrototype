///@func di_direction(initial_direction,stick_direction,max_di)
///@param initial_direction
///@param stick_direction
///@param max_di
function di_direction(argument0, argument1, argument2) {
	var _dir, _max_di, di, _stick_direction, _temp;
	_dir = argument0;
	_max_di = argument2;
	_stick_direction = argument1;

	//If stick is past a threshold
	if (stick_tilted(Lstick))
		{
		//Set a temporary placeholder variable, which holds the stick direction angle if the dir is always zero
		_temp = (_stick_direction - _dir);
	
		//If the angle is more than 90 degrees in any direction, it goes back toward zero
		if (abs(angle_difference(_temp, 0)) > 90)
			{
			_temp = (180 - _temp);
			}
		
		//The DI angle is the direction + the percent distance * the maximum DI.
		di = _dir + (angle_difference(_temp, 0) / 90) * _max_di;
	
		//Snap DI if it's close enough
		if (DI_correction_max > 0)
			{
			if (abs(angle_difference(_dir + 90, _stick_direction)) <= DI_correction_max)
				{
				di = _dir + _max_di;
				}
			else if (abs(angle_difference(_dir - 90, _stick_direction)) <= DI_correction_max)
				{
				di = _dir - _max_di;
				}
			}
		}
	else
		{
		//No input means no DI
		di = _dir;
		}
	
	//log((angle_difference(_temp, 0) / 90));
	//log(to_string("Initial: ", _dir, ", Input: ", _stick_direction, ", DI: ", di, ", Change: ", _dir - di, ", DI Range: ", _dir - _max_di, " to ", _dir + _max_di));

	return di;


}
