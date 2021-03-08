///Standard_Is_Grabbed
function Standard_Is_Grabbed() {
	//Contains the standard actions for the is_grabbed state.
	var run = true;
	#region Release
	//If the opposing player is no longer grabbing or throwing, break out of the grab
	if (grab_hold_id != noone && 
		grab_hold_id.state != PLAYER_STATE.grabbing && 
		grab_hold_id.state != PLAYER_STATE.attacking &&
		grab_hold_id.grabbed_id == id)
		{
		apply_damage(grab_hold_id, grab_release_damage);
		if (is_dead(grab_hold_id)) then exit;
		grab_release_held();
		run = false;
		}
	#endregion
	#region Unknown Grabber (crash)
	if (run && grab_hold_id == noone)
		{
		crash("grab_hold_id is set to noone");
		}
	#endregion
	//No Movement
}