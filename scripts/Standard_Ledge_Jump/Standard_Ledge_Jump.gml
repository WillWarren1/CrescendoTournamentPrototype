///Standard_Ledge_Jump
function Standard_Ledge_Jump() {
	//Contains the standard actions for the ledge jump state.
	var run = true;
#region Invincible
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
#endregion
#region No speed
	speed_set(0, 0, false, false);
#endregion
#region End Getup
	if (state_frame == 0)
		{
		ledge_getup_move();
		//Move the player 1 pixel off the ground
		if (!collision(x, y - 1, flags_create(FLAG.solid)))
			{
			y -= 1;
			}
		jump_is_midair_jump = false;
		jump_is_dash_jump = false;
		speed_set(ledge_jump_hsp * facing, -ledge_jump_vsp, false, false);
		state_set(PLAYER_STATE.aerial);
		}
#endregion


}
