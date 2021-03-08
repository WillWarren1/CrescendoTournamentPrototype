///@func entity_move(hsp,vsp,destroy_on_blocks,bounce,bounce_multiplier,drop_through)
///@param hsp
///@param vsp
///@param destroy_on_blocks
///@param bounce
///@param bounce_multiplier
///@param drop_through
///@desc Movement function for projectiles
function entity_move() {
	var _hsp = argument[0];
	var _vsp = argument[1];
	var _destroy = argument[2];
	var _bounce = argument[3];
	var _multiplier = argument[4];
	var _drop = argument[5];
	
	//Return struct
	var _results =
		{
		hsp : _hsp,
		vsp : _vsp,
		destroy : false,
		};

	repeat(abs(_hsp))
		{
		if (!collision(x + sign(_hsp), y, flags_create(FLAG.solid)))
			{
			x += sign(_hsp);
			}
		else
			{
			//Bounce
			if (_bounce)	
				{
				_results.hsp = -_hsp * _multiplier;
				break;
				}
			else
				{
				if (_destroy)
					{
					_results.destroy = true;
					}
				_results.hsp = 0;
				break;
				}
			}
		}
		
	repeat(abs(_vsp))
		{
		if (_vsp < 0)
			{
			if (!collision(x, y + sign(_vsp), flags_create(FLAG.solid)))
				{
				y += sign(_vsp);
				}
			else
				{
				//Bounce
				if (_bounce)	
					{
					_results.vsp = -_vsp * _multiplier;
					break;
					}
				else
					{
					if (_destroy)
						{
						_results.destroy = true;
						}
					_results.vsp = 0;
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
					//Bounce
					if (_bounce)	
						{
						_results.vsp = -_vsp * _multiplier;
						break;
						}
					else
						{
						if (_destroy)
							{
							_results.destroy = true;
							}
						_results.vsp = 0;
						break;
						}
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
					//Bounce
					if (_bounce)	
						{
						_results.vsp = -_vsp * _multiplier;
						break;
						}
					else
						{
						if (_destroy)
							{
							_results.destroy = true;
							}
						_results.vsp = 0;
						break;
						}
					}
				}
			}
		}
		
	return _results;
}