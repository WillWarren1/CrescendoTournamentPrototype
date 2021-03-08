///@func cancel_charge_check()
///@desc Cancels a "charging" attack.
function cancel_charge_check() {
	//Jump cancel
	if (cancel_jump_check()) 
		{
		return true;
		}	
	//Grounded Cancels
	if (on_ground())
		{
		//Roll
		if (stick_flicked(Lstick, DIR.horizontal, 0))
			{
			attack_stop(PLAYER_STATE.rolling);
			//Facing
			change_facing();
			//Set the rolling direction
			state_facing = sign(stick_get_value(Lstick, DIR.horizontal));
			return true;
			}
		//Spot dodge
		if (shield_type != SHIELD_TYPE.rivals && stick_flicked(Lstick, DIR.down))
			{
			//Set the state to spot dodging and stop the script.
			attack_stop(PLAYER_STATE.spot_dodging);
			state_frame = spot_dodge_startup;
			return true;
			}
		//Shield cancel
		if (check_shield())
			{
			attack_stop_preserve_state();
			return true;
			}
		}	
	//Airdodge cancel
	if (!on_ground() && check_airdodge())
		{
		attack_stop_preserve_state();
		return true;
		}	
	return false;


}
