///@func grab_release()
///@desc Attacking player goes into grab release, the defending player goes into hitstun
function grab_release() {
	if (grabbed_id.state == PLAYER_STATE.is_grabbed)
		{
		with(grabbed_id)
			{
			grab_release_held();
			}
		}
	//Grabber goes into a lag state
	state_set(PLAYER_STATE.in_grab_release);
	state_frame = grab_release_hitstun;
	apply_damage(id, grab_release_damage);
	if (is_dead()) then exit;


}
