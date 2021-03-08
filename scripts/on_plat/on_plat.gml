///@func on_plat([x],[y],[vsp]);
///@param [x]
///@param [y]
///@param [vsp]
function on_plat() {
	var _x, _y, _vsp, _f;
	_x = argument_count > 0 ? argument[0] : x;
	_y = argument_count > 1 ? argument[1] : y;
	_vsp = argument_count > 2 ? argument[2] : vsp;
	_f = flags_create(FLAG.plat);

	//Direct collision checking - fast
	if (platform_check_type == PLATFORM_CHECK_TYPE.quick)
		{	
		if (collision(_x, _y + 1, _f) && 
			!collision(_x, _y, _f) && _vsp >= 0)
			{
			return true;
			}
		}
	else
	//Multi-platform list collision checking - slow
	if (platform_check_type == PLATFORM_CHECK_TYPE.precise)
		{
		var _array = collision(_x, _y + 1, _f, true);
		//Loop through all collisions
		for(var i = 0; i < array_length(_array); i++)
			{
			var _plat = _array[i];
			//If you above the platform
			if (bbox_bottom < _plat.bbox_top && _vsp >= 0)
				{
				return true;
				}
			}
		}
	return false;


}
