///Extra code that must be performed no matter what the state is!
function Standard_Extra() {
	//Resetting the jump counter / airdodge counter / wall jumps
	if (on_ground() && vsp >= 0)
		{
		double_jumps = max_double_jumps;
		jump_is_midair_jump = false;
		airdodges = airdodges_max;
		//Restore wall jump
		if (wall_jump_type == WALL_JUMP_TYPE.rivals)
			{
			wall_jumps = max_wall_jumps;
			wall_jump_timeout = 0;
			wall_cling_timeout = 0;
			}
		//Reset KO property
		if (state != PLAYER_STATE.in_hitlag && 
			state != PLAYER_STATE.in_hitstun && 
			state != PLAYER_STATE.in_balloon)
			{
			ko_property = noone;
			}
		}
	
	//Resetting fastfalling
	//It gets set to false after dropping through platforms
	if (stick_get_value(Lstick, DIR.down) < stick_tilt_amount)
		{
		can_fastfall = true;
		}
	
	//Shield Regeneration
	if (state != PLAYER_STATE.shielding && state != PLAYER_STATE.shield_break)
		{
		if (shield_type == SHIELD_TYPE.melee || shield_type == SHIELD_TYPE.ultimate)
			{
			shield_hp = min(shield_hp + shield_recover_rate, shield_max_hp);
			}
		}
	
	//Attack cooldown
	for(var i = ds_map_find_first(attack_cooldown); 
		ds_map_exists(attack_cooldown, i); 
		i = ds_map_find_next(attack_cooldown, i))
		{
		attack_cooldown[? i] = max(attack_cooldown[? i] - 1, 0);
		}

	//Ledge grab timeout
	ledge_grab_timeout = max(--ledge_grab_timeout, 0);

	//Wall Cling timeout
	wall_cling_timeout = max(--wall_cling_timeout, 0);

	//Wall Jump timeout
	wall_jump_timeout = max(--wall_jump_timeout, 0);


}
