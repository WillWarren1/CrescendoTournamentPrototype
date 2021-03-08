///The custom script for adding a limit gauge
function custom_limit_gauge() {
	//This is not the ideal implementation of a limit gauge, but is the easiest
	var _limit_gauge_max = 500;

	//Handles the limit gauge
	if (state == PLAYER_STATE.in_hitlag && state_frame == 1)	
		{
		custom_script_struct.limit_gauge = min(_limit_gauge_max, custom_script_struct.limit_gauge + stored_hitstun);
		}
	if (state == PLAYER_STATE.attacking && attack_has_hit())
		{
		custom_script_struct.limit_gauge = min(_limit_gauge_max, custom_script_struct.limit_gauge + 1);
		}
	if (custom_script_struct.limit_gauge == _limit_gauge_max)
		{
		my_attacks[? "Fspec"] = fspec_cross_slash;
		if (state == PLAYER_STATE.attacking && attack_script == fspec_cross_slash)
			{
			custom_script_struct.limit_gauge = 0;
			my_attacks[? "Fspec"] = fspec_eiha;
			}
		}
	else
		{
		my_attacks[? "Fspec"] = fspec_eiha;
		}
	if (is_dead())
		{
		custom_script_struct.limit_gauge = 0;
		}
	return;


}
