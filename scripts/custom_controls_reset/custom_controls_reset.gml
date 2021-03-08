///@func custom_controls_set(map,device_type)
///@param map
///@param device_type
function custom_controls_reset(argument0, argument1) {

	var _map = argument0;
	var _device_type = argument1;

	var _inputs = _map[? string(_device_type)];

	for(var i = 0; i < ds_list_size(_inputs); i++)
		{
		var _list = _inputs[| i];
	
		//Set the list to match the array passed
		ds_list_clear(_list);
		}


}
