///@func timestamp_create()
///@desc Creates a timestamp in the correct format
function timestamp_create() {
	var _stamp = "";
	_stamp += to_string(current_month, "-", current_day, "-", current_year, " (", current_hour, "-", current_minute, "-", current_second, ")");
	return _stamp;


}
