///@func Profile_Create(name,wins,games_played,custom_controls,favorite_skins,color,auto)
///@param name
///@param wins
///@param games_played
///@param custom_controls
///@param favorite_skins
///@param color
///@param auto
function Profile_Create(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var _new = ds_list_create();
	ds_list_add(_new, argument0);
	ds_list_add(_new, argument1);
	ds_list_add(_new, argument2);
	ds_list_add(_new, argument3);
	ds_list_mark_as_map(_new, 3); //Mark the custom controls as a map
	ds_list_add(_new, argument4);
	ds_list_add(_new, argument5);
	ds_list_add(_new, argument6);
	ds_list_add(engine().profiles, _new);
	ds_list_mark_as_list(engine().profiles, ds_list_size(engine().profiles) - 1);
	return ds_list_size(engine().profiles) - 1;
}