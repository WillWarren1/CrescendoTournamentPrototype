///@func Input_Replay_Convert(replay_buffer,input_buffer)
///@param replay_buffer
///@param input_buffer
///@desc Takes an input buffer and converts it to a string to be added to the replay list.
function Input_Replay_Convert() {
	/*

	- 26 inputs

	*/
	var _replay = argument[0],
		_input = argument[1];
	
	//Loop through the inputs
	var _flag = 0;
	for(var m = 0; m < (INPUT.length * 2); m++)
		{
		if (_input[| m] == 0)
			{
			_flag = bitflag_write(_flag, m);
			}
		}
	buffer_write(_replay, buffer_u32, _flag);

	//Control stick data
	buffer_write(_replay, buffer_f64, (stick_get_value(Lstick, DIR.horizontal)));
	buffer_write(_replay, buffer_f64, (stick_get_value(Lstick, DIR.vertical	)));
	buffer_write(_replay, buffer_f64, (stick_get_value(Rstick, DIR.horizontal)));
	buffer_write(_replay, buffer_f64, (stick_get_value(Rstick, DIR.vertical	)));
	
	//Stick frames
	buffer_write(_replay, buffer_s8, control_flicked_l);
	buffer_write(_replay, buffer_s8, control_tilted_l);
	buffer_write(_replay, buffer_s8, control_flicked_r);
	buffer_write(_replay, buffer_s8, control_tilted_r);

	//*/DEBUG
	if (replay_sync_mode)
		{
		buffer_write(_replay, buffer_s16, x);
		buffer_write(_replay, buffer_s16, y);
		buffer_write(_replay, buffer_u8, state);
		buffer_write(_replay, buffer_f64, hsp);
		buffer_write(_replay, buffer_f64, vsp);
		buffer_write(_replay, buffer_f64, stick_get_direction(Lstick));
		//buffer_write(_replay, buffer_f64, stick_get_value(Lstick, DIR.horizontal));
		}
	//*/


}
