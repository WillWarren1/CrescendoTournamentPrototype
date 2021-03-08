///@func Hitbox_Owner_Cleanup()
///@desc Cleans up datastructures related to owning hitboxes
function Hitbox_Owner_Cleanup() {
	ds_list_destroy(my_hitboxes);
	my_hitboxes = noone;
}
