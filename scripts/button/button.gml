///@func button(input_index,[buffer_time],[delete_input])
///@param input_index
///@param [buffer_time]
///@param [delete_input]
///@desc Checks if you pressed a button that was mapped to the given input
function button() {
	var _ar, _in, _bu, _de;
	_ar = input_buffer;
	_in = argument[0];
	_bu = argument_count > 1 ? argument[1] : buff; 
	_de = argument_count > 2 ? argument[2] : true;

	//Checks if the input has been pressed within the time
	if (_ar[| _in] <= _bu)
		{
		if (_de) then _ar[| _in] = max_buffer_length;
		return true;
		}
	return false;


}
