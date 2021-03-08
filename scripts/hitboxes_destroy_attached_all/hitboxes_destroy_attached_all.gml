///@func hitboxes_destroy_attached_all([hitbox_list])
///@param [hitbox_list]
function hitboxes_destroy_attached_all() {
	//Destroys all of the attached hitboxes
	var _list = argument_count > 0 ? argument[0] : my_hitboxes;
	while(!ds_list_empty(_list))
		{
		//Instances remove themselves automatically
		if (instance_exists(_list[| 0]))
			{
			with(_list[| 0])
				{
				instance_destroy();
				}
			}
		else
			{
			ds_list_delete(_list, 0);
			}
		}


}
