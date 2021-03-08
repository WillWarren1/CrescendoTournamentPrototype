///@func cancel_air_check()
///@desc Cancels an attack if you are in the air
function cancel_air_check() {
	if (!on_ground())
		{
		attack_stop(PLAYER_STATE.aerial);
		return true;
		}
	return false;


}
