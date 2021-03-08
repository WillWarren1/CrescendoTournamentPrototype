///Standard_Lost
function Standard_Lost() {
	//Contains the standard actions for the lost state.
	//When a player is out of the match (loses all lives)
	speed_set(0, 0, false, false);
	x = room_width div 2;
	y = room_height div 2;
	hurtbox_inv_set(hurtbox, INV.invincible, 1);
	#region Share Stock (not implemented)
	#endregion
	//No movement
}