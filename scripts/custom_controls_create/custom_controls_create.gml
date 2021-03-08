///@func custom_controls_create([clear])
///@param [clear]
function custom_controls_create() {
	var _map = ds_map_create();

	var _inputs_controller = ds_list_create();
	var _inputs_keyboard = ds_list_create();

	//Possible Inputs & Buttons / Keys
	for(var i = 0; i < CC_INPUT_CONTROLLER.length; i++)
		{
		var _possible_buttons = ds_list_create();
		ds_list_add(_inputs_controller, _possible_buttons);
		ds_list_mark_as_list(_inputs_controller, i);
		}

	for(var m = 0; m < CC_INPUT_KEYBOARD.length; m++)
		{
		var _possible_keys = ds_list_create();
		ds_list_add(_inputs_keyboard, _possible_keys);
		ds_list_mark_as_list(_inputs_keyboard, m);
		}

	ds_map_add_list(_map, string(DEVICE.controller), _inputs_controller);
	ds_map_add_list(_map, string(DEVICE.keyboard), _inputs_keyboard);

	//SCS
	ds_map_add(_map, "SCS", 0);

	//Default
	var _clear = argument_count > 0 ? argument[0] : false;
	if (!_clear)
		{
		custom_controls_default(_map);
		}

	return _map;
}