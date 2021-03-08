///@func attack_start(attack)
///@param attack
///@desc Starts an attack and resets the related variables
function attack_start() {
	var _atk = argument[0];

	//Set the script
	if (script_exists(_atk))
		{
		attack_script = _atk;
		attack_draw_script = -1;

		//Check the cooldown
		if (attack_cooldown[? string(attack_script)] > 0)
			{
			//End the attack
			attack_script = -1;
			attack_draw_script = -1;
			return;
			}
	
		//Attack phase
		attack_phase = 0;
		attack_frame = 0;

		//Flags & variables
		can_hitfall = false;
		landing_lag = default_attack_landing_lag;
		parry_stun_time = parry_default_stun_time;

		//Set the state
		state_set(PLAYER_STATE.attacking);

		//Reset the hitboxes
		hitboxes_destroy_attached_all();
		hitbox_group_reset_all();
		any_hitbox_has_hit = false;
		any_hitbox_has_been_blocked = false;

		//Execute the first frame (the special start phase)
		script_execute(attack_script, PHASE.start);
		}
	else
		{
		log("Tried to start an attack script that doesn't exist! (", _atk, ")");
		}
	
	//Move to front
	Player_Move_To_Front();
}