///@func css_player_get(index,property)
///@param index
///@param property
///@desc Get the value of a property of a player on the character select screen
function css_player_get(argument0, argument1) {

	with(obj_css_data)
		{
		for(var i = 0; i < ds_list_size(players); i++)
			{
			var _player = players[| i];
			if (_player[CSS_PLAYER.index] == argument0)
				{
				return _player[argument1];
				}
			}
		}
	return undefined;


}
