///@func ui_set_group(id,group)
///@param id
///@param group
function ui_set_group(argument0, argument1) {

	with(argument0)
		{
		group = argument1;
		if (group != -1)
			{
			with(obj_ui_group)
				{
				if (group == other.group)
					{
					other.ui_group_owner = id;
					break;
					}
				}
			if (ui_group_owner != noone)
				{
				ui_group_xoff = x - ui_group_owner.x;
				ui_group_yoff = y - ui_group_owner.y;
				}
			else
				{
				log("UI Group does not have owner!");
				}
			}
		}


}
