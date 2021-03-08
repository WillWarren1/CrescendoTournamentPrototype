///Standard_Shield_Break
function Standard_Shield_Break() {
	//Contains the standard actions for the shield break state.
	var run = true;
#region Speeds
	speed_set(0, 0, false, true);
	friction_gravity(0, grav, max_fall_speed);
#endregion
#region Animation and invulnerability
	if (on_ground())
		{
		hurtbox_inv_set(hurtbox, INV.normal, 0);
		anim_loop_continue(my_sprites[? "ShieldB"]);
		}
	else
		{
		hurtbox_inv_set(hurtbox, INV.invincible, 1);
		}
#endregion
#region When the lag is done
	if (run && state_frame == 0)
		{
		//Return to idle state
		state_set(PLAYER_STATE.idle);
		run = false;
		}
#endregion
	move();


}
