///@func CC_Input_Name_Get(device_type,input)
///@param device_type
///@param input
function CC_Input_Name_Get() {
	if (argument[0] == DEVICE.controller)
		{
		switch(argument[1])
			{
			case CC_INPUT_CONTROLLER.attack:	return "Attack";
			case CC_INPUT_CONTROLLER.grab:		return "Grab";
			case CC_INPUT_CONTROLLER.jump:		return "Jump";
			case CC_INPUT_CONTROLLER.pause:		return "Pause";
			case CC_INPUT_CONTROLLER.shield:	return "Shield";
			case CC_INPUT_CONTROLLER.smash:		return "Smash";
			case CC_INPUT_CONTROLLER.special:	return "Special";
			case CC_INPUT_CONTROLLER.taunt:		return "Taunt";
		
			case CC_INPUT_CONTROLLER.short_hop:	return "Short Hop";
			case CC_INPUT_CONTROLLER.run:		return "Run";
			default: crash("CC_Input_Name_Get received an invalid input (", argument[0], ")"); break;
			}
		}
	else if (argument[0] == DEVICE.keyboard)
		{
		switch(argument[1])
			{
			case CC_INPUT_KEYBOARD.attack:		return "Attack";
			case CC_INPUT_KEYBOARD.grab:		return "Grab";
			case CC_INPUT_KEYBOARD.jump:		return "Jump";
			case CC_INPUT_KEYBOARD.pause:		return "Pause";
			case CC_INPUT_KEYBOARD.shield:		return "Shield";
			case CC_INPUT_KEYBOARD.smash:		return "Smash";
			case CC_INPUT_KEYBOARD.special:		return "Special";
			case CC_INPUT_KEYBOARD.taunt:		return "Taunt";
		
			case CC_INPUT_KEYBOARD.short_hop:	return "Short Hop";
			case CC_INPUT_KEYBOARD.run:			return "Run";
			case CC_INPUT_KEYBOARD.LR:			return "LR";
			case CC_INPUT_KEYBOARD.LL:			return "LL";
			case CC_INPUT_KEYBOARD.LU:			return "LU";
			case CC_INPUT_KEYBOARD.LD:			return "LD";
			case CC_INPUT_KEYBOARD.RR:			return "RR";
			case CC_INPUT_KEYBOARD.RL:			return "RL";
			case CC_INPUT_KEYBOARD.RU:			return "RU";
			case CC_INPUT_KEYBOARD.RD:			return "RD";
			default: crash("CC_Input_Name_Get received an invalid input (", argument[0], ")"); break;
			}
		}
}