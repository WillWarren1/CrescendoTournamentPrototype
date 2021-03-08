///@func controller_any_input(device_number,[stick_tilt_amount],[pressed])
///@param device_number
///@param [stick_tilt_amount]
///@param [pressed]
function controller_any_input() {
	var _c = argument[0];
	var _a = argument_count > 1 ? argument[1] : stick_flick_amount;
	var _p = argument_count > 2 ? argument[2] : false;
	if (_p)
		{
		return
			abs(gamepad_axis_value(_c, gp_axislh)) > _a			||
			abs(gamepad_axis_value(_c, gp_axislv)) > _a			||
			abs(gamepad_axis_value(_c, gp_axisrh)) > _a			||
			abs(gamepad_axis_value(_c, gp_axisrv)) > _a			||
			gamepad_button_check_pressed(_c, gp_face1)			||
			gamepad_button_check_pressed(_c, gp_face2)			||
			gamepad_button_check_pressed(_c, gp_face3)			||
			gamepad_button_check_pressed(_c, gp_face4)			||
			gamepad_button_check_pressed(_c, gp_shoulderr)		||
			gamepad_button_check_pressed(_c, gp_shoulderl)		||
			gamepad_button_check_pressed(_c, gp_shoulderrb)		||
			gamepad_button_check_pressed(_c, gp_shoulderlb)		||
			gamepad_button_check_pressed(_c, gp_start)			||
			gamepad_button_check_pressed(_c, gp_select)			||
			gamepad_button_check_pressed(_c, gp_padr)			||
			gamepad_button_check_pressed(_c, gp_padl)			||
			gamepad_button_check_pressed(_c, gp_padd)			||
			gamepad_button_check_pressed(_c, gp_padu);
		}
	else
		{
		return
			abs(gamepad_axis_value(_c, gp_axislh)) > _a			||
			abs(gamepad_axis_value(_c, gp_axislv)) > _a			||
			abs(gamepad_axis_value(_c, gp_axisrh)) > _a			||
			abs(gamepad_axis_value(_c, gp_axisrv)) > _a			||
			gamepad_button_check(_c, gp_face1)			||
			gamepad_button_check(_c, gp_face2)			||
			gamepad_button_check(_c, gp_face3)			||
			gamepad_button_check(_c, gp_face4)			||
			gamepad_button_check(_c, gp_shoulderr)		||
			gamepad_button_check(_c, gp_shoulderl)		||
			gamepad_button_check(_c, gp_shoulderrb)		||
			gamepad_button_check(_c, gp_shoulderlb)		||
			gamepad_button_check(_c, gp_start)			||
			gamepad_button_check(_c, gp_select)			||
			gamepad_button_check(_c, gp_padr)			||
			gamepad_button_check(_c, gp_padl)			||
			gamepad_button_check(_c, gp_padd)			||
			gamepad_button_check(_c, gp_padu);
		}


}
