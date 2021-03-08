///Standard_Parry_Stun
function Standard_Parry_Stun() {
	//Contains the standard actions for the parry stun state.
	var run = true;
	
	//Animation
	anim_loop_continue(my_sprites[? "ParryS"]);

	//Friction and Gravity
	friction_gravity(hard_landing_friction, grav, max_fall_speed);
	
	//Cancel in the air
	if (run && check_aerial()) run = false;

	//When the lag is done
	if (run && state_frame == 0)
		{
		//Return to idle state
		state_set(PLAYER_STATE.idle);
		run = false;
		}

	move();
}