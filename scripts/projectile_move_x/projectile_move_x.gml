///@func projectile_move_x([bounce],[bounce_multiplier])
///@param [bounce]
///@param [bounce_multiplier]
///@desc Movement function for projectiles
function projectile_move_x() {
	var _b = argument_count > 0 ? argument[0] : false;
	var _m = argument_count > 1 ? argument[1] : 1;

	repeat(abs(hsp))
		{
		if (!collision(x + sign(hsp), y, flags_create(FLAG.solid)))
			{
			x += sign(hsp);
			}
		else
			{
			//Bounce
			if (_b)	
				{
				hsp = -hsp * _m;
				break;
				}
			else
				{
				if (destroy_on_blocks)
					{
					destroy = true;
					}
				hsp = 0;
				break;
				}
			}
		}


}
