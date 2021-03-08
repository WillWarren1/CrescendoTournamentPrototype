///@func stick_tilted(stick,[directions],[buffer_time],[stick_check_type])
///@param stick
///@param [directions]
///@param [buffer_time]
///@param [stick_check_type]
function stick_tilted() {
	//Get the index of the sticks on the input buffer
	//Can additionally check if the stick is tilted in any of the given directions
	var _stick = (argument[0] == Lstick ? control_tilted_l : control_tilted_r);
	var _buff = argument_count > 2 ? argument[2] : 0;
	var _type = argument_count > 3 ? argument[3] : stick_check_type;
	if (_stick <= _buff)
		{
		if (argument_count > 1)
			{
			//Stick check type
			if (_type == STICK_CHECK_TYPE.backwards)
				{
				//Check direction of the stick on the frame it was tilted
				if (stick_direction(argument[0], argument[1], _stick))
					{
					return true;
					}
				}
			else if (_type == STICK_CHECK_TYPE.current)
				{
				//Check direction of the stick on the current frame
				if (stick_direction(argument[0], argument[1], 0))
					{
					return true;
					}
				}
			return false;
			}
		else
			{
			return true;
			}
		}
	return false;


}
