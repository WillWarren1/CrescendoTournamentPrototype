///Standard_Ledge_Tether
function Standard_Ledge_Tether() {
	//Contains the standard actions for the ledge snap state.
	var run = true;
	#region Move toward the ledge
	if (run)
		{
		//speed_set_towards_point(ledge_id.x,ledge_id.y,ledge_tether_snap_speed);
		speed_set_towards_point_accel
			(
			ledge_id.x + (ledge_hang_relative_x * facing),
			ledge_id.y + (ledge_hang_relative_y),
			2,
			ledge_tether_snap_speed
			);
		}
	#endregion
	#region Go to a ledge snap when the timer is done or if you reach the ledge
	if (state_frame == 0 || 
		(x == ledge_id.x + (ledge_hang_relative_x * facing) && y == ledge_id.y + (ledge_hang_relative_y)))
		{
		//Snap to the ledge
		x = ledge_id.x + (ledge_hang_relative_x * facing);
		y = ledge_id.y + (ledge_hang_relative_y);
	
		run = false;
		state_set(PLAYER_STATE.ledge_snap);
		state_frame = ledge_snap_time;
		//VFX
		fx_create(spr_shine_ledge_grab, 1, 0, 9, ledge_id.x, ledge_id.y, 2, irandom(360));
		}
	#endregion
	move();
}