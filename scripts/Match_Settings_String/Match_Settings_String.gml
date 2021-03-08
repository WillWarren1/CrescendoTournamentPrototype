///@func Match_Settings_String([default])
///@param [default]
///@desc Returns a string of the match settings.
function Match_Settings_String() {
	var _default = argument_count > 0 ? argument[0] : "---";
	var _text = "";
	var _starting = true;

	if (match_has_stock_set())
		{
		_text += string(setting().match_stock) + " Stock";
		_starting = false;
		}
	if (match_has_time_set())
		{
		if (!_starting) then _text += " | ";
		_text += string(setting().match_time) + " Time";
		_starting = false;
		}
	if (match_has_stamina_set())
		{
		if (!_starting) then _text += " | ";
		_text += string(setting().match_stamina) + " Stamina";
		_starting = false;
		}
	//Blank settings
	if (_starting)
		{
		_text = _default;
		}
	return _text;


}
