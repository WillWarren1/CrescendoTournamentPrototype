/// @description
// Inherit the parent event
event_inherited();

if (instance_exists(owner) && ds_exists(owner.my_hitboxes, ds_type_list))
	{
	ds_list_delete(owner.my_hitboxes, ds_list_find_index(owner.my_hitboxes, id));
	}