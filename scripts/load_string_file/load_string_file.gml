///@func load_string_file(filename)
///@param filename
function load_string_file() {
	var _filename, _buffer, _str;
	_filename = argument[0];

	//Make a data buffer from the file and put it in a string
	if (file_exists(_filename))
		{
		_buffer = buffer_load(_filename);
		_str = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);

		//Return the string
		return _str;
		}
	else
		{
		crash("File does not exist!");
		return;
		}
}