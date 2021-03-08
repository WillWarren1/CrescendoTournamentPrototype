///@func Profile_Save_All()
///@desc Opens up the standard save file and saves the new list
function Profile_Save_All() {
	var _save_map = ds_map_create();
	var _save_list = ds_list_deepcopy(engine().profiles);

	//Add the list to the map
	ds_map_add_list(_save_map, "PROFILES", _save_list);
	save_string_file(profiles_save, json_encode(_save_map));

	//Delete the DS
	ds_list_destroy(_save_list);
	ds_map_destroy(_save_map);


}
