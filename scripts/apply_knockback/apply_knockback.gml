///@func apply_knockback(angle,speed,hitlag)
///@param angle
///@param speed
///@param hitlag
function apply_knockback() {
	//These variables are just temporary holders.
	//After hitlag, hsp and vsp are set using these.
	knockback_dir = argument[0];
	knockback_spd = argument[1];
	
	//No movement during hitlag
	speed_set(0, 0, false, false);
	
	//Set state and the hitlag timer
	state_set(PLAYER_STATE.in_hitlag);
	state_frame = argument[2];
}