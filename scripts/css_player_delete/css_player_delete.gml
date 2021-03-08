///@func css_player_delete(index)
///@param index
///@desc Removes a player from the character select
function css_player_delete(argument0) {

	with(obj_css_data)
		{
		for(var i = 0; i < ds_list_size(players); i++)
			{
			var _player = players[| i];
			if (_player[CSS_PLAYER.index] == argument0)
				{
				ds_list_delete(players, i);
				}
			}
		}
}