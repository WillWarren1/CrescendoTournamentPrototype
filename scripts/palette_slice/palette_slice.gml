///@func palette_slice(palette,column)
///@param palette
///@param column
function palette_slice() {
	var _pal = argument[0];
	var _pal_data = _pal[0];
	var _col = argument_count > 1 ? argument[1] : 0;
	var _colors_per_column = _pal[1];

	var _new = [];
	var _data = array_create(_colors_per_column, c_black);
	for(var i = 0; i < _colors_per_column; i++)
		{
		_data[@ i] = _pal_data[i + (_col * _colors_per_column)];
		}

	_new[@ 0] = _data;
	_new[@ 1] = _colors_per_column;
	return _new;


}
