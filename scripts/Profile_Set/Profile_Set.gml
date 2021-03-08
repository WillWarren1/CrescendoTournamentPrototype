///@func Profile_Set(profile_num,setting,value)
///@param profile_num
///@param setting
///@param value
function Profile_Set() {
	var _list = engine().profiles[| argument[0]],
		_setting = argument[1],
		_val = argument[2];
	
	_list[| _setting] = _val;


}
