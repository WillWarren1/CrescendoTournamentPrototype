///@func controller_get_input(device)
///@param device
///@desc Returns an array of current inputs from a device.
function controller_get_input(argument0) {

	var _c = argument0;
	var _a = [];

	if (gamepad_button_check(_c, gp_face1)) then _a[array_length(_a)] = CONTROLLER.A;
	if (gamepad_button_check(_c, gp_face2)) then _a[array_length(_a)] = CONTROLLER.B;
	if (gamepad_button_check(_c, gp_face3)) then _a[array_length(_a)] = CONTROLLER.X;
	if (gamepad_button_check(_c, gp_face4)) then _a[array_length(_a)] = CONTROLLER.Y;
	if (gamepad_button_check(_c, gp_shoulderr)) then _a[array_length(_a)] = CONTROLLER.RB;
	if (gamepad_button_check(_c, gp_shoulderl)) then _a[array_length(_a)] = CONTROLLER.LB;
	if (gamepad_button_check(_c, gp_shoulderrb)) then _a[array_length(_a)] = CONTROLLER.RT;
	if (gamepad_button_check(_c, gp_shoulderlb)) then _a[array_length(_a)] = CONTROLLER.LT;
	if (gamepad_button_check(_c, gp_start)) then _a[array_length(_a)] = CONTROLLER.START;
	if (gamepad_button_check(_c, gp_select)) then _a[array_length(_a)] = CONTROLLER.SELECT;
	if (gamepad_button_check(_c, gp_padr) ||
		gamepad_button_check(_c, gp_padl) ||
		gamepad_button_check(_c, gp_padd) ||
		gamepad_button_check(_c, gp_padu)) then _a[array_length(_a)] = CONTROLLER.DPAD;
	
	return _a;


}
