///Standard_Ledge_Snap
function Standard_Ledge_Snap() {
	//Contains the standard actions for the ledge snap state.
	var run = true;
	#region Move toward the ledge
	if (run)
		{
		speed_set_towards_point
			(
			ledge_id.x + (ledge_hang_relative_x * facing),
			ledge_id.y + (ledge_hang_relative_y),
			ledge_snap_speed
			);
		}
	#endregion
	#region Exit the state when the timer is done
	if (state_frame == 0)
		{
		//Snap to the ledge
		x = ledge_id.x + (ledge_hang_relative_x * facing);
		y = ledge_id.y + (ledge_hang_relative_y);
	
		run = false;
		state_set(PLAYER_STATE.ledge_hang);
		state_frame = 0; //The ledge hang frames counts up rather than down
		#region Ledge Trump
		//All of the other players grabbing the same ledge get trumped if they hung on the ledge for long enough
		if (ledge_trump_enable)
			{
			with(obj_player)
				{
				if (id == other.id) continue;
				//Check ledge and state
				if (ledge_id == other.ledge_id && state == PLAYER_STATE.ledge_hang && state_time > ledge_hang_min_time)
					{
					state_set(PLAYER_STATE.ledge_trump);
					hsp = ledge_trump_hsp * facing;
					vsp = ledge_trump_vsp;
					state_frame = ledge_trump_stun_time;
					}
				}
			}
		#endregion
		}
	#endregion
	move();
}