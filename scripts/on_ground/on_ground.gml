///@func on_ground([x],[y],[vsp]);
///@param [x]
///@param [y]
///@param [vsp]
function on_ground() {
	var _x, _y, _vsp;
	_x = argument_count > 0 ? argument[0] : x;
	_y = argument_count > 1 ? argument[1] : y;
	_vsp = argument_count > 2 ? argument[2] : vsp;

	return (on_solid(_x, _y) || on_plat(_x, _y, _vsp));


}
