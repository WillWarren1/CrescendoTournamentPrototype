///@func css_player_ready_toggle(index)
///@param index
function css_player_ready_toggle(argument0) {

	with(obj_css_ui)
		{
		//Toggle Ready
		css_player_set(argument0, CSS_PLAYER.ready, !css_player_get(argument0, CSS_PLAYER.ready));

		//If every player is ready, start the game
		if (css_all_players_ready())
			{
			css_start_game();
			}
		}


}
