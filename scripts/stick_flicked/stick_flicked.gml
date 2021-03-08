///@func stick_flicked(stick,[direction],[buffer_time],[delete_input],[stick_check_type])
///@param stick
///@param [direction]
///@param [buffer_time]
///@param [delete_input]
///@param [stick_check_type]
function stick_flicked() {
	//Get the index of the sticks on the input buffer
	var _stick = (argument[0] == Lstick ? control_flicked_l : control_flicked_r);
	var _buff = argument_count > 2 ? argument[2] : stick_flick_buff;
	var _del = argument_count > 3 ? argument[3] : true;
	var _type = argument_count > 4 ? argument[4] : stick_check_type;
	if (_stick <= _buff)
		{
		if (argument_count > 1)
			{
			//Stick check type
			if (_type == STICK_CHECK_TYPE.backwards)
				{
				//Check direction of the stick on the frame it was flicked
				if (stick_direction(argument[0], argument[1], _stick))
					{
					if (argument[0] == Lstick) 
						{
						if (_del) then control_flicked_l = max_buffer_length;
						}
					else 
						{
						if (_del) then control_flicked_r = max_buffer_length;
						}
					return true;
					}
				}
			else if (_type == STICK_CHECK_TYPE.current)
				{
				//Check direction of the stick on the current frame
				if (stick_direction(argument[0], argument[1], 0))
					{
					if (argument[0] == Lstick) 
						{
						if (_del) then control_flicked_l = max_buffer_length;
						}
					else 
						{
						if (_del) then control_flicked_r = max_buffer_length;
						}
					return true;
					}
				}
			return false;
			}
		else
			{
			if (argument[0] == Lstick) control_flicked_l = max_buffer_length;
			else control_flicked_r = max_buffer_length;
			return true;
			}
		}
	return false;


}
