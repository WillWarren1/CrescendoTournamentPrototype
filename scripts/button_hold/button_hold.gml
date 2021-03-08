///@func button_hold(input_index,[buffer_amount])
///@param input_index
///@param [buffer_amount]
///@desc Checks if you have held a button that was mapped to the given input
function button_hold() {
	var _ar, _in, _bu;
	_ar = input_buffer;
	_in = argument[0] + INPUT.length;
	_bu = argument_count > 1 ? argument[1] : 1;

	//Checks if the input has been pressed within the time
	if (_ar[| _in] <= _bu)
		{
		return true;
		}
	return false;


}
