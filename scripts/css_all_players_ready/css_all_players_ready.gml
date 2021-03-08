///@func css_all_players_ready()
///@desc Returns true if all players are marked as ready.
function css_all_players_ready() {

	var _ready = true;
	with(obj_css_data)
		{
		for(var i = 0; i < css_number_of_players(); i++)
			{
			if (!css_player_get(css_player_index(i), CSS_PLAYER.ready))
				{
				_ready = false;
				break;
				}
			}
		}
	return _ready;


}
