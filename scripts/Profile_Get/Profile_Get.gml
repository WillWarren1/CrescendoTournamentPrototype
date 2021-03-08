///@func Profile_Get(profile_num,setting)
///@param profile_num
///@param setting
function Profile_Get() {
	var _list = engine().profiles[| argument[0]],
		_setting = argument[1];

	if (!is_undefined(_list) && !ds_exists(_list, ds_type_list))
		{
		crash("The profile at index ", argument[0], "does not exist!");
		}
	return _list[| _setting];
}