///@func Input_Name_Get(input)
///@param input
function Input_Name_Get() {
	switch(argument[0])
		{
		case INPUT.attack:	return "Attack";
		case INPUT.grab:	return "Grab";
		case INPUT.jump:	return "Jump";
		case INPUT.pause:	return "Pause";
		case INPUT.shield:	return "Shield";
		case INPUT.smash:	return "Smash";
		case INPUT.special: return "Special";
		case INPUT.taunt:	return "Taunt";
		default: crash("Input_Name_Get received an invalid input (", argument[0], ")"); break;
		}
}