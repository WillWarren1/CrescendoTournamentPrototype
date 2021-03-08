///@func hex_to_dec(string)
///@param string
function hex_to_dec() {
	var _hex = argument[0],
		_dec = 0,
		_len = string_length(_hex);
	
	var _chars = "0123456789ABCDEF";

	//Loop through the string and add up the numbers
	for(var i = 1; i <= _len; i++)
		{
		var _number = string_pos(string_char_at(_hex, i), _chars) - 1;
		var _power = power(16, _len - i);
		_dec += _number * _power;
		}
	
	//Return the number
	return _dec;


}
