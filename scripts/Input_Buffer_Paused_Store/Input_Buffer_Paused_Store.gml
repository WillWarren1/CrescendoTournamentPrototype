///@func Input_Buffer_Paused_Store()
///@desc Store certain inputs for obj_player while paused. Used in Frame Advance.
///Does not register control sticks or held inputs.
function Input_Buffer_Paused_Store() {

	var _buffer = input_buffer_paused;

#region Keyboard
	if (device_type == DEVICE.keyboard)
		{
		//Loop through the set keys and check what has been inputted
		for(var m = 0; m < array_length(custom_controls); m += 2)
			{
			var _key = custom_controls[m];
			var _input = custom_controls[m + 1];
			//Convert keyboard input to standard input
			if (_input < INPUT.length)
				{
				//Pressed
				if (keyboard_check_pressed(_key)) then _buffer[| _input] = true;
				}
			else
				{
				if (_input == CC_INPUT_KEYBOARD.LU)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.LD)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.LR)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.LL)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.RU)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.RD)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.RR)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.RL)
					{
					//Nothing
					}
				else if (_input == CC_INPUT_KEYBOARD.short_hop)
					{
					if (keyboard_check_pressed(_key)) then _buffer[| INPUT.jump] = true;
					}
				else if (_input == CC_INPUT_KEYBOARD.run)
					{
					//Nothing
					}
				}
			}
		}
#endregion 
#region Controller
	else if (device_type == DEVICE.controller)
		{
		//Loop through the set controls and check what has been inputted
		for(var m = 0; m < array_length(custom_controls); m += 2)
			{
			var _control = custom_controls[m];
			var _input = custom_controls[m + 1];
			//Convert controller input to standard input
			if (_input < INPUT.length)
				{
				//Pressed
				if (controller_check_input(device, _control, true))
					{
					_buffer[| _input] = true;
					}
				}
			else
				{
				if (_input == CC_INPUT_CONTROLLER.short_hop)
					{
					if (controller_check_input(device, _control, true)) then _buffer[| INPUT.jump] = true;
					}
				else if (_input == CC_INPUT_CONTROLLER.run)
					{
					//Nothing
					}
				}
			}
		}
#endregion

	has_paused_inputs = true;


}
