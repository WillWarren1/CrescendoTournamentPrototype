/// @description

if (obj_game.state == GAME_STATE.startup) then exit;

if (next_point != noone && instance_exists(next_point))
	{
	time++;
	var _next_x = round(lerp(start_x, next_point.x, time / next_point.travel_time));
	var _next_y = round(lerp(start_y, next_point.y, time / next_point.travel_time));
	var _hsp = (_next_x - x);
	var _vsp = (_next_y - y);
	var _pull = false;
	ds_list_clear(pull_list);
	with(obj_player)
		{
		//Add to list if it is standing on the platform
		if (place_meeting(x, y + 1, other) && !place_meeting(x, y, other))
			{
			ds_list_add(other.pull_list, id);
			_pull = true;
			}
		}
	//Movement
	repeat(abs(_hsp))
		{
		x += sign(_hsp);
		//Pulling
		if (_pull)
			{
			for(var m = 0; m < ds_list_size(pull_list); m++)
				{
				with(pull_list[| m])
					{
					move_x(sign(_hsp));
					}
				}
			}
		}
	repeat(abs(_vsp))
		{
		y += sign(_vsp);
		//Pulling
		if (_pull)
			{
			for(var m = 0; m < ds_list_size(pull_list); m++)
				{
				with(pull_list[| m])
					{
					move_y(false, sign(_vsp));
					}
				}
			}
		}

	//Next point
	if (time >= next_point.travel_time)
		{
		x = next_point.x;
		y = next_point.y;
		next_point = next_point.next_point;
		time = 0;
		start_x = x;
		start_y = y;
		}
	}