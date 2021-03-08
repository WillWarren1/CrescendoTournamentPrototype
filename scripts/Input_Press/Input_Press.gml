///@func Input_Press
///@param inputs...
///@desc Changes values in the input buffer to simulate a player pressing an input.
function Input_Press() {

	for(var i = 0; i < argument_count; i++)
		{
		input_buffer[| argument[i]] = 0;
		}


}
