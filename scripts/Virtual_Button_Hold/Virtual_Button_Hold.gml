///@func Virtual_Button_Hold(controllers,number,button)
///@param controllers
///@param number
///@param button
function Virtual_Button_Hold(argument0, argument1, argument2) {
	var _cons = argument0;
	var _number = argument1;
	var _button = argument2;

	var _con = _cons[_number];
	var _vb = _con[_button];
	_vb[@ 0] += 1;
	_vb[@ 1] = true;

	if (_vb[@ 0] == 1 ||
		(_vb[@ 0] >= VB_inital_time && _vb[@ 0] % VB_loop_time == 0))
		{
		return true;
		}
	return false;


}
