///@func dec_to_hex(number)
///@param number
function dec_to_hex() {
	var _dec = argument[0],
		_hex = "";
	
	var _chars = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

	//Loop through the number and add to the hex string
	while(_dec > 0)
		{
		var _hex_char = _chars[_dec & $f];
		_hex = _hex_char + _hex;
		_dec = _dec >> 4;
		}
	
	//Return the string
	return _hex;


}
