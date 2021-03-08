/// @description Calculate Group Position, Create Script, Add to List
//Groups
ui_group_xoff = 0;
ui_group_yoff = 0;
ui_group_owner = noone;

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
	
//Script
if (script_exists(ui_script_create))
	{
	script_execute(ui_script_create);
	}