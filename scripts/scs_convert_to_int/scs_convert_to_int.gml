///@func scs_convert_to_int([array/short_hop_aerial],[tap_jump],[ab_smash],[smash_stick],[switch_sticks],[auto_walk],[right_stick_input])
///@param [array/short_hop_aerial]
///@param [tap_jump]
///@param [ab_smash]
///@param [smash_stick]
///@param [switch_sticks]
///@param [auto_walk]
///@param [right_stick_input]
///@desc Converts the special control settings (or SCS array) into an integer.
function scs_convert_to_int() {

	if (argument_count == 1)
		{
		var _array = argument[0];
		var _int = _array[6];
	
		_int = bitflag_write(_int, 3, _array[0]);
		_int = bitflag_write(_int, 4, _array[1]);
		_int = bitflag_write(_int, 5, _array[2]);
		_int = bitflag_write(_int, 6, _array[3]);
		_int = bitflag_write(_int, 7, _array[4]);
		_int = bitflag_write(_int, 8, _array[5]);

		return _int;
		}
	else
		{
		var _int = argument[6]; //Right stick input is stored normally

		_int = bitflag_write(_int, 3, argument[0]);
		_int = bitflag_write(_int, 4, argument[1]);
		_int = bitflag_write(_int, 5, argument[2]);
		_int = bitflag_write(_int, 6, argument[3]);
		_int = bitflag_write(_int, 7, argument[4]);
		_int = bitflag_write(_int, 8, argument[5]);

		return _int;
		}


}
