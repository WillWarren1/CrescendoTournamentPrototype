///@func stage_campground_distant_draw(layer,drawx,drawy,playerdistx,playerdisty)
///@param layer
///@param drawx
///@param drawy
///@param playerdistx
///@param playerdisty
function stage_campground_distant_draw() {
	var _layer = argument[0];
	var _draw_x = argument[1];
	var _draw_y = argument[2];
	var _player_dist_x = argument[3];
	var _player_dist_y = argument[4];

	var _time = obj_game.daynight_time;

	//Normal
	if (_time < 30)
		{
		draw_sprite_ext
			(
			back_campground_distant,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			1
			);
		}
	//Dusk
	else if (_time < 50)
		{
		var _amt = (_time - 30) / 20;
		draw_sprite_ext
			(
			back_campground_distant,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(1, 0, _amt),
			);
		draw_sprite_ext
			(
			back_campground_dusk,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(0, 1, _amt),
			);
		}
	//Night
	else if (_time < 80)
		{
		var _amt = (_time - 50) / 30;
		draw_sprite_ext
			(
			back_campground_dusk,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(1, 0, _amt),
			);
		draw_sprite_ext
			(
			back_campground_night,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(0, 1, _amt),
			);
		}
	//Dawn
	else if (_time < 100)
		{
		var _amt = (_time - 80) / 20;
		draw_sprite_ext
			(
			back_campground_distant,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(0, 1, _amt),
			);
		draw_sprite_ext
			(
			back_campground_night,
			_layer[BACK.frame],
			_draw_x + _layer[BACK.x] + (_player_dist_x * _layer[BACK.parallax_x]),
			_draw_y + _layer[BACK.y] + (_player_dist_y * _layer[BACK.parallax_y]),
			_layer[BACK.scale],
			_layer[BACK.scale],
			0,
			c_white,
			lerp(1, 0, _amt),
			);
		}


}
