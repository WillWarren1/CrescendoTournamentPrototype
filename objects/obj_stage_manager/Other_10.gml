/// @description <Run by obj_game>

//Background Clear
background_clear_frame = max(--background_clear_frame, 0);
if (background_clear_frame == 0)
	{
	background_clear_amount = max(0, background_clear_amount - 0.1);
	}
else
	{
	background_clear_amount = min(1, background_clear_amount + background_clear_fade_speed);
	}
	
//Background update
for(var i = 0; i < array_length(background); i++)
	{
	var _layer = background[i];
	
	if (_layer[BACK.sprite] != -1)
		{
		if (_layer[BACK.xspd] != 0 || _layer[BACK.yspd] != 0)
			{
			_layer[@ BACK.x] += _layer[BACK.xspd];
			_layer[@ BACK.y] += _layer[BACK.yspd];
		
			if (_layer[@ BACK.x] > obj_game.cam_w)
				{
				_layer[@ BACK.x] = -sprite_get_width(_layer[BACK.sprite]) * _layer[BACK.scale];
				}
			if (_layer[@ BACK.x] < -sprite_get_width(_layer[BACK.sprite]) * _layer[BACK.scale])
				{
				_layer[@ BACK.x] = obj_game.cam_w;
				}
			if (_layer[@ BACK.y] > obj_game.cam_h)
				{
				_layer[@ BACK.y] = -sprite_get_height(_layer[BACK.sprite] * _layer[BACK.scale]);
				}
			if (_layer[@ BACK.y] < -sprite_get_height(_layer[BACK.sprite]) * _layer[BACK.scale])
				{
				_layer[@ BACK.y] = obj_game.cam_h;
				}
			}
		
		var _num = sprite_get_number(_layer[BACK.sprite]);
		if (_num > 0)
			{
			_layer[@ BACK.frame] += _layer[@ BACK.imgspeed];
			if (_layer[BACK.frame] >= _num)
				{
				_layer[@ BACK.frame] -= _num;
				}
			}
		}
	}
	
//Run the stage script
if (stage_script != -1) then script_execute(stage_script);