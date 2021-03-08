///@func ui_button_set_colors(id,normal,hover,clicked,[group])
///@param id
///@param normal
///@param hover
///@param clicked
///@param [group]
function ui_button_set_colors() {

	var _id = argument[0];
	var _n = argument[1];
	var _h = argument[2];
	var _c = argument[3];
	var _group = argument_count > 4 ? argument[4] : -1;

	if (_group != -1)
		{
		with(obj_ui_button)
			{
			if (group == _group)
				{
				color_normal = _n;
				color_hover = _h;
				color_clicked = _c;
				image_blend = color_normal;
				}
			}
		}
	else
		{
		_id.color_normal = _n;
		_id.color_hover = _h;
		_id.color_clicked = _c;
		_id.image_blend = color_normal;
		}


}
