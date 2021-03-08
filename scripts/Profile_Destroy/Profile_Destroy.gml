///@func Profile_Destroy(num)
///@param num
function Profile_Destroy() {
	var _list = engine().profiles[| argument[0]];
	var _cc = _list[| 3];
	ds_map_destroy(_cc);
	ds_list_destroy(_list);
	ds_list_delete(engine().profiles, argument[0]);


}
