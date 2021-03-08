///@func save_string_file_compressed(filename,string)
///@param filename
///@param string
function save_string_file_compressed() {
	var _filename, _str, _buffer;
	_filename = argument[0];
	_str = argument[1];

	//Delete the existing file
	if (file_exists(_filename))
		{
		file_delete(_filename);
		}
	
	//Make a buffer with enough space to fit the string
	_buffer = (buffer_create(string_byte_length(_str) + 1, buffer_fixed, 1));

	//Write the string into the buffer and export to the file
	buffer_write(_buffer, buffer_string, _str);
	_buffer = buffer_compress(_buffer, 0, buffer_tell(_buffer));
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);


}
