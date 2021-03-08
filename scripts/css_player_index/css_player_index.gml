///@func css_player_index
///@param list_position
///@desc Returns the index of the player at the position in the players list.
function css_player_index(argument0) {

	with(obj_css_data)
		{
		var _player = players[| argument0];
		return _player[CSS_PLAYER.index];
		}
	return undefined;


}
