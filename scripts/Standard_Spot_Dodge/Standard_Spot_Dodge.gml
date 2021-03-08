///Standard_Spot_Dodge
function Standard_Spot_Dodge() {
	//Contains the standard actions for the spot dodge state.
	var run = true;
	//Animation is done in the phase switch
	#region Cancel in air
	if (run && !on_ground())
		{
		state_set(PLAYER_STATE.aerial);
		run = false;
		}
	#endregion
	#region Transition through phases of spot dodging
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
					state_frame = spot_dodge_active;
					//Invulnerability
					hurtbox_inv_set(hurtbox, INV.invincible, spot_dodge_active);
					}
				break;
				}
			case 1:
				{
				//Animation
				anim_speed = anim_speed_normal;
				if (state_frame == 0)
					{
					state_phase++;
					state_frame = spot_dodge_endlag;
					}
				break;
				}
			case 2:
				{
				//End spot dodge
				if (state_frame == 0)
					{
					state_phase = 0;
					//Back to Idle State, unless Shield is being held down
					if (!check_shield())
						{
						state_set(PLAYER_STATE.idle);
						}
					else
						{
						state_set(PLAYER_STATE.shielding);
						}
					}
				break;
				}
			default: break;
			}
		}
	#endregion
	move_grounded();
}