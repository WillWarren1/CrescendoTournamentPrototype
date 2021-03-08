///@func check_parried()
function check_parried() {
	if (shield_type == SHIELD_TYPE.rivals)
		{
		if (has_been_parried)
			{
			has_been_parried = false;
			if (on_ground())
				{
				state_set(PLAYER_STATE.parry_stun);
				state_frame = parry_stun_time;
				}
			else
				{
				state_set(PLAYER_STATE.helpless);
				landing_lag = parry_stun_time;
				}
			return true;
			}
		}
	return false;
}