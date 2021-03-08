///@func to_string(values...)
///@param values...
///@desc Converts the values into one long string
function to_string() {
	var _output = "";

	for(var i = 0; i < argument_count; i++)
		{
		_output += is_string(argument[i]) ? argument[i] : string(argument[i]);
		}
	
	return _output;


}
