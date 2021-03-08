///@func projectile_move_y([bounce],[bounce_multiplier],[drop_through])
///@param [bounce]
///@param [bounce_multiplier]
///@param [drop_through]
///@desc Movement function for projectiles
function projectile_move_y() {
	var _b = argument_count > 0 ? argument[0] : false;
	var _m = argument_count > 1 ? argument[1] : 1;
	var _drop = argument_count > 2 ? argument[2] : false;

	repeat(abs(vsp))
		{
		if (vsp < 0)
			{
			if (!collision(x, y + sign(vsp), flags_create(FLAG.solid)))
				{
				y += sign(vsp);
				}
			else
				{
				//Bounce
				if (_b)	
					{
					vsp = -vsp * _m;
					break;
					}
				else
					{
					if (destroy_on_blocks)
						{
						destroy = true;
						}
					vsp = 0;
					break;
					}
				}
			}
		else if (vsp > 0)
			{
			if (!_drop)
				{
				if (on_ground())
					{
					//Bounce
					if (_b)	
						{
						vsp = -vsp * _m;
						break;
						}
					else
						{
						if (destroy_on_blocks)
							{
							destroy = true;
							}
						vsp = 0;
						break;
						}
					}
				else
					{
					y += sign(vsp);
					}
				}
			else
				{
				if (!on_solid())
					{
					y += sign(vsp);
					}
				else
					{
					//Bounce
					if (_b)	
						{
						vsp = -vsp * _m;
						break;
						}
					else
						{
						if (destroy_on_blocks)
							{
							destroy = true;
							}
						vsp = 0;
						break;
						}
					}
				}
			}
		}


}
