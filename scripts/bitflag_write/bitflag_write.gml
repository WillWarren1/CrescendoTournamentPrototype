///@func bitflag_write(number,pos,[value])
///@param number
///@param pos
///@param [value]
function bitflag_write() {

	var _num = argument[0],
		_pos = argument[1],
		_val = argument_count > 2 ? argument[2] : true;
	
	if (_val)
		{
		return _num | (1 << _pos);
		}
	else
		{
		return _num & ~(1 << _pos);
		}


}
