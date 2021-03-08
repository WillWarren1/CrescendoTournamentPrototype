///@func array_clear(array, value)
///@param array
///@param value
function array_clear() {
	var _array = argument[0];
	var _val = argument[1];

	for(var i = 0; i < array_length(_array); i++)
		{
		_array[@ i] = _val;
		}


}
