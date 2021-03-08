///@func cancel_airdodge_check()
///@desc Cancels an attack if you can airdodge
function cancel_airdodge_check() {
	if (airdodges > 0 || airdodge_type == AIRDODGE_TYPE.brawl)
		{
		//Check if the dodge button is being pressed
		if (button(INPUT.shield, buff))
			{
			airdodges--;
			//Set the state
			attack_stop(PLAYER_STATE.airdodging);
			return true;
			}
		}
	return false;


}
