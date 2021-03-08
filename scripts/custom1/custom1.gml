///The custom script for character1
function custom1() {
	//Floaty jump
	if (!variable_struct_exists(custom_script_struct, "float_frame"))
		{
		custom_script_struct.float_frame = 0;
		}
	if (state == PLAYER_STATE.aerial && jump_is_midair_jump && state_time == 0)
		{
		custom_script_struct.float_frame = 0;
		if (state_time == 0)
			{
			speed_set(0, 3, true, false);
			}
		}
	else
		{
		if ((state == PLAYER_STATE.aerial || (!on_ground() && state == PLAYER_STATE.attacking)) && 
			custom_script_struct.float_frame > 2 && custom_script_struct.float_frame < 19 && vsp > -12)
			{
			speed_set(0, -1.7, true, true);
			}
		custom_script_struct.float_frame++;
		}


}
