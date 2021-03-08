///@func hitboxes_destroy_group(group_number,hitbox_list)
///@param group_number
///@param hitbox_list
function hitboxes_destroy_group() {
	//Loop through all attached hitboxes
	var _list = argument[1];
	for(var i = 0; i < ds_list_size(_list); i++)
		{
		var _hitbox = _list[|i];
		if (_hitbox.hitbox_group == argument[0])
			{
			instance_destroy(_hitbox);
			}
		}
	
	/*
	with(obj_hitbox_attached)
		{
		if (hitbox_group==argument0 && owner==argument1)
			{
			instance_destroy();
			}
		}
	//*/


}
