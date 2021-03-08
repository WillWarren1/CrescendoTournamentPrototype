///@func custom_controls_default(map)
///@param map
///@desc Sets a map to have the "default" custom controls.
function custom_controls_default(argument0) {

	var _map = argument0;
	var _inputs = undefined;
	var _list = undefined;

	//Controller
	_inputs = _map[? string(DEVICE.controller)];

	_list = _inputs[| CC_INPUT_CONTROLLER.attack];
	ds_list_recreate(_list, [CONTROLLER.B]);
	_list = _inputs[| CC_INPUT_CONTROLLER.special];
	ds_list_recreate(_list, [CONTROLLER.A]);
	_list = _inputs[| CC_INPUT_CONTROLLER.jump];
	ds_list_recreate(_list, [CONTROLLER.X, CONTROLLER.Y]);
	_list = _inputs[| CC_INPUT_CONTROLLER.grab];
	ds_list_recreate(_list, [CONTROLLER.LB, CONTROLLER.LT]);
	_list = _inputs[| CC_INPUT_CONTROLLER.shield];
	ds_list_recreate(_list, [CONTROLLER.RB, CONTROLLER.RT]);
	_list = _inputs[| CC_INPUT_CONTROLLER.pause];
	ds_list_recreate(_list, [CONTROLLER.START]);
	_list = _inputs[| CC_INPUT_CONTROLLER.smash];
	ds_list_clear(_list);
	_list = _inputs[| CC_INPUT_CONTROLLER.taunt];
	ds_list_recreate(_list, [CONTROLLER.DPAD]);
	_list = _inputs[| CC_INPUT_CONTROLLER.short_hop];
	ds_list_clear(_list);
	_list = _inputs[| CC_INPUT_CONTROLLER.run];
	ds_list_clear(_list);

	//Keyboard
	_inputs = _map[? string(DEVICE.keyboard)];

	_list = _inputs[| CC_INPUT_KEYBOARD.attack];
	ds_list_recreate(_list, [ord("P")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.special];
	ds_list_recreate(_list, [ord("O")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.jump];
	ds_list_recreate(_list, [vk_up]);
	_list = _inputs[| CC_INPUT_KEYBOARD.grab];
	ds_list_recreate(_list, [ord("U")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.shield];
	ds_list_recreate(_list, [ord("I")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.pause];
	ds_list_recreate(_list, [vk_backspace]);
	_list = _inputs[| CC_INPUT_KEYBOARD.smash];
	ds_list_recreate(_list, [ord("Y")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.taunt];
	ds_list_recreate(_list, [ord("L")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.short_hop];
	ds_list_clear(_list);
	_list = _inputs[| CC_INPUT_KEYBOARD.run];
	ds_list_clear(_list);
	_list = _inputs[| CC_INPUT_KEYBOARD.LR];
	ds_list_recreate(_list, [vk_right]);
	_list = _inputs[| CC_INPUT_KEYBOARD.LL];
	ds_list_recreate(_list, [vk_left]);
	_list = _inputs[| CC_INPUT_KEYBOARD.LU];
	ds_list_recreate(_list, [vk_up]);
	_list = _inputs[| CC_INPUT_KEYBOARD.LD];
	ds_list_recreate(_list, [vk_down]);
	_list = _inputs[| CC_INPUT_KEYBOARD.RR];
	ds_list_recreate(_list, [ord("D")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.RL];
	ds_list_recreate(_list, [ord("A")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.RU];
	ds_list_recreate(_list, [ord("W")]);
	_list = _inputs[| CC_INPUT_KEYBOARD.RD];
	ds_list_recreate(_list, [ord("S")]);

	//SCS
	_map[? "SCS"] = scs_convert_to_int(false, false, false, false, false, false, INPUT.smash);

	log("Set custom control map ", _map, " to the defaults");


}
