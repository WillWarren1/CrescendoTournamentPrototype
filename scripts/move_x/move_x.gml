///@func move_x([hsp])
///@param [hsp]
///@desc General horizontal movement function
function move_x() {
	var _hsp = argument_count > 0 ? argument[0] : hsp;
	
	if (_hsp != 0)
		{
		for(hsp_moved = 0; hsp_moved < abs(_hsp); hsp_moved++)
			{
			//No collision
			if (!collision(x + sign(_hsp), y, flags_create(FLAG.solid)))
				{
				//Go down slopes
				if (move_with_slope_x(_hsp))
					{
					//Successfully move down the slope
					}
				else
					{
					//Move normally
					x += sign(_hsp);
					}
				}
			else
				{
				//Go up slopes
				if (move_against_slope_x(_hsp))
					{
					//Successfully moved up the slope
					}
				else
					{
					//Hitting a wall
					hsp_frac = 0;
					hsp = 0;
					break;
					}
				}
			}
		}


}
