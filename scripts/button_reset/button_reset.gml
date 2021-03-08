///@func button_reset(input_index,[value])
///@param input_index
///@param [value]
///@desc Reset the input buffer for the given input
function button_reset() {
	var _ar, _in, _val;
	_ar = input_buffer;
	_in = argument[0];
	_val = argument_count > 1 ? argument[1] : max_buffer_length;

	_ar[| _in] = _val;


}
