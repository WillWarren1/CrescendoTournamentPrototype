///Standard_Ledge_Hang
function Standard_Ledge_Hang() {
	//Contains the standard actions for the ledge hang state.
	var run = true;
	#region Renew resources
	double_jumps = max_double_jumps;
	airdodges = airdodges_max;
	#endregion
	#region No speed
	speed_set(0, 0, false, false);
	#endregion
	#region Ledge Options
	if (state_time > ledge_hang_min_time)
		{
		#region Ledge Drift Away
		if (run &&
			(sign(stick_get_value(Lstick, DIR.horizontal)) != facing &&
			stick_tilted(Lstick, DIR.horizontal)))
			{
			run = false;
			state_set(PLAYER_STATE.aerial);
			hurtbox_inv_set(hurtbox, INV.normal, 0);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		#region Ledge Fall
		if (run && stick_tilted(Lstick, DIR.down))
			{
			run = false;
			state_set(PLAYER_STATE.aerial);
			hurtbox_inv_set(hurtbox, INV.normal, 0);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		#region Ledge Jump
		if (run && (button(INPUT.jump, buff) || stick_tilted(Lstick, DIR.up)))
			{
			run = false;
			state_set(PLAYER_STATE.ledge_jump);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		#region Ledge Roll
		if (run && button(INPUT.shield, buff))
			{
			run = false;
			state_set(PLAYER_STATE.ledge_roll);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		#region Ledge Getup
		if (run && 
			(sign(stick_get_value(Lstick, DIR.horizontal)) == facing &&
			stick_tilted(Lstick, DIR.horizontal)))
			{
			run = false;
			state_set(PLAYER_STATE.ledge_getup);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		#region Ledge Attack
		if (run && (button(INPUT.attack, buff)))
			{
			run = false;
			state_set(PLAYER_STATE.ledge_attack);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		}
	if (state_time >= ledge_hang_max_time)
		{
		#region Ledge Fall
		if (run)
			{
			run = false;
			speed_set(0, 1, false, false);
			state_set(PLAYER_STATE.aerial);
			hurtbox_inv_set(hurtbox, INV.normal, 0);
			//Cannot instantly regrab the ledge
			ledge_grab_timeout = ledge_grab_timeout_standard;
			ledge_id = noone;
			}
		#endregion
		}
	#endregion
	move();
}