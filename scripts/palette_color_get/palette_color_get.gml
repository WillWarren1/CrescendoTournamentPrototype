///@func palette_color_get(palette,index,[column])
///@param palette
///@param index
///@param [column]
function palette_color_get() {
	var _pal = argument[0];
	var _in = argument[1];
	var _pal_data = _pal[0];
	var _col = argument_count > 2 ? argument[2] : 0;
	var _colors_per_column = _pal[1];
	return _pal_data[_in + (_col * _colors_per_column)];


}
