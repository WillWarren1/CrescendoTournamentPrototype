///@func grab_release_held()
///@desc Release the grabbed player with hitstun
function grab_release_held() {
	state_set(PLAYER_STATE.in_hitstun);
	speed_set(-facing * grab_release_hsp, grab_release_vsp, false, false);
	state_frame = grab_release_hitstun;
	apply_damage(id, grab_release_damage);
	if (is_dead()) then exit;
}