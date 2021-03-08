///@func custom_controls_set(map,device_type,cc_input,buttons_keys_array)
///@param map
///@param device_type
///@param cc_input
///@param buttons_keys_array
function custom_controls_set(argument0, argument1, argument2, argument3) {

	var _map = argument0;
	var _device_type = argument1;
	var _input = argument2;
	var _array = argument3;

	var _inputs = _map[? string(_device_type)];

	if (ds_exists(_inputs, ds_type_list))
		{
		var _list = _inputs[| _input];
	
		//Set the list to match the array passed
		ds_list_clear(_list);
		for(var i = 0; i < array_length(_array); i++)
			{
			ds_list_add(_list, _array[i]);
			}
		return true;
		}
	else
		{
		crash("Input list not found for device type ", _device_type);
		}
	return false;
}