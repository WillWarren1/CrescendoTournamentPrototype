///@func Replay_Buffer_Add_Chunk(src_buffer,dest_buffer)
///@param src_buffer
///@param dest_buffer
function Replay_Buffer_Add_Chunk() {
	/*
	-Header-
	Chunk size in bytes
	*/
	var _source = argument[0],
		_destination = argument[1];
	buffer_resize(_source, buffer_tell(_source));
	var _size = buffer_get_size(_source);
	
	//Put the header info at the top
	buffer_write(_destination, buffer_string, string(_size));

	//Copy the source into the destination
	buffer_resize(_destination, buffer_get_size(_destination));
	buffer_copy(_source, 0, _size, _destination, buffer_tell(_destination));
	buffer_seek(_destination, buffer_seek_relative, _size);


}
