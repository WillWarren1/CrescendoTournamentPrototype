///@func move_with_slope_x(hsp)
///@param hsp
///@desc Returns true if the player moves on the slope without colliding
function move_with_slope_x(argument0) {
	//Make sure slopes are enable
	if (!setting().slope_collisions_enable) then return false;
	
	var _h = sign(argument0);
	var _slope = collision(x, y + 1, flags_create(FLAG.slope));
	
	//If the slope exists and is pointed in the right direction
	if (_slope != noone && sign(_slope.image_xscale) != _h)
		{
		//If the slope moves up
		if (sign(_slope.image_yscale) == 1 && _slope.bbox_bottom >= bbox_bottom) 
			{
			if (!collision(x + _h, y, flags_create(FLAG.solid)))
				{
				x += _h;
				while(bbox_bottom < _slope.bbox_bottom)
					{
					if (!collision(x, y + 1, flags_create(FLAG.solid)) &&
						!collision(x, y + 1, flags_create(FLAG.slope)))
						{
						y += 1;
						}
					else
						{
						break;
						}
					}
				
				//Reduce the number of times you can move
				if (slope_change_speed)
					{
					hsp_moved += (1 / abs(dcos(_slope.slope_angle))) - 1;
					}	
			
				return true;
				}
			} 
		} 
	return false;


}
