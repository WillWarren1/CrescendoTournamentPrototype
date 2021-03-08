///@func on_solid([x],[y]);
///@param [x]
///@param [y]
function on_solid() {
	var _x, _y;
	_x = argument_count > 0 ? argument[0] : x;
	_y = argument_count > 1 ? argument[1] : y;

	return collision(_x, _y + 1, flags_create(FLAG.solid));


}
