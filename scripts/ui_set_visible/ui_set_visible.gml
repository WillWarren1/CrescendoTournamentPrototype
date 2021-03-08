///@func ui_set_visible(id,value,[group])
///@param id
///@param value
///@param [group]
function ui_set_visible() {

	var _id = argument[0];
	var _val = argument[1];
	var _group = argument_count > 2 ? argument[2] : -1;

	if (_group != -1)
		{
		with(obj_ui_parent)
			{
			if (group == _group)
				{
				visible = _val;
				}
			}
		}
	else
		{
		_id.visible = _val;
		}


}
