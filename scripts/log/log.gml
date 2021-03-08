///@func log(values...)
///@param values...
///@desc Converts the values into one long string, then prints a debug message
function log() {
	if (!debug || !show_debug_logs) then exit;
		
	var _output = "";
	for(var i = 0; i < argument_count; i++)
		{
		_output += string(argument[i]);
		}
	
	show_debug_message(_output);
}