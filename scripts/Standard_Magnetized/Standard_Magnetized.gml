///Standard_Magnetized
function Standard_Magnetized() {
	//Contains the standard actions for the magnetized state.
	var run = true;
#region End Phase
	if (state_frame == 0)
		{
		state_set(PLAYER_STATE.aerial);
		run = false;
		}
#endregion
#region Move toward magnet goal
	if (run)
		{
		speed_set_towards_point(magnet_goal_x, magnet_goal_y, magnetbox_snap_speed);
		}
#endregion
	move();


}
