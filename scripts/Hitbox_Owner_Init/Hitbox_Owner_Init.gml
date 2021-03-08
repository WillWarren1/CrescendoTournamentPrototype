///@func Hitbox_Owner_Init()
///@desc Sets up the necessary values for an object to create hitboxes.
function Hitbox_Owner_Init() {
	/*
	- This script provides only the bare minimum variables that are necessary for creating basic hitboxes.
	- Some types of hitboxes may require extra variables.
	*/

	state = PLAYER_STATE.attacking;

	//Hitbox groups array
	hitbox_groups = array_create(hitbox_groups_max, undefined);
	for(var i = 0; i < hitbox_groups_max; i++)
		{
		hitbox_groups[@ i] = [];
		}
	
	//My Hitboxes List - Keeps track of all of the user's hitboxes
	my_hitboxes = ds_list_create();
	
	any_hitbox_has_hit = false;
	any_hitbox_has_been_blocked = false;

	facing = 1;
	self_hitlag_frame = 0;

	palette = [[c_white], 1];
}