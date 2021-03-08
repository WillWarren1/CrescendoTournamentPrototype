///Standard_Rolling
function Standard_Rolling() {
	//Contains the standard actions for the rolling state.
	var run = true;
	//Animation is done in the phase switch
	#region Special Airdodge exception for Melee Airdodge
	if (run && state_phase == 0 && airdodge_type == AIRDODGE_TYPE.rivals)
		{
		//If the jump button is pressed
		if (button(INPUT.jump, buff))
			{
			//Cancel the roll
			state_phase = 0;
			state_frame = 0;
			/* Modified airdodging code */
			//Set the state
			state_set(PLAYER_STATE.airdodging);
			//Set speeds
			var spd, dir;
			//If the control stick is not being pressed far enough, there is no movement
			if (stick_tilted(Lstick))
				{
				spd = airdodge_speed;
				dir = point_direction(0, 0, stick_get_value(Lstick, DIR.horizontal) * 10, stick_get_value(Lstick, DIR.vertical) * 10);
				}
			else
				{
				spd = 0;
				dir = 90;
				}
			//Speeds
			speed_set(lengthdir_x(spd, dir), lengthdir_y(spd, dir), false, false);
			//Set timers
			state_frame = 0;
			state_phase = 0;
			run = false;
			}
		}
	#endregion
	#region Cancel in air
	if (run && !on_ground())
		{
		state_set(PLAYER_STATE.aerial);
		run = false;
		}
	#endregion
	#region Transition through phases of rolling
	if (run)
		{
		switch(state_phase)
			{
			case 0:
				{
				//No speed
				speed_set(0, 0, false, false);
				if (state_frame == 0)
					{
					//Next phase
					state_phase++;
					state_frame = roll_active;
					//Invulnerability
					hurtbox_inv_set(hurtbox, INV.invincible, roll_active);
					//Speed
					speed_set(roll_speed * state_facing, 0, false, false);
					}
				break;
				}
			case 1:
				{
				if (state_frame == 0)
					{
					state_phase++;
					state_frame = roll_endlag;
					}
				break;
				}
			case 2:
				{
				//No speed
				speed_set(0, 0, false, false);
				//End roll
				if (run && state_frame == 0)
					{
					state_phase = 0;
					//Position the player to be backwards
					if (state_facing != 0)
						{
						facing = -sign(state_facing);
						}
					//Back to Idle State, unless Shield is being held down
					if ((shield_type == SHIELD_TYPE.melee || shield_type == SHIELD_TYPE.ultimate) && check_shield())
						{}
					else
						{
						state_set(PLAYER_STATE.idle);
						}
					run = false;
					}
				break;
				}
			default: break;
			}
		}
	#endregion
	move_grounded();
}