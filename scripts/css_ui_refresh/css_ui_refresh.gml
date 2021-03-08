///@func css_ui_refresh()
function css_ui_refresh() {

	var _number = css_number_of_players();
	var _size = (_number <= 4 ? 0 : 1);

	with(obj_css_ui)
		{
		for(var i = 0; i < _number; i++)
			{
			//Destroy existing UI
			var _index = css_player_index(i);
			var _group = (group_start_number + _index);
			ui_group_delete(_group);
		
			//Create new UI
			css_ui_create_player(i, _index, css_player_get(_index, CSS_PLAYER.is_cpu), _group, _size);
		
			//Reactivate cursor just in case
			css_ui_cursor_set_active(_index, true);
			}
		
		log("Refreshed UI!");
		}
}