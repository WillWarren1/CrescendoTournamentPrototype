///@func move_against_slope_y(vsp)
///@param vsp
///@desc Returns true if the player moves against the slope without colliding
function move_against_slope_y(argument0) {
	//Make sure slopes are enable
	if (!setting().slope_collisions_enable) then return false;
	
	var _v = sign(argument0);
	var _slope = collision(x, y + _v, flags_create(FLAG.slope));
	
	//If the slope exists and is pointed in the right direction
	if (_slope != noone && sign(_slope.image_yscale) == _v) 
		{
		//If the slope moves right
		if (sign(_slope.image_xscale) == 1 && _slope.bbox_right >= bbox_right) 
			{
			while(collision(x, y + _v, flags_create(FLAG.slope)) && !collision(x - 1, y, flags_create(FLAG.solid))) 
				{
				x -= 1;
				//Reduce the number of times you can move
				if (slope_change_speed)
					{
					vsp_moved += (1 / abs(dsin(_slope.slope_angle))) - 1;
					}
				}
			if (!collision(x, y + _v, flags_create(FLAG.solid))) 
				{
				y += _v;
				return true;
				}
			}
		//If the slope moves left
		else if (sign(_slope.image_xscale) == -1 && _slope.bbox_left <= bbox_left) 
			{
			while(collision(x, y + _v, flags_create(FLAG.slope)) && !collision(x + 1, y, flags_create(FLAG.solid))) 
				{
				x += 1;
				//Reduce the number of times you can move
				if (slope_change_speed)
					{
					vsp_moved += (1 / abs(dsin(_slope.slope_angle))) - 1;
					}
				}
			if (!collision(x, y + _v, flags_create(FLAG.solid))) 
				{
				y += _v;
				return true;
				}
			}
		}
	return false;


}
