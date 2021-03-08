/// @description <Run by obj_game>
//Snap to the player instance
if (instance_exists(owner))
	{
	x = owner.x;
	y = owner.y;
	
	//Do not update invulnerability while in hitlag
	if (owner.self_hitlag_frame <= 0 && owner.state != PLAYER_STATE.in_hitlag)
		{
		hurtbox_inv_update();
		}
	image_xscale = abs(image_xscale) * owner.facing;
	}
else
	{
	instance_destroy();
	}