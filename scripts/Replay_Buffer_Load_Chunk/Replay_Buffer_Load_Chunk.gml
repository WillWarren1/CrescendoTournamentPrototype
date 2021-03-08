///@func Replay_Buffer_Load_Chunk(src_buffer,dest_buffer)
///@param src_buffer
///@param dest_buffer
function Replay_Buffer_Load_Chunk() {
	/*
	-Header-
	Chunk size in bytes
	*/
	var _source = argument[0],
		_destination = argument[1];
	
	//Put the header info at the top
	var _size = real(buffer_read(_source, buffer_string));
	//show_message(_size);

	//Copy the source into the destination, provided there is any content
	if (_size > 0)
		{
		buffer_resize(_destination, buffer_get_size(_destination) + _size);
		buffer_copy(_source, buffer_tell(_source), _size, _destination, 0);
		buffer_seek(_destination, buffer_seek_start, 0);
		buffer_seek(_source, buffer_seek_relative, _size);
		}


}
