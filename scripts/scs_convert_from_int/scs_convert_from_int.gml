///@func scs_convert_from_int(integer)
///@param integer
///@desc Returns an array of the special control settings.
function scs_convert_from_int(argument0) {
	/*
	ORDER:
		short_hop_aerial
		tap_jump
		ab_smash
		smash_stick
		switch_sticks
		auto_walk
		right_stick_input
	*/

	var _array = [];
	var _int = argument0;

	_array[0] = bitflag_read(_int, 3);
	_array[1] = bitflag_read(_int, 4);
	_array[2] = bitflag_read(_int, 5);
	_array[3] = bitflag_read(_int, 6);
	_array[4] = bitflag_read(_int, 7);
	_array[5] = bitflag_read(_int, 8);
	_array[6] = _int & $7;

	return _array;


}
