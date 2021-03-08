///@func buffer_append(src_buffer,dest_buffer,dest_offset)
///@param src_buffer
///@param dest_buffer
///@param dest_offset
function buffer_append() {
	var _src = argument[0];
	var _dest = argument[1];
	var _offset = argument[2];
	
	//Get the size of the buffer to append to the destination buffer
	var _size = buffer_get_size(_src);
	
	//Resize the destination buffer so it will have just enough space after the offset amount
	buffer_resize(_dest, _offset + _size);
	
	//Copy the source to the destination
	buffer_copy(_src, 0, buffer_get_size(_src), _dest, _offset);
}