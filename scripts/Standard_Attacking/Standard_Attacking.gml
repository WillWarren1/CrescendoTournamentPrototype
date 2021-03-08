///Standard_Attacking
function Standard_Attacking() {
	//Contains the standard actions for the attacking state.
#region Attack Script
	//Calls the attack script
	if (attack_script != -1 && script_exists(attack_script))
		{
		script_execute(attack_script);
		}
	else
		{
		state_set(PLAYER_STATE.idle);
		}
#endregion
	//No movement in the Standard Attack Script - Individual attacks must move themselves!


}
