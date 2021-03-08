///Standard_Wall_Jump
function Standard_Wall_Jump() {
	//Contains the standard actions for the wall jump state.
	var run = true;
	#region Landing
	if (run && check_landing()) run = false;
	#endregion
	#region Transition through phases of wall jumping
	if (run)
		{
		switch(state_phase)
			{
			case 0:
				{
				//Speeds
				speed_set(0, 0, false, false);
		
				if (state_frame == 0)
					{
					state_phase++;
					state_frame = wall_jump_time;
					speed_set(wall_jump_hsp * facing, wall_jump_vsp, false, false);
					}
				break;
				}
			case 1:
				{
				//Speeds
				friction_gravity(air_friction, grav, max_fall_speed);
		
				if (run && state_frame == 0)
					{
					state_phase = 0;
					state_frame = 0;
					wall_jump_timeout = wall_jump_normal_timeout;
					state_set(PLAYER_STATE.aerial);
					run = false;
					}
			
				//Cancels
				if (run && double_jumps > 0)
					{
					//If jump is being pressed
					if (button(INPUT.jump, buff))
						{
						double_jump();
						run = false;
						}
					}
				
				//Actions
				if (run && check_airdodge())	run = false;
				if (run && check_aerials())		run = false;
				if (run && check_smashes())		run = false;
				if (run && check_specials())	run = false;
				break;
				}
			}
		}
	#endregion
	move();
}