///Standard_Parry_Stun
function Standard_Parry_Stun() {
	//Contains the standard actions for the parry stun state.
	var run = true;
#region Animation
	if (on_ground())
		{
		anim_loop_continue(my_sprites[? "ParryS"]);
		}
#endregion
#region Friction and Gravity
	if (on_ground())
		{
		friction_gravity(hard_landing_friction, grav, max_fall_speed);
		}
	else
		{
		friction_gravity(air_friction, grav, max_fall_speed);
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
