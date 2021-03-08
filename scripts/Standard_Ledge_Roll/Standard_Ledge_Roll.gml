///Standard_Ledge_Roll
function Standard_Ledge_Roll() {
	//Contains the standard actions for the ledge roll state.
	var run = true;
#region Invincible
	//Set the invincibility to last through the roll's startup so it is completely safe
	hurtbox_inv_set(hurtbox, INV.invincible, roll_startup);
#endregion
#region No speed
	speed_set(0, 0, false, false);
#endregion
#region End Getup
	if (state_frame == 0)
		{
		ledge_getup_move();
		state_set(PLAYER_STATE.rolling);
		//Set the rolling direction to match the ledge facing direction
		state_facing = facing;
		}
#endregion


}
