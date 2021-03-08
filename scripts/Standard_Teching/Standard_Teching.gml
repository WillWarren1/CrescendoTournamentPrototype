///Standard_Teching
function Standard_Teching() {
	//Contains the standard actions for the teching state.
	var run = true;
#region Transition through phases of teching
	switch(state_phase)
		{
		case 0:
			{
			//No speed
			speed_set(0, 0, false, false);
			hurtbox_inv_set(hurtbox, INV.invincible, state_frame);
			if (state_frame == 0)
				{
				//Next phase
				state_phase++;
				state_frame = tech_endlag;
				}
			break;
			}
		case 1:
			{
			if (run && state_frame == 0)
				{
				state_phase = 0;
				//Back to Idle State
				state_set(PLAYER_STATE.idle);
				run = false;
				}
			break;
			}
		default: break;
		}
#endregion
	//No movement


}
