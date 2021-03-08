///@func position_clamp_rectangle(x,y,pad,view_x,view_y,view_w,view_h)
///@desc Returns an array with the x and y of a position inside the view
///@param x
///@param y
///@param pad
///@param view_x
///@param view_y
///@param view_w
///@param view_h
function position_clamp_rectangle() {

	var _new_x = argument[0],
		_new_y = argument[1],
		_pad = argument[2],
		_vx = argument[3],
		_vy = argument[4],
		_vw = argument[5],
		_vh = argument[6];
	
	_new_x = clamp(_new_x, _vx + _pad, _vx + _vw - _pad);
	_new_y = clamp(_new_y, _vy + _pad, _vy + _vh - _pad);

	return [_new_x, _new_y];


}
