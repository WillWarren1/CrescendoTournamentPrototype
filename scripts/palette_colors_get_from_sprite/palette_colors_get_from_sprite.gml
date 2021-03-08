///@func palette_colors_get_from_sprite(sprite,[column])
///@param sprite
///@param [column]
function palette_colors_get_from_sprite() {
	var _spr = argument[0];
	var _one = argument_count > 1;
	var _col = _one ? argument[1] : 0;
	var _surf = surface_create(sprite_get_width(_spr), sprite_get_height(_spr));
	var _array = [];
	var _colors_per_column = sprite_get_height(_spr);

	//Draw sprite to surface
	surface_set_target(_surf);
	draw_sprite(_spr, 0, 0, 0);
	surface_reset_target();

	var m = _col;
	repeat(_one ? 1 : sprite_get_width(_spr))
		{
		//Grab all of the colors in a column and put them in an array
		for(var i = 0; i < sprite_get_height(_spr); i++)
			{
			_array[@array_length(_array)] = surface_getpixel(_surf, m, i);
			}
		m++;
		}

	surface_free(_surf);
	return [_array, _colors_per_column];


}
