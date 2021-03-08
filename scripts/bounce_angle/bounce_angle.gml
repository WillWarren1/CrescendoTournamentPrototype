///@func bounce_angle(initial, slope)
///@param initial
///@param slope
function bounce_angle(argument0, argument1) {

	var _i = modulo(argument0, 360);
	var _s = modulo(argument1, 360);

	var _diff = angle_difference(_i, _s - 90);

	return _s + 90 - _diff;


}
