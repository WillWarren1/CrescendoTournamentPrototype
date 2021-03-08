///@func ds_list_deep_copy(list)
///@desc Creates a deep copy of a ds list
function ds_list_deepcopy(argument0) {
	var map = ds_map_create();
	ds_map_add_list(map, "root", argument0);

	var json = json_encode(map);
	var copied_map = json_decode(json);

	ds_map_delete(map, "root");
	ds_map_destroy(map);

	var list = copied_map[? "root"];
	ds_map_delete(copied_map, "root");
	ds_map_destroy(copied_map);

	return list;


}
