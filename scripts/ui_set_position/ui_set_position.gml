///@func ui_set_position(id,x,y,[group])
///@param id
///@param x
///@param y
///@param [group]
function ui_set_position() {

	var _id = argument[0];
	var _x = argument[1];
	var _y = argument[2];
	var _group = argument_count > 3 ? argument[3] : -1;

	if (_group != -1)
		{
		with(obj_ui_group)
			{
			if (group == _group)
				{
				x = _x;
				y = _y;
				break;
				}
			}
		with(obj_ui_parent)
			{
			if (group == _group)
				{
				x = ui_group_owner.x + ui_group_xoff;
				y = ui_group_owner.y + ui_group_yoff;
				}
			}
		}
	else
		{
		_id.x = _x;
		_id.y = _y;
		}
}