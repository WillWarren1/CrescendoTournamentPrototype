///Standard_Parrying
function Standard_Parrying() {
	//Contains the standard actions for the parrying state.
	//This is the parry associated with the Rivals shield type, not the Ultimate parry.
#region Attack Script
	//Calls the parry script
	if (script_exists(parry_script))
		{
		script_execute(parry_script);
		}
	else
		{
		state_set(PLAYER_STATE.idle);
		}
#endregion
	//No movement in the Standard Parry Script - Must be inside the custom script!


}
