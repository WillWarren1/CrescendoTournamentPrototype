///@func Input_Buffer_Paused_Load()
///@desc Load certain inputs for obj_player after unpausing. Used in Frame Advance.
function Input_Buffer_Paused_Load() {

	//For each pressed input
	for(var i = 0; i < INPUT.length; i++)
		{
		//Get paused input if there is one
		if (input_buffer_paused[| i])
			{
			input_buffer[| i] = 0;
			input_buffer_paused[| i] = false;
			}
		}

	has_paused_inputs = false;


}
