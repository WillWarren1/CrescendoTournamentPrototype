///@fun css_ui_ready_step()
function css_ui_ready_step() {
	if (ui_clicked)
		{
		if (image_index == 0 || image_index == 1)
			{
		
			}
		else
			{
			image_index = 0;
			}
		css_player_ready_toggle(index);
		}
	var _ready = css_player_get(index, CSS_PLAYER.ready);
	if (!ui_click_hold)
		{
		if (ui_hovered)
			{
			if (!_ready)
				{
				image_index = 1;
				}
			else
				{
				image_index = 3;
				}
			}
		else
			{
			if (!_ready)
				{
				image_index = 0;
				}
			else
				{
				image_index = 2;
				}
			}
		}


}
