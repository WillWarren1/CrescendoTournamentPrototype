///Standard_Respawning
function Standard_Respawning() {
	//Contains the standard actions for the respawning state.
	var run = true;
	#region Renew resources
	double_jumps = max_double_jumps;
	airdodges = airdodges_max;
	#endregion
	#region Invulnerability
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
	#endregion
	#region Autocancel
	if (run && state_frame == 0)
		{
		//Aerial State
		state_set(PLAYER_STATE.aerial);
		hurtbox_inv_set(hurtbox, INV.invincible, respawning_inv_time, false);
		run = false;
		}
	#endregion
	#region Manual Cancel
	if (run && stick_tilted(Lstick))
		{
		state_set(PLAYER_STATE.aerial);
		hurtbox_inv_set(hurtbox, INV.invincible, respawning_inv_time, false);
	
		if (respawn_platform_change_facing)
			{
			if (sign(stick_get_value(Lstick, DIR.horizontal)) != 0)
				{
				facing = sign(stick_get_value(Lstick, DIR.horizontal));
				}
			}
	
		run = false;
		}
	#endregion
	//No movement
}