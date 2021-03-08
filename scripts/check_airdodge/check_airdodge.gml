///@func check_airdodge()
///@desc Transition to air dodge state if you press the button
function check_airdodge() {
	//If you have another airdodge
	if (airdodges > 0 || airdodge_type == AIRDODGE_TYPE.brawl)
		{
		//Check if the dodge button is being pressed
		if (button(INPUT.shield, buff))
			{
			airdodges--;
			//Set the state
			state_set(PLAYER_STATE.airdodging);
			return true;
			}
		}
	return false;
}