///@func buffer_write_section(buffer,section_number,func)
///@param buffer
///@param section_number
///@param func
///@desc Calls the given function, then writes the number & size of the section at the start position in the buffer.
/*
- Default limit of 256 sections
- Max section size of 65535
*/
function buffer_write_section() {
	var _b = argument[0];
	var _num = argument[1];
	var _func = argument[2];
	
	
	//Section number
	buffer_write(_b, buffer_u8, _num);
	
	//Reserve space for the section size
	var _size_position = buffer_tell(_b);
	buffer_write(_b, buffer_u16, 0);
	
	//Run the function, passing in the buffer index
	_func(_b);
	
	//Find the size of the section added
	var _final_size = buffer_tell(_b) - _size_position - 2;
	
	//Go back and write the size of the section
	buffer_poke(_b, _size_position, buffer_u16, _final_size);
}