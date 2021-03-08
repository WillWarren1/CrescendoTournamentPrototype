///@func ui_group_delete(group)
///@param group
function ui_group_delete() {

	var _group = argument[0];

	if (_group != -1)
		{
		with(obj_ui_parent)
			{
			if (group == _group) then instance_destroy();
			}
		with(obj_ui_group)
			{
			if (group == _group) then instance_destroy();
			}
		}
}