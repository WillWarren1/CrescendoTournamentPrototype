///@func move_bouncing()
///@desc Moves the player and allowing techs / bounces on walls.
function move_bouncing() {

	var _spd = point_distance(0, 0, hsp, vsp);
	var _falling = (vsp > 0);
	var _dir = point_direction(0, 0, hsp, vsp);
	var _h = lengthdir_x(1, _dir);
	var _v = lengthdir_y(1, _dir);

	for(var i = 0; i < _spd; i++)
		{
		if (!collision(x + _h, y + _v, flags_create(FLAG.solid)) &&
			((_falling && !on_ground()) || !_falling))
			{
			x += _h;
			y += _v;
			}
		else
			{
			x = round(x);
			y = round(y);
		
			var _result = check_tech();
			if (_result == TECH_RESULT.success)
				{
				//Exit out on successful teching
				break;
				}
			else if (_result == TECH_RESULT.slide)
				{
				//Continue moving on a slide
				_falling = (vsp > 0);
				//Choose the smallest distance to move
				_spd = min(_spd, point_distance(0, 0, hsp, vsp));
				_dir = point_direction(0, 0, hsp, vsp);
				_h = lengthdir_x(1, _dir);
				_v = lengthdir_y(1, _dir);
				continue;
				}
			else if (_result == TECH_RESULT.bounce)
				{
				//Exit out on a bounce
				break;
				}
			}
		}

	//Round coordinates
	x = round(x);
	y = round(y);
}