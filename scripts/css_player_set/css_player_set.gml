///@func css_player_set(index,property,value)
///@param index
///@param property
///@param value
///@desc Change a property of one of the players on the character select screen
function css_player_set(argument0, argument1, argument2) {

	with(obj_css_data)
		{
		for(var i = 0; i < ds_list_size(players); i++)
			{
			var _player = players[| i];
			if (_player[CSS_PLAYER.index] == argument0)
				{
				_player[@ argument1] = argument2;
				}
			}
		}


}
