///@func assert(value, message)
function assert(_val, _msg) 
	{
    if (_val) then return;
	
	var _output = "Assertion Failed: ";
	for(var i = 1; i < argument_count; i++)
		{
		_output += string(argument[i]);
		}
		
	if (debug)
		{
	    show_message(_output);
		}
	else
		{
		crash(_output);
		}
	}
	
///@func crash(message...)
function crash(_msg) {
	var _output = "[Platform Fighter Engine Crash]: ";
	for(var i = 0; i < argument_count; i++)
		{
		_output += string(argument[i]);
		}
	show_debug_message(_output);
	show_error(_output, true);
}