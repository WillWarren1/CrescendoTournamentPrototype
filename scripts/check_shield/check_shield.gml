///@func check_shield()
///@desc Allows players to shield when holding the button
function check_shield() {
	//If you are holding the shield button
	switch(shield_type)
		{
		case SHIELD_TYPE.melee:
			{
			if (button_hold(INPUT.shield))
				{
				//Change to shielding state
				state_set(PLAYER_STATE.shielding);
				state_frame = shield_min_time;
				return true;
				}
			break;
			}
		case SHIELD_TYPE.ultimate:
			{
			if (button_hold(INPUT.shield))
				{
				//Change to shielding state
				state_set(PLAYER_STATE.shielding);
				state_frame = shield_min_time;
				return true;
				}
			break;
			}
		case SHIELD_TYPE.rivals:
			{
			if (button(INPUT.shield, buff))
				{
				//Change to parrying state
				state_set(PLAYER_STATE.parrying);
				state_frame = parry_startup;
				return true;
				}
			break;
			}
		}
	return false;


}
