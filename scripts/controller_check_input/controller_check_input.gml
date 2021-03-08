///@func controller_check_input(device,button/stick,pressed)
///@param device
///@param button/stick
///@param pressed
///Use the CONTROLLER enum. Xbox layout. Stick values must be cached ahead of time. Only works for obj_player.
function controller_check_input(argument0, argument1, argument2) {

	var _c = argument0;
	var _b = argument1;
	var _p = argument2;

	if (_p)
		{
		switch(_b)
			{
			case CONTROLLER.A: return gamepad_button_check_pressed(_c, gp_face1);
			case CONTROLLER.B: return gamepad_button_check_pressed(_c, gp_face2);
			case CONTROLLER.X: return gamepad_button_check_pressed(_c, gp_face3);
			case CONTROLLER.Y: return gamepad_button_check_pressed(_c, gp_face4);
			case CONTROLLER.LB: return gamepad_button_check_pressed(_c, gp_shoulderl);
			case CONTROLLER.LT: return gamepad_button_check_pressed(_c, gp_shoulderlb);
			case CONTROLLER.RB: return gamepad_button_check_pressed(_c, gp_shoulderr);
			case CONTROLLER.RT: return gamepad_button_check_pressed(_c, gp_shoulderrb);
			case CONTROLLER.START: return gamepad_button_check_pressed(_c, gp_start);
			case CONTROLLER.SELECT: return gamepad_button_check_pressed(_c, gp_select);
			case CONTROLLER.DPAD: return 
				gamepad_button_check_pressed(_c, gp_padd) ||
				gamepad_button_check_pressed(_c, gp_padu) ||
				gamepad_button_check_pressed(_c, gp_padr) ||
				gamepad_button_check_pressed(_c, gp_padl);
			default: crash("Invalid button/stick for controller_check_input!"); break;
			}
		}
	else
		{
		switch(_b)
			{
			case CONTROLLER.A: return gamepad_button_check(_c, gp_face1);
			case CONTROLLER.B: return gamepad_button_check(_c, gp_face2);
			case CONTROLLER.X: return gamepad_button_check(_c, gp_face3);
			case CONTROLLER.Y: return gamepad_button_check(_c, gp_face4);
			case CONTROLLER.LB: return gamepad_button_check(_c, gp_shoulderl);
			case CONTROLLER.LT: return gamepad_button_check(_c, gp_shoulderlb);
			case CONTROLLER.RB: return gamepad_button_check(_c, gp_shoulderr);
			case CONTROLLER.RT: return gamepad_button_check(_c, gp_shoulderrb);
			case CONTROLLER.START: return gamepad_button_check(_c, gp_start);
			case CONTROLLER.SELECT: return gamepad_button_check(_c, gp_select);
			case CONTROLLER.DPAD: return 
				gamepad_button_check(_c, gp_padd) ||
				gamepad_button_check(_c, gp_padu) ||
				gamepad_button_check(_c, gp_padr) ||
				gamepad_button_check(_c, gp_padl);
			default: crash("Invalid button/stick for controller_check_input!"); break;
			}
		}
	return false;
}