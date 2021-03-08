///@func buffer_reset(buffer)
///@param buffer
function buffer_reset() {
	var _buff = argument[0];
	buffer_resize(_buff, 1);
	buffer_seek(_buff, buffer_seek_start, 0);
}