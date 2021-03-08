///@func Replays_Scan()
function Replays_Scan() {
	var _files = [];
	for(var f = file_find_first(working_directory + string(version) + "\\*", 0); f != ""; f = file_find_next())
		{
		_files[array_length(_files)] = f;
		}
	return _files;


}
