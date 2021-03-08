///@func custom_controls_unpack(map,device_type)
///@param map
///@param device_type
///@desc Returns a single custom control array from the given map.
function custom_controls_unpack(argument0, argument1) {
	/*
	FORMAT:
	[button/key, input, button/key, input...]
	*/

	var _map = argument0;
	var _list = _map[? string(argument1)];

	var _array = [];

	//For each input
	for(var i = 0; i < ds_list_size(_list); i++)
		{
		var _inner_list = _list[| i];
		//For each possible button/key
		for(var m = 0; m < ds_list_size(_inner_list); m++)
			{
			_array[@ array_length(_array)] = _inner_list[| m];
			_array[@ array_length(_array)] = i;
			}
		}
	
	log("Custom controls from profile ", argument0, " unpacked: ", _array);
	return _array;


}
