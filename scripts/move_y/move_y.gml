///@func move_y([drop_through],[vsp])
///@param [drop_through]
///@param [vsp]
///@desc General vertical movement function
function move_y() {
	var _drop = argument_count > 0 ? argument[0] : false;
	var _vsp = argument_count > 1 ? argument[1] : vsp;
	if (_vsp != 0)
		{
		for(vsp_moved = 0; vsp_moved < abs(_vsp); vsp_moved++)
			{
			if (_vsp < 0)
				{
				if (!collision(x, y + sign(_vsp), flags_create(FLAG.solid)))
					{
					y += sign(_vsp);
					}		
				else
					{
					if (move_against_slope_y(_vsp))
						{
						//Successfully moved against the slope!
						}
					else
						{
						vsp_frac = 0;
						vsp = 0;
						break;
						}
					}
				}
			else if (_vsp > 0)
				{
				if (!_drop)
					{
					if (on_ground())
						{
						vsp_frac = 0;
						vsp = 0;
						break;
						}
					else
						{
						y += sign(_vsp);
						}
					}
				else
					{
					if (!on_solid())
						{
						y += sign(_vsp);
						}
					else
						{
						vsp_frac = 0;
						vsp = 0;
						break;
						}
					}
				}
			}
		}


}
