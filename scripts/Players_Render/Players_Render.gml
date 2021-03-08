///@func Players_Render(list)
///@param list
function Players_Render(argument0) {
	var _l = argument0;
	for(var i = 0; i < ds_list_size(_l); i++)
		{
		var _player = _l[| i];
		with(_player)
			{
			if (renderer == other.object_index)
				{
				event_user(Game_Event_Draw);
				}
			}
		}


}
