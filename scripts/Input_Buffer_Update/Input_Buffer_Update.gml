///@func Input_Buffer_Update(count)
///@param count
///Can only be called by players
function Input_Buffer_Update(argument0) {
	var _buffer, _count;
	_buffer = input_buffer;
	_count = argument0;

	#region Input Buffer Count
	if (_count)
		{
		//Counts for each input
		for(var i = 0; i < (INPUT.length * 2); i++)
			{
			_buffer[| i] = min(++_buffer[| i], max_buffer_length);
			}
		}
	#endregion
	#region Keyboard
	if (device_type == DEVICE.keyboard)
		{
		//Control stick values
		var _l_rl = 0, _l_ud = 0, _r_rl = 0, _r_ud = 0, _run_button = false;
	
		//Loop through the set keys and check what has been inputted
		for(var m = 0; m < array_length(custom_controls); m += 2)
			{
			var _key = custom_controls[m];
			var _input = custom_controls[m + 1];
			//Convert keyboard input to standard input
			if (_input < INPUT.length)
				{
				//Pressed
				if (keyboard_check_pressed(_key)) then _buffer[| _input] = 0;
				//Held
				if (keyboard_check(_key)) then _buffer[| _input + INPUT.length] = 0;
				}
			else
				{
				if (_input == CC_INPUT_KEYBOARD.LU)
					{
					if (keyboard_check(_key)) then _l_ud += -1;
					}
				else if (_input == CC_INPUT_KEYBOARD.LD)
					{
					if (keyboard_check(_key)) then _l_ud += 1;
					}
				else if (_input == CC_INPUT_KEYBOARD.LR)
					{
					if (keyboard_check(_key)) then _l_rl += 1;
					}
				else if (_input == CC_INPUT_KEYBOARD.LL)
					{
					if (keyboard_check(_key)) then _l_rl += -1;
					}
				else if (_input == CC_INPUT_KEYBOARD.RU)
					{
					if (keyboard_check(_key)) then _r_ud += -1;
					}
				else if (_input == CC_INPUT_KEYBOARD.RD)
					{
					if (keyboard_check(_key)) then _r_ud += 1;
					}
				else if (_input == CC_INPUT_KEYBOARD.RR)
					{
					if (keyboard_check(_key)) then _r_rl += 1;
					}
				else if (_input == CC_INPUT_KEYBOARD.RL)
					{
					if (keyboard_check(_key)) then _r_rl += -1;
					}
				else if (_input == CC_INPUT_KEYBOARD.short_hop)
					{
					if (keyboard_check_pressed(_key)) then _buffer[| INPUT.jump] = 0;
					}
				else if (_input == CC_INPUT_KEYBOARD.run)
					{
					if (keyboard_check(_key)) then _run_button = true;
					}
				}
			}
		
		//Make sure control stick inputs are valid
		_l_rl = sign(_l_rl);
		_l_ud = sign(_l_ud);
		_r_rl = sign(_r_rl);
		_r_ud = sign(_r_ud);
		
		//Control sticks
		if (scs_switch_sticks) then Stick_Cache_Values(Rstick, _l_rl, _l_ud, _count);
		else Stick_Cache_Values(Rstick, _r_rl, _r_ud, _count);
	
		var _dist = stick_get_distance(Rstick);
		if (_dist > rstick_flick_amount &&
			stick_get_speed(Rstick) > rstick_flick_speed &&
			control_flicked_r > stick_flick_cooldown)
			{
			_buffer[| scs_right_stick_input] = 0;
			control_flicked_r = 0;
			}
		if (_dist > rstick_tilt_amount)
			{
			_buffer[| scs_right_stick_input + INPUT.length] = 0;
			control_tilted_r = 0;
			}
	
		if (scs_switch_sticks) then Stick_Cache_Values(Lstick, _r_rl, _r_ud, _count);
		else Stick_Cache_Values(Lstick, _l_rl, _l_ud, _count);

		var _dist = stick_get_distance(Lstick);
		if (_dist > stick_flick_amount &&
			stick_get_speed(Lstick) > stick_flick_speed && !scs_auto_walk &&
			control_flicked_l > stick_flick_cooldown)
			{
			control_flicked_l = 0;
			}
		if (_dist > stick_tilt_amount)
			{
			control_tilted_l = 0;
			}
		
		//Running / Walking
		if (_run_button)
			{
			if (scs_auto_walk)
				{
				if (control_tilted_l == 0)
					{
					control_flicked_l = 0;
					}
				}
			else
				{
				if (control_flicked_l == 0)
					{
					control_flicked_l = max_buffer_length;
					control_tilted_l = 0;
					}
				}
			}
		
		//Tap Jump
		if (scs_tap_jump)
			{
			if (stick_flicked(Lstick, DIR.up, 0, false))
				{
				_buffer[| INPUT.jump] = 0;
				}
			if (stick_tilted(Lstick, DIR.up, 0))
				{
				_buffer[| INPUT.jump + INPUT.length] = 0;
				}
			}
		}
	#endregion 
	#region Controller
	else if (device_type == DEVICE.controller)
		{
		//Control sticks
		if (scs_switch_sticks) then Stick_Cache_Values(Rstick, gamepad_axis_value(device, gp_axislh), gamepad_axis_value(device, gp_axislv), _count);
		else Stick_Cache_Values(Rstick, gamepad_axis_value(device, gp_axisrh), gamepad_axis_value(device, gp_axisrv), _count);
	
		var _dist = stick_get_distance(Rstick);
		if (_dist > rstick_flick_amount &&
			stick_get_speed(Rstick) > rstick_flick_speed &&
			control_flicked_r > stick_flick_cooldown)
			{
			_buffer[| scs_right_stick_input] = 0;
			control_flicked_r = 0;
			}
		if (_dist > rstick_tilt_amount)
			{
			_buffer[| scs_right_stick_input + INPUT.length] = 0;
			control_tilted_r = 0;
			}
		if (scs_switch_sticks) then Stick_Cache_Values(Lstick, gamepad_axis_value(device, gp_axisrh), gamepad_axis_value(device, gp_axisrv), _count);
		else Stick_Cache_Values(Lstick, gamepad_axis_value(device, gp_axislh), gamepad_axis_value(device, gp_axislv), _count);
	
		var _dist = stick_get_distance(Lstick);
		if (_dist > stick_flick_amount &&
			stick_get_speed(Lstick) > stick_flick_speed && !scs_auto_walk &&
			control_flicked_l > stick_flick_cooldown)
			{
			control_flicked_l = 0;
			}
		if (_dist > stick_tilt_amount)
			{
			control_tilted_l = 0;
			}
		
		//Tap Jump
		if (scs_tap_jump)
			{
			if (stick_flicked(Lstick, DIR.up, 0, false))
				{
				_buffer[| INPUT.jump] = 0;
				}
			if (stick_tilted(Lstick, DIR.up, 0))
				{
				_buffer[| INPUT.jump + INPUT.length] = 0;
				}
			}
		
		//Loop through the set controls and check what has been inputted
		for(var m = 0; m < array_length(custom_controls); m += 2)
			{
			var _control = custom_controls[m];
			var _input = custom_controls[m + 1];
			//Convert controller input to standard input
			if (_input < INPUT.length)
				{
				//Pressed
				if (controller_check_input(device, _control, true)) then _buffer[| _input] = 0;
				//Hold
				if (controller_check_input(device, _control, false)) then _buffer[| _input + INPUT.length] = 0;
				}
			else
				{
				if (_input == CC_INPUT_CONTROLLER.short_hop)
					{
					if (controller_check_input(device, _control, true)) then _buffer[| INPUT.jump] = 0;
					}
				else if (_input == CC_INPUT_CONTROLLER.run)
					{
					if (controller_check_input(device, _control, false))
						{
						if (scs_auto_walk)
							{
							if (control_tilted_l == 0)
								{
								control_flicked_l = 0;
								}
							}
						else
							{
							if (control_flicked_l == 0)
								{
								control_flicked_l = max_buffer_length;
								control_tilted_l = 0;
								}
							}
						}
					}
				}
			}
		}
	#endregion


}
