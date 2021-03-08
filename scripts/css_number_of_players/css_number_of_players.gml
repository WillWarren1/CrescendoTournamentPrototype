///@func css_number_of_players
///@desc Returns the number of players on the character select screen
function css_number_of_players() {

	with(obj_css_data)
		{
		return ds_list_size(players);
		}
}