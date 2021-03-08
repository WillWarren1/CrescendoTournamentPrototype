///@func attack_stop([state],[reset_hitboxes],[parry_stun])
///@param [state]
///@param [reset_hitboxes]
///@param [parry_stun]
///@desc Stops an attack and resets the related variables
function attack_stop_ext() {
	var run = true;
	var _reset_hitboxes = argument_count > 1 ? argument[1] : true;
	var _parry_stun = argument_count > 2 ? argument[2] : true;

	//Reset attacking variables
	attack_phase = 0;
	attack_frame = 0;
	attack_script = -1;
	attack_draw_script = -1;
	can_hitfall = false;

	/*Do not reset landing lag!*/

	//Reset hitboxes
	if (_reset_hitboxes)
		{
		hitboxes_destroy_attached_all();
		hitbox_group_reset_all();
		any_hitbox_has_hit = false;
		any_hitbox_has_been_blocked = false;
		}

	//Parry Stun
	if (_parry_stun)
		{
		if run && check_parried() run = false;
		parry_stun_time = parry_default_stun_time;
		}

	//Set state (optional argument)
	if (run && argument_count > 0)
		{
		state_set(argument[0]);
		run = false;
		}
	else
		{
		if (on_ground())
			{
			state_set(PLAYER_STATE.idle);
			}
		else
			{
			state_set(PLAYER_STATE.aerial);
			}
		}


}
