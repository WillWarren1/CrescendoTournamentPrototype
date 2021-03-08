///@func move_against_slope_x(hsp)
///@param hsp
///@desc Returns true if the player moves up the slope without colliding
function move_against_slope_x(argument0) {
	//Make sure slopes are enable
	if (!setting().slope_collisions_enable) then return false;
	
	var _h = sign(argument0);
	var _slope = collision(x + _h, y, flags_create(FLAG.slope));
	
	//If the slope exists and is pointed in the right direction
	if (_slope != noone && sign(_slope.image_xscale) == _h) 
		{
		//If the slope moves up
		if (sign(_slope.image_yscale) == 1 && _slope.bbox_bottom >= bbox_bottom) 
			{
			//Checks collisions for any slope. Change it to only check for `_slope` if you want to avoid glitches with converging slopes
			while(collision(x + _h, y, flags_create(FLAG.slope)) && !collision(x, y - 1, flags_create(FLAG.solid))) 
				{
				y -= 1;
				}
			
			//Reduce the number of times you can move
			if (slope_change_speed)
				{
				hsp_moved += (1 / abs(dcos(_slope.slope_angle))) - 1;
				}
			
			if (!collision(x + _h, y, flags_create(FLAG.solid))) 
				{
				x += _h;
				return true;
				}
			}
		//If the slope moves down
		else if (sign(_slope.image_yscale) == -1 && _slope.bbox_top <= bbox_top) 
			{
			//Macro for not getting pushed down by horizontal slopes
			if (!slope_horizontal_pushes_down) then return true;
		
			while(collision(x + _h, y, flags_create(FLAG.slope)) && !collision(x, y + 1, flags_create(FLAG.solid))) 
				{
				y += 1;
				}
			
			//Reduce the number of times you can move
			if (slope_change_speed)
				{
				hsp_moved += (1 / abs(dcos(_slope.slope_angle))) - 1;
				}	
			
			if (!collision(x + _h, y, flags_create(FLAG.solid))) 
				{
				x += _h;
				return true;
				}
			}
		}
	return false;


}
