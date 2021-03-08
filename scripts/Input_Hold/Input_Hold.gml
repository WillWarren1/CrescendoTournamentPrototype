///@func Input_Press
///@param inputs...
///@desc Changes values in the input buffer to simulate a player holding an input.
function Input_Hold() {

	for(var i = 0; i < argument_count; i++)
		{
		input_buffer[| argument[i] + INPUT.length] = 0;
		}


}
